#!/usr/bin/env bash
# check.sh — offline check of this repository: the skill's references/ must be
# the verbatim cut of docs/orchestrator-manifest.md (build-references.sh --check).
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
bash -n .claude/skills/orchestrating-herdr-agents/build-references.sh
bash .claude/skills/orchestrating-herdr-agents/build-references.sh --check
echo "RESULT: PASS"
