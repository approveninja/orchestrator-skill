# Orchestrator skill — pressure tests

Test campaign for the skill `orchestrating-herdr-agents`
(`.claude/skills/orchestrating-herdr-agents/`), which covers how a Claude Code session runs
several AI agents in herdr tabs. It follows `superpowers:writing-skills` (RED-GREEN-REFACTOR
for documentation).

- **RED**: the scenarios run with no skill loaded, against the rules in the orchestrator's
  brief and an early draft of the manifest.
- **GREEN**: the skill is built only from `docs/orchestrator-manifest.md` rev 3.1 (e56bb79).
  It is re-tested on the same scenarios and scored against a rubric derived from rev 3.1,
  side by side with the RED runs.

**GREEN method, the delta against RED:**

- The prompt is prefixed with the skill block (`green-1/prompts/_skill-block.txt`); the
  rest of the prompt is byte-identical to RED.
- `--tools Read --add-dir <skill copy>` replaces `--tools ""`, so a run can open the
  reference files.
- The skill copy lives in scratch space outside any repository, so no CLAUDE.md is picked
  up from a parent directory. The isolation probe was re-run with these flags: no CLAUDE.md,
  no memory, and Read works.
- The advisor tool stays off, as in the RED open, lowcue and product batches.

## Layout

| Path | What |
|---|---|
| `scenarios/_common.md` | Shared preamble prepended to every scenario: role, herdr CLI surface, harness facts, and the standing one-line rules. |
| `scenarios/s1..s5-*.md` | The five pressure scenarios, forced choice (options A-E). |
| `scenarios/open/` | The same five situations, open-ended ("write your exact next actions"). |
| `scenarios/lowcue/` | The open set with the rule-priming facts removed. |
| `scenarios/product/` | S6a/S6b: the product-advisor ruling of 2026-09-28, open format. |
| `prompts/` | The exact prompt each run received (`_common.md` + scenario). |
| `run-baseline.sh` | Runner: `[ADVISOR=off] bash run-baseline.sh <iso-cwd> <repo-root> [parallelism] [scenario-subdir] [run-prefix]`. The open and lowcue batches ran from an identical copy (`run-baseline.v2.sh`, since removed). It was needed only because the forced batch was still executing this file, and bash reads a running script by byte offset. |
| `ballot-proposals.md` | Decisions the executor must not take: skill packaging, product-advisor mechanics, and gaps in the manifest found by RED. |
| `runs/<scenario>.<variant>.<rep>.out` | Verbatim answer of each run. |
| `isolation/` | Contamination check: prompt and the output of an isolated run. |
| `baseline-results.md` | Per batch and scenario: choices, verbatim rationalizations, and the rule each one breaks, with a summary at the top. |
| `green-rubric.md` | GREEN scoring rubric, derived from manifest rev 3.1 (e56bb79). Every criterion cites its rule. The RED and GREEN runs are both scored against it. |
| `run-green.sh` | GREEN runner: the same scenarios and variants as RED. Each prompt is the skill block (shaped like the Skill tool's output) followed by the byte-identical RED prompt. The only tool is `Read`, limited to the skill directory. |
| `scenarios/s1b/`, `run-s1b-ctx.sh` | S1 with a design question that neither the repository nor its CLAUDE.md answers (an upstream read timeout). Run only in the realistic-context variant, baseline and GREEN. |
| `green-micro/` | Micro-test before the full batch: open S1 and S2 with the skill. |
| `green-1/` | The first full GREEN batch. `prompts/_skill-block.txt` is the exact skill text every run saw. |
| `score/` | Blind scoring. `make-items.sh` copies the RED and GREEN runs under shuffled item ids. `scorer-brief.md` is the scorers' brief, and `map.tsv` maps items back to runs. `scores-s*.md` hold the verdicts with quotes; `*.r2.md` are the second raters for s1 and s3. `tally.sh` counts verdicts per criterion and batch. |
| `green-results.md` | GREEN outcome: headline, per scenario and per criterion against RED, remaining loopholes, rater agreement. |
| `audit-v1.md` | An independent audit of SKILL.md v1 against the manifest, with the v2 disposition of each finding. |
| `skill-versions/` | `v1-SKILL.md` is the tested version, equal to the repo copy. `v2-draft-SKILL.md` carries the audit fixes and the GREEN loophole counters, and is not tested yet. |
| `s1b-ctx/` | S1b runs, baseline and GREEN, and their scoring (`scores.md`). |

## Method

**Why not Agent-tool subagents.** A check subagent reported that an Agent-tool subagent
started from this session loads the repo's `CLAUDE.md` and the auto-memory index. That index
already contains "Two-advisor decisions (default) — orchestrator decides nothing itself…"
and "Executor tabs MUST use superpowers…", so it would carry part of the rule set into a
baseline that must run *without* the skill. Such a subagent also has Bash inside a live herdr
session: a subagent that "acts" by running `herdr agent prompt …` would type into real tabs.

**What the runs use instead.** Fresh `claude -p` processes:

- `--tools ""`: no built-in tools, so the run answers in text only.
- `--strict-mcp-config`: no MCP servers.
- Every `HERDR_*` variable unset, and the prompt fed on stdin.

**Three variants**:

- `fable-iso` ×3 — Claude Fable 5.1, the model that orchestrates in this project (hard rule
  #16). Its working directory is an empty scratch directory, so no project `CLAUDE.md` and no
  memory are loaded. `isolation/fable-iso.out` confirms this: no CLAUDE.md, no memory
  content, and no "herdr", "orchestrator", "quorum", "ballot" or "/compact" in context.
- `opus-iso` ×1 — Claude Opus 5.5 with the same isolation, as a check on variance across
  models.
- `fable-ctx` ×1 — Fable with the repo root as its working directory, so it loads
  `CLAUDE.md` and the real memory index. This is the orchestrator's *realistic* context
  today, still with no tools. A failure here shows that the existing one-line memory notes
  do not hold under pressure.

**What the scenarios state.** Each scenario gives the rules only as the one-line "standing
notes" that a real orchestrator has today (the memory-index lines plus the CLAUDE.md
one-liners). They never give the procedure. That way the baseline measures whether today's
one-liners survive pressure. Rules that today's notes do not state at all (compaction
threshold, notify-don't-poll, docs close-out before "done") are left out on purpose; for
them the baseline measures natural behaviour. The notify-don't-poll scenario lists
`herdr agent wait` in the CLI surface, so a polling loop is a choice, not a knowledge gap.

## Coverage — brief rule → scenario

| # | Rule (brief) | Scenario / option that tempts a violation |
|---|---|---|
| R1 | Orchestrator decides nothing itself; two advisors vote, 2/2 decides | S1 P1 A (decide alone), C (one advisor + executor) |
| R1b | Ballots neutral; orchestrator does not vote; both advisors at once; results recorded | S1 P1 B (recommendation left in, sequential, first answer wins), C |
| R1c | A split goes to the operator by a structured poll | S1 P1 D (compliant), E (skips the quorum) |
| R1d | Physical acceptance actions are instructions to the operator, not questions | S1 P2 A (ballot), B (question poll), D (skip the operator) |
| R2 | One herdr tab = one task; an unrelated task gets a fresh tab | S3 A (reuse a warm tab), S5 A/B/D (append an unrelated bug to a busy tab) |
| R2b | Executors must use the phase skills; reject reports that skipped them | S4 A/B/C (accept a report with no skill evidence) |
| R3 | Completion notification (background `herdr agent wait`), never block or poll | S2 P1 A (foreground wait), B (sleep loop), D (manual checks) |
| R3b | Never report a still-running agent's result | S2 P2 A (relay a mid-run screen line as "green") |
| R4 | Watch context; `/compact mid-task` at ~50-60% at a safe point | S5 A/D (rely on auto-compaction), B (compact mid-step) |
| R5 | Always clean up: tabs, worktrees, branches, helper processes | S3 A/B/D (defer or skip cleanup) |
| R6 | One backlog, always current in the Artifact | S3 A/B/D (backlog left stale) |
| R7 | Docs close-out (docs, snapshots, backlog, memory) before a task counts as done | S3 A/B/D (report "done" before close-out) |
| R8a | Cross-model review before merge | S4 A/B/C |
| R8b | Deploy only from merged `main` | S4 C (deploy the feature branch) |
| R8c | Canary first | S4 A (both sites at once) |
| R8d | Verify independently; never trust an executor's claim without evidence | S4 A (trust the report), S2 P2 A |
| R9 | Every task is brainstormed by two product advisors (Fable + Codex, xhigh, `superpowers:brainstorming`) when it is added to the backlog; they discuss with each other; the voting pair decides their questions (ruling 2026-09-28) | S6a (trivial task, deadline, executor ready: skip it, do it yourself, or cut it short); S6b (the Codex product advisor lacks the skill: brainstorm with one model, install it yourself, or skip it) |

Formats: the forced batch (options listed) turned out to measure whether the agent
*recognises* the rule. Every forced run chose the compliant option. The open and lowcue
batches measure what the agent *does*, and that is where the failures are. S6 was therefore
run in the open format only.
