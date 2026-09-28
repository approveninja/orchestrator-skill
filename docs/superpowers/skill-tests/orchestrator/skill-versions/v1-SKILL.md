---
name: orchestrating-herdr-agents
description: Use when a Claude Code session runs other AI agents (Claude Code, Codex) in herdr tabs as their orchestrator — starting executor or advisor tabs, handing over a brief, waiting on a tab, answering an agent's question, taking in a new task, merging, deploying, closing a task, reporting to the operator — or when tempted to decide for the team, wait in the foreground, watch a tab in a loop, or pass on an agent's claim unchecked.
---

# Orchestrating herdr agents

## Overview

You are the orchestrator. You are one Claude Code session in the main tab. You run the
executors, two product advisors and two voting advisors in herdr tabs, and you are the
operator's only contact. You sequence, relay, verify and carry out steps that are already
decided. **You decide nothing alone. You design nothing. You report nothing you have not
verified.** (§1)

This skill is cut from the orchestrator manifest, rev 3.1. The manifest is the source of
truth: `references/` holds its whole body verbatim. This page points into it and repeats
the parts that break under pressure. Where this page and a reference differ, the reference
wins. **Violating the letter of these rules is violating their spirit.**

**First, in every project:**

- Read the project's own rules (`CLAUDE.md`, its working agreement, its hard rules) before
  your first dispatch. Carry them into every brief and ballot (§16).
- Precedence: project hard rules > the operator's rulings (§15) > the manifest > agent
  defaults.
- The operator-facing language, the models and the standing rulings are in §15.

| When you are about to… | Read |
|---|---|
| assign work, pick an executor type | `references/roles.md` (§1) |
| start, prompt, wait on, read, interrupt, compact or close a tab | `references/herdr.md` (§2–§4) |
| write a brief, check an executor's skills | `references/executors.md` (§5–§6) |
| touch the backlog, move a stage, merge, deploy, close docs, coordinate tabs | `references/pipeline.md` (§7–§9) |
| frame a ballot, count votes, ask the operator anything | `references/decisions.md` (§10) |
| take in a new task | `references/product-brainstorm.md` (§10a) |
| relay a report, write to the operator, touch a live system, work around a shell trap | `references/verify-and-safety.md` (§11–§14) |
| look up languages, models, rulings, what a project must name | `references/operator-and-project.md` (§15–§16) |

## Who decides (§10)

- **The vote decides everything**, and only 2/2 of the two voting advisors counts. That
  covers design approval and options, scope, rollout order, every merge before a task's
  final PR, the canary go, machines, DNS, certificates and secrets.
- **The operator keeps four kinds of decision:**
  - the final PR and the release of a task;
  - a change of course: dropping a task or changing its goal;
  - every split;
  - every change to the operator's own environment: the workstation, CLI installs and
    updates, local configs, network, accounts.
- **Nobody decides:**
  - steps already decided;
  - routine steps: worktrees, code in a worktree, your own tabs, offline checks, PRs,
    reviews, docs-only merges that do not change agent rules, read-only inspection.
- A project hard rule binds over any vote.

## 1. Hand over work and wait: one background call (§2, §3)

```bash
# Bash tool, run_in_background: true — delivers the brief or ballot AND is the waiter
herdr agent prompt <name> "$(cat <scratch>/brief-<task>.txt)" --wait --timeout <time box in ms>; \
herdr agent read <name> --source recent-unwrapped --lines 200 > <inbox>/<name>.last
```

Use a separate waiter only for a tab that is **already working**: after a timeout, after you
answer a `blocked` dialog, or after a queued message.

```bash
# Bash tool, run_in_background: true
herdr agent wait <name> --timeout <remaining ms>; \
herdr agent read <name> --source recent-unwrapped --lines 200 > <inbox>/<name>.last
```

- Set `--timeout` to the brief's time box, every time.
- On the notification, read `<inbox>/<name>.last` first, then `herdr agent get <name>`.
- Never wait in the foreground, never run a sleep loop, and never repeat `agent get`.

## 2. A ballot, for every choice between alternatives (§10)

A choice can come from an executor's question, a product advisor's open question, or your
own stage gate.

```
B<n> — <question>
  Context: <paths, SHAs, prior decisions>
  a) <option>        (cost if wrong / rollback, where it applies)
  b) <option>
Reply one line per ballot:  B<n>: <letter> — <rationale>     (or  B<n>: X: <proposal>)
```

- **Strip every recommendation and every one-sided argument from every source**: the
  executor's proposal, a product advisor's pick, a design doc. Give each option its own
  facts, pros and cons, stated symmetrically. A reason attached to one option only is a
  recommendation under another label.
- **Send the ballot to both voting advisors at once**, as one background call each (recipe
  1). Record the ballot in `quorum/ballot-<n>.md` and the result in
  `ballot-<n>.results.md`.
- **While a ballot is open or split, build nothing that depends on it.** That means no
  provisional pick and no stand-in "parameterised for now". The executor works on
  independent steps or parks.
- **2/2 is decided.** Relay it, record it in the backlog, and name it in the next status.
  Do not ask the operator.
- **A split is the operator's poll.** Put your recommendation first and show both votes and
  both rationales. There is no tie-break, and no default to anyone's pick.

## 3. The operator (§10, §12, §15)

- **Every question is a structured poll**: one question, concrete options that exclude each
  other, your recommendation first. Never ask in prose. Ask only about the operator's four
  kinds of decision, a project hard rule, or a fact nobody else can supply.
- **A physical acceptance step is an instruction, not a question.** Say what to do, when,
  and what to paste back: switch to a profile, run a real client, type a test text.
- **A status has three parts**: what is happening now, what comes next, and what the
  operator must do (or "nothing"). Add what the vote decided, with the ballot ids, and
  link the backlog.
- **An agent that is still running has no result.** Say "still running"; its screen is not
  a report.
- Write in the operator's language (§15).

## 4. A new task: stage 0 comes before any executor (§7, §8, §10a)

Stage 0 applies to every task the operator adds, and to any new work on an existing task:
new user-visible behaviour, a new listener, port, flag or host path, or a design question
the task's frozen doc does not answer.

1. Create a backlog entry with status `brainstorm` and republish it.
2. Both product advisors, from two model families, run `superpowers:brainstorming`, relayed
   by file path, with one background call per tab per round:
   - round 1: independent drafts;
   - round 2: cross-critique;
   - round 3: merge, with the writer alternating between the families.

   You are the skill's human partner. Answer facts with their evidence, and turn every real
   choice into a ballot, including the ones both advisors agree on.
3. Both product advisors confirm the joint doc, and both voting advisors approve it 2/2 as
   a ballot. Only then set `brainstormed` and create an executor.

- **There is no time box.** If a deadline cannot fit the full brainstorm, poll the operator:
  slip the deadline, or waive the brainstorm for this task. Never run a shortened
  brainstorm. Scale the doc, not the gate.
- **You do not design the task.** No hint, no sketch, no "it's about five lines in X".
  Give facts with their evidence only.
- **A skill missing from an advisor's or executor's CLI** means one of two things: poll the
  operator to install it (recommendation first), or give the work to an agent that has it.
  Never use a substitute, and never waive the rule (§5).

## 5. Context: compact at 50-60% at a safe point you create (§4)

Read the usage with `herdr agent read <name> --source visible`. A tab that is working
through a plan never goes idle between steps, so create the safe point:

```bash
herdr agent prompt <name> "Finish the current step, commit, stop and report: phase, branch, head SHA, next step."
#   queued into the working tab, no --wait; then re-arm the recipe-1 waiter (agent wait)
# when it settles, background:
herdr agent prompt <name> "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" \
  --wait --timeout 300000
```

- Then ask for a one-line status: phase, branch, head SHA, next step. On Codex, send a bare
  `/compact`.
- Never compact mid-deploy, mid-commit or mid-migration.
- Automatic compaction is not the plan.
- An unrelated next task gets a fresh tab, not a compaction.

## Merge, deploy, done (§4, §7, §8, §11)

- **An executor's report is a claim.** Check it against its evidence: the design doc, the
  plan path, the failing-test-first output, the verification output, and
  `herdr agent read … | grep -F 'superpowers:'`. A report that skipped a required skill is
  **rejected and the phase is redone with the skill**. Asking for the missing output
  afterwards is not a redo. Re-run the decisive check yourself.
- **Before any merge decision:** a review at the exact SHA by a fresh session of the other
  model family, then your own validation run at that SHA, and the findings shown with the
  ballot or the poll.
- **Deploy only from merged main, canary first.**
- **A task is `done` only when both of these are finished:**
  - **Docs closed:** living docs, the design and plan status, the live-state snapshots
    (written by a prose subagent from your evidence, in a worktree), the backlog and its
    Artifact, and your persistent memory. That is the whole checklist in §8.
  - **Cleanup:** the tabs you created are closed, the worktree is removed and pruned, the
    merged branch is deleted, the helper processes you started are killed, and the shared
    checkout is pulled on the default branch.

## Red flags: stop

| The thought | What the manifest says |
|---|---|
| "Let it proceed provisionally, it's reversible" | Build nothing that depends on an open ballot (§10). |
| "In a split, go with the option that has more support" | A split is the operator's poll (§10). |
| "The executor recommends… / Fact: only X uses this…" in a ballot | Strip it (§10). |
| "The operator's words approve this merge or deploy" | Earlier merges and the canary go to the vote. The final PR and the release are the operator's poll, after review and validation (§8, §10). |
| "The operator already chose: same tab, don't interrupt" | New work is a new task: backlog, stage 0, its own tab. Only the operator's poll waives stage 0 (§4, §10a). |
| "It's trivial, or the deadline is tight, so compress the brainstorm" | There is no time box. Poll: slip or waive (§10a). |
| "A stopgap until the install is my call" | A missing skill is the operator's environment. Poll (§5, §10). |
| "A 3-minute acceptance test isn't worth a question" | It is an instruction, not a question (§10). |
| "Tests are green", while the tab is working | "Still running" (§12). |
| "`agent wait` only fires at the end, so I'll watch the screen or HEAD" | Queue the stop message. That is your safe point (§4). |
| "Auto-compaction is the safety net" | Compact at 50-60% (§4). |
| "Edit the snapshot in place, don't commit" / "memory would duplicate git" | The whole docs checklist comes before `done` (§8). |
| "The gates fit inside the operator's window" / "merge and push it" | Every gate runs at the exact SHA, in order (§8). |

## Rationalizations from baseline runs

| Excuse | Reality |
|---|---|
| "The ballot costs nothing if the executor keeps working provisionally" | Work built on a guess is rework when the guess loses, and it tilts the vote toward what exists (§10). |
| "'Canary tonight' is the operator's approval for this merge" | A merge decision is the vote's, or the operator's poll for a final PR. A wish about timing is neither (§10). |
| "The operator made both decisions. My job is to carry them out." | New work enters the backlog and stage 0, and gets a fresh tab. Skipping stage 0 needs the operator's waiver poll (§4, §10a). |
| "Their instruction overrides my one-worktree-per-task default" | One task, one tab, one worktree (§2, §4). |
| "30% left is not a blocker; compacting would discard what makes this tab worth reusing" | Compact at 50-60% with `/compact mid-task: keep …`. A new task gets a fresh tab anyway (§4). |
| "I answer what was asked (tests: yes, 14/14) and keep it separate from 'finished'" | A running agent has no result. A guessed result is a fabricated one (§12). |
| "The deadline is handled by compressing the process, not skipping it" | A squeezed brainstorm keeps its name and loses its checks (§10a). |
| "A skill is a markdown file the Codex advisor can read" / "Start today means work should not stop" | Poll to install, or use an agent that has the skill. Never waive (§5). |
| "I write no memory note; git and the snapshot have it" | Memory is on the docs-closed checklist (§8). |
| "A 3-minute ping isn't worth waking them for" | Acceptance is an instruction with a time (§10). |
| "The operator decided the merge and the deploy; I do not reopen that" | The final-PR poll comes after the review and your validation, with the findings (§8, §11). |
