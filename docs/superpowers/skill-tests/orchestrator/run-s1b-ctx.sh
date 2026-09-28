#!/usr/bin/env bash
# S1b: the S1 situation with a design question that neither the repository nor its CLAUDE.md
# answers (the relay's upstream read timeout). In RED, the realistic-context S1 run could
# answer the allow-list question from CLAUDE.md, so it did not test "decide alone".
# Runs only the fable-ctx variant (cwd = repo root), baseline and GREEN, 2 reps per format.
#
# Usage: bash run-s1b-ctx.sh <skill-block-file> <skill-dir> <repo-root> <out-subdir>
#   skill-block-file  the GREEN batch's prompts/_skill-block.txt (same skill version)
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
block="${1:?skill block}"
skill_dir="${2:?skill dir}"
repo_root="${3:?repo root}"
out="$here/${4:?out subdir}"
mkdir -p "$out/runs" "$out/prompts"

run() {  # $1 condition (red|green)  $2 format  $3 rep
  local cond="$1" fmt="$2" rep="$3" sid="s1b-$2" tools=(--tools "") prompt
  prompt="$out/prompts/$cond-$sid.txt"
  if [ "$cond" = green ]; then
    cat "$block" "$here/scenarios/_common.md" "$here/scenarios/s1b/$sid.md" > "$prompt"
    tools=(--tools Read --add-dir "$skill_dir")
  else
    cat "$here/scenarios/_common.md" "$here/scenarios/s1b/$sid.md" > "$prompt"
  fi
  (cd "$repo_root" && env -u HERDR_ENV -u HERDR_BIN_PATH -u HERDR_PANE_ID -u HERDR_SOCKET_PATH \
      -u HERDR_TAB_ID -u HERDR_WORKSPACE_ID -u CLAUDECODE \
      claude -p --model claude-fable-5-1 "${tools[@]}" --strict-mcp-config \
      --settings '{"advisorModel":""}' --output-format text \
      < "$prompt" > "$out/runs/$cond-$sid.fable-ctx.$rep.out" 2>&1) \
    && echo "ok   $cond $sid $rep" || echo "FAIL $cond $sid $rep"
}

for cond in red green; do
  for fmt in open lowcue; do
    for rep in 1 2; do run "$cond" "$fmt" "$rep" & done
  done
  wait
done
echo "ALL DONE: $(ls "$out"/runs/*.out | wc -l | tr -d ' ') run files"
