#!/usr/bin/env bash
# GREEN runs for the orchestrator skill: the same scenarios and variants as the RED baseline
# (run-baseline.sh), with the skill loaded. Every prompt is the injected skill block, followed
# by the byte-identical RED prompt (_common.md + the scenario). The only tool is Read,
# limited by --add-dir to the skill's own directory, so the run can open the reference
# files the way a real session would.
#
# Variants per scenario, as in RED:
#   fable-iso ×3   Claude Fable 5.1, cwd = an empty scratch dir (no project CLAUDE.md, no memory)
#   opus-iso  ×1   Claude Opus 5.5, same isolation
#   fable-ctx ×1   Claude Fable 5.1, cwd = the repo root (loads CLAUDE.md + the memory index)
# Safety: --tools Read only, --strict-mcp-config, every HERDR_* variable unset, the advisor
# tool removed (as in the RED open/lowcue/product batches), stdin fed from the prompt file.
#
# Env SCEN_GLOB narrows the scenario files (default s*.md), e.g. "s[12]-*.md" for a micro-test.
# Usage: bash run-green.sh <skill-dir> <iso-cwd> <repo-root> <parallelism> <out-subdir> <scenario-subdir> <run-prefix> [<scenario-subdir> <run-prefix>]...
#   skill-dir   a copy of the skill (SKILL.md + references/) outside any repository
#   out-subdir  where runs and prompts go, e.g. green-1 -> green-1/runs, green-1/prompts
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
skill_dir="$(cd "${1:?skill dir}" && pwd -P)"
iso_cwd="${2:?iso cwd}"
repo_root="${3:?repo root}"
par="${4:?parallelism}"
out_dir="$here/${5:?out subdir}"
shift 5
mkdir -p "$out_dir/runs" "$out_dir/prompts"

# The skill block, shaped like the Skill tool's output: base directory, then the body
# without its frontmatter.
block="$out_dir/prompts/_skill-block.txt"
{
  printf '## Skill loaded at the start of this session: orchestrating-herdr-agents\n\n'
  printf '(You invoked this skill with the Skill tool when the session started. Exception to "You have\n'
  printf 'no tools" below: your only tool here is Read, and you may use it only to open this\n'
  printf 'skill'"'"'s own files under its base directory. Everything else you answer in text.)\n\n'
  printf 'Base directory for this skill: %s\n\n' "$skill_dir"
  awk '/^---$/ { fm++; next } fm >= 2' "$skill_dir/SKILL.md"
  printf '\n---\n\n'
} > "$block"

jobs=()
while [ "$#" -ge 2 ]; do
  scen_dir="$here/$1"; prefix="$2"; shift 2
  for s in "$scen_dir"/${SCEN_GLOB:-s*.md}; do
    sid="$prefix$(basename "$s" .md)"
    cat "$block" "$here/scenarios/_common.md" "$s" > "$out_dir/prompts/$sid.txt"
    for rep in 1 2 3; do jobs+=("$sid fable-iso $rep"); done
    jobs+=("$sid opus-iso 1" "$sid fable-ctx 1")
  done
done

run_one() {
  local sid="$1" variant="$2" rep="$3" model cwd out
  case "$variant" in
    fable-iso) model=claude-fable-5-1; cwd="$ISO_CWD" ;;
    opus-iso)  model=claude-opus-5-5;  cwd="$ISO_CWD" ;;
    fable-ctx) model=claude-fable-5-1; cwd="$REPO_ROOT" ;;
  esac
  out="$OUT_DIR/runs/$sid.$variant.$rep.out"
  if (cd "$cwd" && env -u HERDR_ENV -u HERDR_BIN_PATH -u HERDR_PANE_ID -u HERDR_SOCKET_PATH \
        -u HERDR_TAB_ID -u HERDR_WORKSPACE_ID -u CLAUDECODE \
        claude -p --model "$model" --tools Read --add-dir "$SKILL_DIR" --strict-mcp-config \
        --settings '{"advisorModel":""}' --output-format text \
        < "$OUT_DIR/prompts/$sid.txt" > "$out" 2>&1); then
    echo "ok   $sid $variant $rep"
  else
    echo "FAIL $sid $variant $rep (exit $?)"
  fi
}
export -f run_one
export OUT_DIR="$out_dir" SKILL_DIR="$skill_dir" ISO_CWD="$iso_cwd" REPO_ROOT="$repo_root"

printf '%s\n' "${jobs[@]}" | xargs -P "$par" -L 1 bash -c 'run_one "$@"' _
echo "ALL DONE: $(ls "$out_dir"/runs/*.out | wc -l | tr -d ' ') run files in $out_dir/runs"
