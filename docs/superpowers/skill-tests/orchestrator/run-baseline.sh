#!/usr/bin/env bash
# RED baseline for the orchestrator skill: run every pressure scenario through fresh,
# tool-less `claude -p` processes and keep each answer verbatim under runs/.
#
# Variants per scenario:
#   fable-iso   Claude Fable 5.1, cwd = an empty scratch dir (no project CLAUDE.md, no memory)
#   opus-iso    Claude Opus 5.5, same isolation
#   fable-ctx   Claude Fable 5.1, cwd = the repo root (loads CLAUDE.md + the auto-memory
#               index the real orchestrator has today) — still no tools
# Safety: --tools "" (no built-in tools), --strict-mcp-config (no MCP servers), every
# HERDR_* variable unset, stdin fed from the prompt file.
#
# Usage: bash run-baseline.sh <iso-cwd> <repo-root> [parallelism] [scenario-subdir] [run-prefix]
#   scenario-subdir defaults to "scenarios" (forced choice); "scenarios/open" = open-ended.
#   run-prefix is prepended to each run name (e.g. "open-").
# Env ADVISOR=off adds --settings {"advisorModel":""}, which removes the advisor tool that
# user settings otherwise give every run (default: on, like the real orchestrator).
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
iso_cwd="${1:?iso cwd}"
repo_root="${2:?repo root}"
par="${3:-4}"
scen_dir="$here/${4:-scenarios}"
prefix="${5:-}"
mkdir -p "$here/runs" "$here/prompts"

jobs=()
for s in "$scen_dir"/s*.md; do
  sid="$prefix$(basename "$s" .md)"
  cat "$here/scenarios/_common.md" "$s" > "$here/prompts/$sid.txt"
  for rep in 1 2 3; do jobs+=("$sid fable-iso $rep"); done
  jobs+=("$sid opus-iso 1" "$sid fable-ctx 1")
done

run_one() {
  local sid="$1" variant="$2" rep="$3" model cwd out
  case "$variant" in
    fable-iso) model=claude-fable-5-1; cwd="$ISO_CWD" ;;
    opus-iso)  model=claude-opus-5-5;  cwd="$ISO_CWD" ;;
    fable-ctx) model=claude-fable-5-1; cwd="$REPO_ROOT" ;;
  esac
  out="$HERE/runs/$sid.$variant.$rep.out"
  local extra=()
  [ "${ADVISOR:-on}" = off ] && extra=(--settings '{"advisorModel":""}')
  if (cd "$cwd" && env -u HERDR_ENV -u HERDR_BIN_PATH -u HERDR_PANE_ID -u HERDR_SOCKET_PATH \
        -u HERDR_TAB_ID -u HERDR_WORKSPACE_ID -u CLAUDECODE \
        claude -p --model "$model" --tools "" --strict-mcp-config "${extra[@]}" --output-format text \
        < "$HERE/prompts/$sid.txt" > "$out" 2>&1); then
    echo "ok   $sid $variant $rep"
  else
    echo "FAIL $sid $variant $rep (exit $?)"
  fi
}
export -f run_one
export HERE="$here" ISO_CWD="$iso_cwd" REPO_ROOT="$repo_root"

printf '%s\n' "${jobs[@]}" | xargs -P "$par" -L 1 bash -c 'run_one "$@"' _
echo "ALL DONE: $(ls "$here"/runs/*.out | wc -l | tr -d ' ') run files"
