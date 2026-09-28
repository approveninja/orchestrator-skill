# Orchestrator manifest

How one Claude Code session runs several AI agents working in herdr tabs. herdr is a
terminal multiplexer for coding agents: it hosts each agent (Claude Code, Codex, …) in its
own tab or pane and gives the orchestrator a `herdr` CLI to start, prompt, watch, read and
interrupt them (`herdr --skill` prints its own usage guide). The main body is
project-agnostic; the last section binds it to one repository.

**Precedence.** The project's own rules (hard rules, working agreement) > this manifest >
any agent's defaults. No brief, ballot or vote can set a project rule aside.

---

## 1. Roles

| Role | Owns | Never does |
|---|---|---|
| **Orchestrator** — one Claude Code session, the main tab | sequencing, supervision, verification, ballot framing and records, relaying between the product-advisor tabs and playing their skill's human partner (§10a), executing decided steps, every production action, the backlog, all operator communication | taking a decision alone, voting, designing a task itself, large edits, prose drafting |
| **Product advisor** ×2 — one herdr tab each, different model families, separate from the voting advisors | the product brainstorm of every new task under `superpowers:brainstorming`: an independent draft, a critique of the other's draft, the joint design doc (§10a) | decisions (every open question goes to a ballot), writing anything but its own files in the scratch folder the orchestrator names, commits, host access, herdr commands, messages to other tabs or the operator |
| **Voting advisor** ×2 — one read-only herdr tab each, different model families | votes on every decision, including every question a product brainstorm raises; second opinions, design review (code review goes to a fresh session of the other model, §8) | edits, commits, host access, herdr commands, messages to other tabs |
| **Executor** — one herdr tab per task, Claude or Codex | investigation, root cause, design, plan, code, offline tests, local commits in its own worktree | production, push/PR/merge (unless the phase grants it), creating or driving tabs, decisions, contact with the operator |
| **Prose subagent** — Sonnet by default, Opus when the text needs technical judgement | docs, state snapshots, PR bodies, reports, translations | decisions, host access |

- **Orchestrate; don't implement.** — The orchestrator's context is the scarcest resource;
  large edits burn it and leave nobody supervising the other tabs.
- **Take no decision alone** — every decision goes to the vote of the two voting advisors
  (§10). — The orchestrator frames the options; deciding them too removes the only
  independent check.
- **Brainstorm every new task before any executor exists** — two product advisors, relayed
  rounds, one joint design doc (§10a). — An executor that designs alone builds the first
  framing it finds; two model families and a vote on every question catch the wrong
  problem before any code exists.
- **Run four advisor tabs, two roles:** two product advisors design, two voting advisors
  decide. — An advisor that votes on its own draft is not an independent check.
- **Every tab is born from the main tab and reports back to it.** Executors never create
  tabs or start agents; their own in-session subagents are fine. — One owner knows the
  whole topology.
- **Send prose-only work to a subagent.** — Drafting text is cheap for a smaller model and
  expensive for the session that has to keep every thread in its head.
- **Be the only channel to the operator.** — Executors and advisors send questions to the
  orchestrator; two voices reaching the operator contradict each other.
- **Review with the other model family.** — The same model misses the same things;
  Claude's work is reviewed by Codex and Codex's by Claude.
- **Keep executors off production.** Collect host evidence yourself and hand it over; allow
  read-only inspection by an executor only when the project permits it and the brief grants
  it by name. — The orchestrator must know about every connection made to a live system.

## 2. herdr mechanics

Confirm you are inside herdr before any control command; outside it the CLI drives someone
else's session.

```bash
test "${HERDR_ENV:-}" = 1 || { echo "not inside herdr"; exit 1; }
herdr agent list                                  # live agents: agent_status, focused, pane_id
herdr tab list --workspace "$HERDR_WORKSPACE_ID"
```

**Create a worktree and a tab for an executor:**

```bash
git -C <repo> worktree add <repo>/.claude/worktrees/<task> -b <branch> origin/main
#   or: herdr worktree create --workspace "$HERDR_WORKSPACE_ID" --branch <branch> --base origin/main --no-focus
herdr tab create --workspace "$HERDR_WORKSPACE_ID" --cwd <worktree> --label <task> \
  --env ORCH_INBOX=<inbox> --no-focus
#   pane id for the next step: .result.root_pane.pane_id
```

**Start the agent** (native agent arguments go after `--`):

```bash
# Claude executor; --name makes it identifiable as a peer session (§3b),
# --settings adds the optional Stop hook (§3c)
herdr agent start <name> --kind claude --pane <pane_id> --timeout 120000 -- \
  --model <model> --effort xhigh --name <task> --settings <scratch>/executor-settings.json
# Codex read-only voting advisor
herdr agent start <name> --kind codex --pane <pane_id> --timeout 120000 -- \
  -m <model> -c model_reasoning_effort=xhigh -s read-only -a never --search
# Codex product advisor: tab cwd = the brainstorm scratch folder, which workspace-write
# makes its writable workspace; the rest of the repo stays read-only to it (§10a)
herdr agent start <name> --kind codex --pane <pane_id> --timeout 120000 -- \
  -m <model> -c model_reasoning_effort=xhigh -s workspace-write -a never --search
```

- **Give each agent a unique name** (`[a-z][a-z0-9_-]{0,31}`) and address it by name, never
  by focus. — The focused pane may belong to the operator or another client.
- **Start the tab in the executor's worktree, and name the worktree and base SHA in the
  brief too.** — A tab on the shared checkout edits files that other sessions switch
  branches under.
- **Pass the model explicitly on every start and every `codex exec`.** — A missing config
  key pins nothing; the CLI default drifts.
- **Use `--dangerously-skip-permissions` only with a strict brief** (explicit MAY / MUST NOT,
  worktree cwd, no production). — It removes the last guard between the brief and the shell.
- **On `agent_not_ready`, read the screen before sending anything.** A Codex "Update
  available" prompt blocks startup: choose Skip with `herdr agent send-keys <name> …`;
  update the CLI only when the operator asks. — Blind keystrokes can accept the wrong dialog.

**Hand over a brief:**

```bash
herdr agent prompt <name> "$(cat <scratch>/brief-<task>.txt)" --wait --until working --timeout 60000
```

- **Keep briefs in files**; the part shared by every executor in a phase is one common file.
  — Quoting long text inline breaks, and a file is a record.
- **`--until working` returns as soon as the agent has picked the brief up;** then arm the
  completion waiter (§3). A timeout or `agent_prompt_stalled` does not prove the brief was
  lost: `herdr agent read` before re-sending. — A duplicate brief makes the agent do the
  work twice.
- **Never type into a tab the operator may be using.** If `herdr agent get <name>` shows
  `"focused": true`, do not send; wait, or tell the operator first. — Your text would land
  in the middle of theirs.

**Read, interrupt, close:**

```bash
herdr agent read <name> --source recent-unwrapped --lines 200   # the report is the last ⏺ block
herdr agent send-keys <name> esc       # interrupt a Claude agent
herdr agent send-keys <name> ctrl+c    # interrupt a Codex agent
herdr tab close <tab_id>               # only tabs you created
```

- **If the report does not fit the read,** ask the agent to write it to a file and reply
  with the path only.
- **`blocked` is a dialog; `unknown` is not completion.** Read the screen, then answer —
  default deny for anything outside the brief.
- **Close only what you created; never run `herdr server stop`; never kill the herdr
  process.** — Other people's agents live in the same server.

## 3. Completion notifications — never block, never poll

Rule: **one background waiter per dispatched brief or ballot.** The orchestrator hands the
work over, arms a notification, and goes back to work; the harness wakes it when the tab
settles. (a) is the primary mechanism and always works; (b) and (c) complement it.

**(a) Primary — `herdr agent wait` as a background task of the orchestrator's harness.**
`herdr agent wait` blocks on herdr's socket API until the agent reaches a settled state
(default: `idle`, `done` or `blocked`) — event-driven, no polling loop. It tracks lifecycle
state, not a turn, so arm it only AFTER `agent prompt … --until working` has confirmed the
agent is working; on an already-idle agent it returns at once.

```bash
# 1. foreground, returns in seconds
herdr agent prompt <name> "$(cat <scratch>/brief-<task>.txt)" --wait --until working --timeout 60000
# 2. background (Claude Code Bash tool: run_in_background: true); the harness notifies on exit
herdr agent wait <name> --timeout <time box in ms>; \
herdr agent read <name> --source recent-unwrapped --lines 200 > <inbox>/<name>.last
```

- **Match `--timeout` to the brief's time box** — the `TIME BOX` line of §6 (e.g. ~30 min
  to the first report → `1800000`). A timeout exits non-zero: read the tab before
  re-arming. — A silent tab past its time box is itself news.
- **On the notification, read `<inbox>/<name>.last` first,** then `herdr agent get <name>`
  for the state (`blocked` needs an answer, `idle`/`done` means a report is waiting).
- **Never replace this with a sleep loop or repeated `agent get` calls.** — Polling burns
  turns and context, and misses short state changes.

**(b) Claude executors — the peer-session idle notice.** Claude Code sessions on the same
machine appear in the orchestrator's `ListAgents` as peer sessions. From the main
conversation, `SendMessage` to that session with `notify_when_idle: true` and an empty
message subscribes to exactly one `[Cross-session idle notice]` when it next goes idle or
exits.

- **Name executor sessions at start** (`-- --name <task>`). — Without a name, herdr-hosted
  Claude sessions show generic names and cannot be told apart.
- **Re-subscribe per brief;** the notice is one-shot. Send briefs through
  `herdr agent prompt`, not through `SendMessage`. — One delivery path keeps the record in
  one place.
- **Codex tabs are not covered;** use (a).
- **The notice can be diverted:** a session in a different permission mode (e.g. started
  with `--dangerously-skip-permissions`) may hold cross-session traffic for its user's
  approval, and the notice may then reach only the operator — another reason (a) is primary.

**(c) Optional durable record — a `Stop` hook that writes to a shared inbox.** Start Claude
executors with `--settings <scratch>/executor-settings.json`, so every finished turn
appends one JSON line; the record survives the orchestrator's own compaction or restart.

```json
{"hooks": {"Stop": [{"hooks": [{"type": "command", "command": "bash <scratch>/orch-stop-hook.sh"}]}]}}
```

```bash
#!/usr/bin/env bash
# Claude Code Stop hook: one JSON line per finished turn into the orchestrator's inbox.
cat >/dev/null   # the hook's own JSON arrives on stdin; drain it
jq -nc --arg tab "${HERDR_TAB_ID:-unknown}" --arg time "$(date -u +%FT%TZ)" \
      --arg branch "$(git branch --show-current 2>/dev/null)" \
      --arg head "$(git rev-parse --short HEAD 2>/dev/null)" \
      '{tab:$tab, time:$time, branch:$branch, head:$head}' >> "${ORCH_INBOX:-/tmp}/stops.jsonl"
```

- **Test the hook once on a scratch tab before relying on it.** — A broken hook fails
  silently from the orchestrator's point of view.
- **Codex has its own mechanism** (a `notify` program in its config, run at turn end); wire
  it the same way if a durable record of Codex tabs is needed.

## 4. Tab supervision and lifecycle

- **One tab = one task.** — A tab's context is the task's working memory; a second task
  inherits the first one's assumptions. The four advisor tabs — two product advisors, two
  voting advisors — are the exception: one role, one long-lived tab each, and the
  compaction rule below applies to them like to any other tab.
- **Watch every executor, product-advisor and voting-advisor tab actively:** on each
  notification, and at every stage gate or brainstorm round, read its state, its last
  output and its context usage. — Problems caught early cost minutes; caught at review,
  they cost a rework.
- **Compact at 50-60% context used.** Claude Code shows usage in its status line (e.g.
  `189k (81% left)`); Codex shows its own "context left" figure. Read it with
  `herdr agent read <name> --source visible`. At a safe point — the agent idle, between
  steps, never mid-deploy, mid-commit or mid-migration — send:

  ```bash
  herdr agent prompt <name> "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" \
    --wait --timeout 300000
  ```

  (Codex: a bare `/compact`.) Then ask for a one-line status (phase, branch, head SHA,
  next step) to confirm the
  essentials survived. — Automatic compaction at the limit fires at the worst moment and
  keeps the wrong things.
- **Unrelated next task → fresh tab, not compaction.** Close the old tab and start a new one
  with its own worktree and brief. — Compaction keeps residue; a fresh tab starts clean.
- **Clean up after every task, merged or abandoned** (pipeline stage 16):

  ```bash
  herdr tab close <tab_id>                                        # tabs you created only
  git -C <repo> worktree remove <worktree> && git -C <repo> worktree prune
  git -C <repo> branch -d <branch>                                # merged branches only
  ps -ax -o pid,command | grep -i '[c]odex'                       # e.g. review brokers you started
  ```

  Kill only helper processes you started; never force-remove a worktree with uncommitted
  work without the operator's say-so. — Leftovers pile up, hold branches, and confuse the
  next session.

## 5. Skills are mandatory in executor tabs

Executor tabs are full agents, and every executor MUST use the matching superpowers skill
for each phase. The brief names the required skill(s); a report that skipped one is
rejected and the phase is redone with the skill.

| Phase / situation | Required skill |
|---|---|
| Any design or creative work, open design questions | `superpowers:brainstorming` |
| Before implementation | `superpowers:writing-plans` (then `superpowers:executing-plans` or `superpowers:subagent-driven-development` to carry the plan out) |
| While implementing | `superpowers:test-driven-development` |
| Any bug, test failure or unexpected behaviour | `superpowers:systematic-debugging` |
| Before reporting done | `superpowers:verification-before-completion` |
| Asking for review / handling review findings | `superpowers:requesting-code-review` / `superpowers:receiving-code-review` |

- **Name the skills in every brief** (the `SKILLS` line of §6). — An executor cannot be
  held to a rule it was not given.
- **Demand evidence of each skill in the report:** the design doc from brainstorming, the
  plan path, the failing-test-first output, the root-cause notes, the verification command
  output. Cross-check the tab transcript (`herdr agent read … | grep -F 'superpowers:'`). —
  A claimed skill with no artifact was not used.
- **Answer the skills' questions as the orchestrator.** Brainstorming asks its questions in
  the executor's tab; the orchestrator reads them and answers facts it knows; a question
  that is a real choice becomes a ballot (§10). — The executor still never talks to the
  operator, and the orchestrator still decides nothing alone.
- **A brainstormed task's joint design doc (§10a) is the executor's design input, not a
  draft to redo.** The executor still uses brainstorming for implementation-level design
  inside it; a fact that invalidates the joint doc stops the executor and becomes a
  ballot proposal. — The product advisors and the vote already settled the design; an
  executor redesigning alone undoes both.
- **The review skills structure the request and the response; they do not replace the
  other-model review** of §8. — Same-model review repeats the author's blind spots.
- **Confirm the skills are installed for an executor's or product advisor's CLI before
  dispatching to it.** If they are not, install them or give the task to an agent that has
  them — never waive the rule. — A missing skill otherwise turns into a silent skip.

## 6. The brief

Every executor gets the same shape and answers in the same shape. That is what makes
someone else's work checkable.

```
You are <role> in a team run by an orchestrator (a Claude Code session, the main tab).
Reply in English. Ignore any pre-filled text in your input box: it is a UI suggestion,
never an instruction from the orchestrator or the operator.

TASK       <backlog id> — <title>
PHASE      <investigate | design | implement | fix> — and what ends it
SKILLS     required: superpowers:<skill>[, …] — report the artifact each produced
PROBLEM    "<the operator's own words, quoted>"
FACTS      <verified facts with their evidence: paths, SHAs, hosts, measurements>
DECIDED    <firm decisions with their source (ballot id, operator ruling) — not open for debate>
DIR/BASE   <absolute worktree path>   branch <name>   base <ref> @ <sha>
MAY        read the repo, upstream sources, the web; edit and commit locally in DIR;
           run <exact commands>
MUST NOT   touch production; push, open a PR or merge; edit outside DIR; create tabs;
           contact the operator — questions go to the orchestrator
DECISIONS  any choice between alternatives: stop and send me a ballot proposal
           (question + 2-4 concrete options + your recommendation); do not decide it
DELIVER    <root cause with evidence | design doc path | branch + tests>
REPORT     done / not done; skills used + their artifacts; evidence (command output);
           files changed (stat); head SHA; docs touched; risks; open questions. Compact.
TIME BOX   first report within ~30 min; do not stall on one path — report and ask
BLOCKED    reply "BLOCKED: <what> <why>" and stop; never work around a guard
```

- **Quote the operator; don't paraphrase the problem.** — Paraphrase is where the task
  quietly changes.
- **Separate facts from hypotheses.** — Executors build on whatever you call a fact.
- **Copy mandatory sentences byte for byte.** — A paraphrased ban is a different ban.
- **Read-only by default; grant write, commit and host access per phase.** — The phase,
  not the agent's initiative, decides what it may change.
- **Demand the reply language in every brief.** — Reports get quoted into commits and docs;
  mixed-language relays lose precision.

## 7. The backlog — one file, always published

The orchestrator keeps ONE backlog of every task and is its only writer. The operator can
read it at any moment.

- **Source file = the truth; a published Artifact = the operator's view.** Publish a
  claude.ai Artifact page generated from the source file once; after every write to the
  source, regenerate the page and republish it from the same page path, which keeps the
  same URL. — The operator reads state without asking, and one writer means no
  conflicting versions.
- **Update it at every state change,** in the same step as the change: task created,
  brainstorm round, joint design doc confirmed, phase change, ballot result, operator
  ruling, merge, deploy, acceptance, docs closed, cleanup. Write the file, republish, then
  send the status. — A backlog updated "later" is already wrong when the operator looks.
- **A new task enters at `brainstorm`** and stays there until the product brainstorm's
  gate is passed (§10a); only then does it become `brainstormed` and may an executor be
  created for it. — The design exists before anyone starts building.
- **If a republish fails, say so in the next status.** — The operator must know the page
  is stale.
- **No secrets, passwords or session links in it.** — It is a shareable page.

One entry per task:

```
| id | title | status | owner tab | design doc | branch / PR | next step | blocked-on | decisions | docs closed |
|----|-------|--------|-----------|------------|-------------|-----------|------------|-----------|-------------|
| T3 | <title> | operator acceptance | <tab> | <link to joint doc> | <branch> / #<n> | operator tests the canary by hand | operator | B12, B20, B21 | no: snapshot pending |
```

`status` is exactly one of: `brainstorm` (stage 0 running), `brainstormed` (stage 0's gate
passed), the name of a §8 stage from stage 1 on, in lower case (e.g.
`operator acceptance`), or `done`. `design doc` links the task's joint design doc (§10a) —
a path while it lives in scratch space, the repository path once it is committed.
`decisions` lists ballot ids and dated operator rulings. A task is **done** only when
`docs closed` is `yes` and cleanup is finished.

## 8. The phase pipeline

A task moves through these gates in order, starting at stage 0 the moment it enters the
backlog; each gate has named evidence and a backlog update. Skip a gate only where the
project's rules exempt that class of change (e.g. docs-only); stage 0 has no exemption —
a small task scales its doc down, never the gate (§10a). Which rules govern which stage:

- **Stage 0** runs in the two product-advisor tabs under `superpowers:brainstorming`, by
  the rounds of §10a.
- **The executor stages** — 1 (investigate), 2 (root cause), 3 (design doc), 6 (plan,
  code, offline tests) and the executor's half of 8 (fix) — run under the skills of §5.
- **The advisor, vote and review stages** — 4 (design review), 5 (decisions), 7 (code
  review) and the reviewer's half of 8 — are governed by §10 and the review rules below.

| # | Stage | Who | Exit evidence |
|---|---|---|---|
| 0 | Product brainstorm — at backlog entry | two product advisors, relayed by the orchestrator (§10a); every open question to the voting advisors | joint design doc confirmed by both product advisors; every blocking question has a ballot result or operator ruling; status `brainstormed` |
| 1 | Investigate, read-only | executor | findings, each with its evidence |
| 2 | Root cause | executor → orchestrator | one mechanism that explains every symptom |
| 3 | Design doc | executor, in its worktree | doc path + SHA (for a brainstormed task: the joint design doc committed in the worktree) |
| 4 | Cross-model design review | voting advisor of the other family | ACCEPT, or only implementation-level findings left |
| 5 | Decisions — and whenever a choice arises at any later stage | vote of the two voting advisors; splits to the operator | ballot results / operator rulings recorded |
| 6 | Plan + code + offline tests | executor, local commits only | branch, head SHA, test output |
| 7 | Code review at an exact SHA | the other model, fresh session | "no actionable findings" at that SHA |
| 8 | Fix; re-review every later commit | executor, reviewer | clean review at the final SHA |
| 9 | Independent validation | orchestrator | its own run of the repo's checks at that SHA |
| 10 | Merge decision → push, PR, merge | vote (or the operator where reserved); orchestrator executes | merge commit on main |
| 11 | Canary deploy from merged main | orchestrator; prose subagent for the snapshot | dry run, real run, read-only verification, idempotent re-run with zero changes; live-state snapshot updated — written by a prose subagent from the orchestrator's evidence, checked by the orchestrator |
| 12 | Operator acceptance | operator's hand actions | operator-produced evidence |
| 13 | Fleet rollout | orchestrator; prose subagent for the snapshots | the canary checks per target; live-state snapshots updated the same way as in stage 11 |
| 14 | Docs closed | prose subagent writes, orchestrator checks | the §8 docs checklist, every item ticked |
| 15 | Backlog final | orchestrator | entry `done`, `docs closed: yes` |
| 16 | Cleanup | orchestrator | §4 checklist done |

- **For a brainstormed task, the joint design doc replaces the executor's own
  brainstorming design** (stages 1–3): the executor investigates against it, commits it
  into its worktree as the stage-3 design doc, and designs only the implementation inside
  it. A fact from stages 1–2 that invalidates the doc is a ballot (§10), not the
  executor's call. — The design was already brainstormed and voted; only new evidence
  reopens it, and only through the vote.

**Code review commands** (record the SHA first; review from inside the worktree):

```bash
git -C <worktree> rev-parse HEAD                     # the SHA under review
# from a Claude Code session: /codex:review          (fresh, read-only Codex thread)
cd <worktree> && node "<codex plugin dir>/scripts/codex-companion.mjs" review --wait --base origin/main --scope branch
# non-interactive fallback
codex exec -m <model> -s read-only "Review origin/main..<sha> in <worktree> against <spec>. Reply in English." </dev/null
```

- **Iterate design review until ACCEPT or only implementation-level findings remain.** —
  Further design rounds have diminishing returns; code review catches the rest.
- **Tie every test run, review and merge decision to one SHA.** — Any later commit voids
  them: re-run the checks and re-review at the new SHA.
- **Run the validation yourself before the merge ballot.** — An executor's "all green" is
  a claim, not evidence.
- **The orchestrator pushes and opens the PR** (or tells the executor to, in that phase's
  brief). — Nothing leaves the machine without passing the orchestrator's own check.
- **Stop an executor after two approach defects.** An expected red test in a
  write-test-fix loop does not count; an infrastructure failure does not count — fix the
  environment and restart. — A third blind attempt rarely converges.
- **Deploy only from merged main, canary first:** dry run (`--check --diff`), real run,
  read-only verification, then an idempotent re-run that must report zero changes. — Two
  sessions deploying different branches silently revert each other.
- **Persist enablement in versioned configuration**, never a one-off command-line flag. —
  The next routine deploy would silently revert a flag-only canary.
- **Merge code dark; arm the canary with a separate one-line change** once the canary is
  approved. — The merge stays low-risk and the canary starts on a decision, not a side
  effect.
- **Update the live-state snapshot after each deploy, from its evidence — never before.**
  A prose subagent writes it from the evidence the orchestrator collected; the
  orchestrator checks every claim in it against that evidence. — A doc that predicts a
  result is read later as a record of it.

**Docs closed — the gate after acceptance and fleet, before cleanup.** A task whose docs are
not closed stays open. Tick every item:

- [ ] Living docs the change affects: architecture and how-to sections, runbooks, operator
      guides — updated to the new behaviour.
- [ ] Design and plan docs marked with their final state (implemented / superseded /
      abandoned, with the merge SHA or PR).
- [ ] Live-state snapshots and inventories match what was verified after the last deploy.
- [ ] Backlog entry updated (`docs closed: yes`), Artifact republished.
- [ ] The orchestrator's own persistent memory updated with anything non-obvious learned
      (a trap, a changed rule, a new mechanism).

— Docs that lag the system are how the next session repeats a solved problem.

## 9. Coordination between tabs

- **One owner per shared artifact.** A fixture or file several branches need is written and
  committed by one tab first; the others cherry-pick that commit by SHA. — Two copies
  conflict at merge and drift in content.
- **Implement in parallel; merge and deploy one at a time, in a written order with its
  dependencies** (the order lives in the backlog). — One change per deploy keeps blast
  radius small and attribution clean.
- **Rebase the next branch on the new main after each merge,** re-run its checks, and
  re-review if its diff changed. — The review covered the old base, not the new one.
- **Route every cross-tab finding through the orchestrator;** tabs never message each other.
  — Only the orchestrator knows whether a finding changes another tab's brief.
- **Keep changes separable:** each branch touches its own files; edits to shared docs are
  small, separate hunks. — Rebases stay mechanical.
- **Never let two executors, or an executor and a deploy, share a worktree or a target.**

## 10. Decisions — the two-advisor vote

This is the default operating mode, not an exception. **The orchestrator takes no decision
by itself.** A decision is any choice between alternatives that changes the outcome —
design options, scope, rollout order, merge, canary go/no-go, an exception to a plan.
Executing a step that is already decided is not a decision.

Ballots come from three sources: an executor's ballot proposal, every open question a
product brainstorm raises (§10a — deduplicated across the two product-advisor tabs), and
the orchestrator's own stage gates (§8).

**The voters**

- **Two voting advisors from different model families**, both at the highest reasoning
  effort, each in its own strictly read-only herdr tab, separate from the product
  advisors. — Different families fail differently.
- **The orchestrator does not vote.** — It writes the options and shares a model family
  with one voting advisor; its vote would not be independent.
- **Write `protocol.md` once** (rules in force, revision-numbered) and point both voting
  advisors at it.

**The ballot**

- **Neutral:** question, context (paths, SHAs, prior decisions), 2-4 concrete options, no
  recommendation. Strip an executor's or product advisor's recommendation before the
  ballot goes out.
- **Irreversible or outward-facing options state the cost of being wrong and the rollback
  path.**
- **Each voting advisor picks exactly one option** with a 1-3 sentence rationale, or writes
  `X: <proposal>` when every option is wrong; an X matches only a materially identical X.
- **Send the ballot to both at once** (`herdr agent prompt … --until working` to each, one
  §3 waiter each); neither sees the other's vote first.

```
B<n> — <question>
  Context: <paths, SHAs, prior decisions>
  a) <option>        (cost if wrong / rollback, where it applies)
  b) <option>
Reply one line per ballot:  B<n>: <letter> — <rationale>     (or  B<n>: X: <proposal>)
```

**The result**

- **A decision stands only if both voting advisors pick the same option (2/2).** There is
  no tie-break.
- **Go to the operator with a structured poll** — concrete options, the two votes and
  rationales shown, one question per poll — for:
  - any split;
  - anything touching the operator's own environment (workstation, network, accounts);
  - anything that would revise an earlier operator ruling;
  - anything the project's rules reserve to the operator — rules cannot be voted away.
- **A poll after a split shows the options, both votes and both rationales.** Whether it
  also marks a recommended option is an open question for the operator: this section keeps
  ballots neutral and the orchestrator out of the vote, while a project rule may require
  every poll to lead with a recommendation. The project's bindings record the conflict
  until the operator settles it (§15).
- **Never ask the operator in prose,** and publish any document the question depends on
  before the poll. — Polls are answered in seconds and leave a clean record.
- **Fleet go/no-go rests on operator-produced acceptance evidence.**
- **The operator can decide any ballot directly.** Withdraw it, record the ruling verbatim
  with its date, and tell both voting advisors their votes on it are void.
- **Physical acceptance actions are instructions, not questions.** Tell the operator what
  to do and when (switch a profile, type a test text, use a real client). — The vote
  replaces questions; it never replaces the operator's hands.
- **Adopt side concerns as numbered requirements** (C1, C2, …) when both voting advisors
  raise or accept them; they then bind executors and product advisors like decisions.
- **Record every ballot and result in files,** and the decision ids in the backlog:

```
quorum/
  protocol.md               rules in force, revision-numbered
  dispatch-<n>-common.txt   shared part of a phase brief
  ballot-<n>.md             questions, context, options (neutral)
  ballot-<n>.results.md     each vote with rationale, the decision, adopted concerns
  ballot-<n>.operator.md    an operator override or split ruling, quoted and dated
```

## 10a. The product brainstorm — two product advisors

Every task is brainstormed the moment it enters the backlog, before any executor exists
for it: two product advisors design it with `superpowers:brainstorming`, the voting
advisors decide every question the brainstorm raises (§10), and the orchestrator relays,
records and gates. This is pipeline stage 0 (§8).

**The product advisors**

- **Two product advisors from different model families,** both at the highest reasoning
  effort, each in its own long-lived herdr tab, separate from the two voting advisors. —
  Different families frame the same request differently, and a voter that also drafted
  would be judging its own work.
- **Both run `superpowers:brainstorming` for every task;** confirm the skill is installed
  for each CLI first (§5). — The skill is what turns a first idea into a checked design.
- **Read-only except their own files.** Each writes only its draft, its critique and —
  when it is the task's writer — the joint doc, in a scratch folder the orchestrator names
  (one subfolder per task). Start a Codex product advisor with its cwd in that folder under
  `-s workspace-write` (§2). A Claude product advisor has no equivalent write sandbox:
  start it in a tab whose cwd is that folder, never with `--dangerously-skip-permissions`,
  and answer its permission prompts yourself — writes inside its scratch folder only,
  default deny. — A design tab that writes elsewhere is an unsupervised executor.
- **They never talk to each other directly, never to the operator; they never touch hosts
  or herdr, and never change a working tree** (reading the repository is fine).
  Everything between the two tabs passes through the orchestrator. — The orchestrator
  must see every exchange to route its questions to the vote.
- **Brief them with the project's relevant hard rules as already-decided constraints**
  (the `DECIDED` line below), with the operator's words quoted and the verified facts. — A
  brainstorm that reopens a hard rule spends a round on an option nobody may pick.

**The rounds** — relay by file path, never by pasting text; one §3 waiter per tab per
round.

1. **Round 1 — independent drafts.** Both brainstorm the task on their own; neither sees
   the other's work. Each writes its own draft file. — A second draft written after
   reading the first is only an edit of it.
2. **Round 2 — cross-critique.** Each receives the path of the other's draft and writes a
   critique of it. — The critique catches what the draft's own family misses, and it
   stands in for the skill's section-by-section approval.
3. **Round 3 — merge.** One product advisor writes the joint design doc from both drafts
   and both critiques; the other confirms it or objects. The writer alternates between the
   two model families task by task. Disagreement left after the merge goes to a ballot. —
   Alternating keeps one family's framing from becoming the house style.

- **Every open question, in any round, goes to a ballot (§10).** — The product advisors
  design; they do not decide.

**The orchestrator plays the skill's human partner.** `superpowers:brainstorming` stops for
its human partner's answers and approvals; in a product-advisor tab the orchestrator takes
that role, as §5 already has it for executors.

- **Answer the facts you know, with their evidence; turn every real choice into a ballot**
  and relay the result. — The operator is not in this loop, and the orchestrator still
  decides nothing.
- **Deduplicate across both tabs:** the same question asked by both gets one answer and
  one ballot, relayed to both. — Two ballots on one question can come back with two
  different decisions.
- **Replace section-by-section approval with the round-2 cross-critique;** the skill's final
  approval is the gate below. — Otherwise each tab stalls waiting for a human who is not
  there.
- **Allow a product advisor to batch its clarifying questions** when that saves relay
  rounds; otherwise the skill's one-question-at-a-time default stands. — Every relay is a
  round trip through the orchestrator.
- **Every draft, critique and joint doc is a file,** on every path of the skill — including
  the bounded and spike paths that would otherwise present their design in chat. — A design
  that lives only in a tab's scrollback cannot be relayed by path or recorded.

**The output — one joint design doc per task**

- **Keep it in the orchestrator's scratch space while the task waits in the backlog,** with
  a "Decisions" section listing every ballot id and operator ruling it relies on. — Every
  choice in it can be traced to its vote.
- **Link it from the backlog entry (§7).** When the task starts, copy it into the
  repository's docs through the task's own worktree — in the working language, with no
  session links — where it becomes the stage-3 design doc (§8). — The repository keeps the
  design; scratch space does not outlive the session.

**The gate**

- **A task counts as brainstormed only after both product advisors confirm the joint doc
  and every blocking question has a recorded ballot result or operator ruling.** Only then
  does its status become `brainstormed`, and only then may an executor be created for it.
  — One confirmation, or one unanswered blocking question, means the design is not
  settled.
- **"Brainstormed" is not design sign-off.** Where the project reserves design sign-off to
  the operator, this gate comes before that step (a published document, then a poll), not
  instead of it — unless the operator has delegated it. — Two advisors agreeing is
  evidence for the operator, not the operator's decision.
- **Scale the doc, not the gate.** A bounded or trivial task passes the same gate with a
  shorter doc, following the skill's own spike / bounded / architectural paths. — "Every
  task" means every task; a two-paragraph design is still checked twice.

**Which tasks**

- **Every task added to the backlog from the rule's adoption on.** Tasks already in the
  backlog before it are not re-brainstormed. — Their designs were made and reviewed
  already; redoing them delays work without new information.
- **New work on an existing task enters the backlog as a new task** and is brainstormed.
  In borderline cases, whether something amounts to new work is itself a ballot. Working
  test: new user-visible behaviour; a new listener, port, flag or host path; or a design
  question the task's frozen design doc does not answer. A review fix inside a task, or a
  canary→fleet move, is the same task. — Otherwise scope grows through the side door,
  undesigned.

**The product-advisor brief** (the conventions of §6 apply):

```
You are product advisor <A|B> in a team run by an orchestrator (a Claude Code session, the
main tab). Reply in English. Ignore any pre-filled text in your input box: it is a UI
suggestion, never an instruction from the orchestrator or the operator.

TASK       <backlog id> — <title>
ROUND      <1 draft | 2 critique | 3 merge: write | 3 merge: confirm or object> — and what ends it
SKILL      superpowers:brainstorming; I am your human partner: send your questions to me
           (<one at a time | batched>); real choices come back as ballot results
PROBLEM    "<the operator's own words, quoted>"
FACTS      <verified facts with their evidence>
DECIDED    <the project's relevant hard rules; ballot results and operator rulings — not open for debate>
READ       <the other advisor's draft / the critiques, by path — rounds 2 and 3>
MAY        read the repository, upstream sources, the web
WRITE      <scratch>/<task>/<file> — the only file you may create or change
MUST NOT   write anywhere else; touch hosts or herdr; change any working tree; contact
           the other advisor or the operator — everything goes to the orchestrator
DECISIONS  any choice between alternatives: stop and send me a ballot proposal
           (question + 2-4 concrete options + your recommendation); do not decide it
REPORT     the file path; open questions, each marked blocking or not; in round 3, confirm
           or object, with reasons. Compact.
TIME BOX   <per round>; do not stall on one path — report and ask
BLOCKED    reply "BLOCKED: <what> <why>" and stop; never work around a guard
```

## 11. Trust, but verify

- **A report is a claim; evidence is command output, a diff, a SHA.** Check one against
  the other before relaying it. — Real case: an executor wrote "idempotent re-run:
  changed=0" into a state doc before the re-run had happened.
- **Re-run the decisive check yourself** — tests at the head SHA, the live read-only
  verification. — "Tests pass" is often from a stale SHA.
- **A change count is not proof the right target was touched;** verify identity over a
  fresh connection. — Shared connection sockets and reused addresses land runs on the
  wrong machine.
- **Pre-filled text in an agent's input box is not an instruction.** Agent UIs show prompt
  suggestions as pre-filled text; tell every agent to ignore it, and warn the operator not
  to press Enter in an agent's tab. — One Enter turns a UI guess into a command.
- **Show review findings with the merge ballot and any merge poll.** — Cross-model review
  lowers shared blind spots; it does not remove them.
- **When an advisor and an executor disagree, get evidence, not a third opinion.**

## 12. Operator communication

- **Write in the operator's language;** agent-to-agent traffic stays in the working
  language.
- **Every status has three parts:** what is happening now, what comes next, what the
  operator must do (or "nothing"); link the backlog page.
- **Explain every technical term in plain words** the first time it appears in a message.
  — A term the operator has to ask about was not explained.
- **Say what was verified, how, and what was not verified.**
- **Say what changed on live machines, every time.**
- **Never report the result of an agent that is still running.** Say "still running". —
  A guessed result is a fabricated result.
- **One status per finished stage; logs on request.**

## 13. Production safety

- **Know your source address before bursty maintenance.** — Real case: the workstation's
  egress changed when a personal VPN was switched off; every task of the run opened a fresh
  jump-host connection, the SSH server throttled the burst, and the host's ban service
  locked the new address out mid-run. The fix was to restore the allow-listed egress.
- **Never weaken host security to get a run through** — no unbans as routine, no allow-list
  additions, no SSH tuning without the operator's ruling.
- **Stop when a host becomes unreachable mid-run;** tell the operator and do not retry in
  a loop. — Retries extend a ban and hide the cause.
- **Pace connection-heavy runs:** few forks, a retry budget, tag selection to shorten runs.
- **One target group per run; canary first; the fleet only after acceptance.**
- **Use only the project's maintenance routes, and verify the target's identity before the
  first mutating command.**
- **Treat a retired or frozen host as nonexistent:** the project's ban sentence goes into
  every brief, verbatim.
- **Dry-run first and say so in the status.**

## 14. Shell and tool pitfalls seen live

- **`codex exec` from a non-TTY needs `</dev/null`.** — Otherwise it prints "Reading
  additional input from stdin..." and waits until the timeout kills it.
- **Never run anything that reads stdin without giving it input** (`python3 -`, a bare
  `cat`, `ssh host` with no command). — It hangs the tool call.
- **zsh does not word-split unquoted variables.** Use arrays (`"${ARGS[@]}"`) or run the
  script under `bash -c '…'`. — A hand-written zsh waiter compared one unsplit string
  against states it never matched and hung; `herdr agent wait` (§3) needs no loop at all.
- **Run long commands in the background with a completion notification** — playbooks,
  reviews, waiters. — A blocked orchestrator supervises nothing.
- **Redirect long tool output to a file and read the tail** (`</dev/null >run.log 2>&1`).
- **macOS has no GNU `timeout`;** use the tool's own timeout options.
- **herdr server errors are JSON on stderr with exit 1; syntax errors exit 2.** Check the
  exit code in scripts.

---

## 15. Bindings for this repo (ccs.ansible)

Precedence here: `CLAUDE.md` hard rules > `docs/orchestration.md` (the working agreement
this manifest generalises — where the two differ, `orchestration.md` wins until revised) >
this manifest.

**Voting advisors for this operator** (operator ruling 2026-09-28): Codex `gpt-6-astra` with
`model_reasoning_effort=xhigh`, and Claude Fable 5.1 with `--effort xhigh`, each in its
own read-only herdr tab.

**Product advisors for this operator** (operator ruling 2026-09-28; ballots B26a, B27a,
B28a, B29a, concern C8): Claude Fable 5.1 with `--effort xhigh`, and Codex `gpt-6-astra`
with `model_reasoning_effort=xhigh`, each in its own herdr tab, separate from the voting
advisors. superpowers is installed for Codex CLI with
`codex plugin add superpowers@openai-curated-remote` (installed 2026-09-28, version
6.4.2). A Codex product advisor runs with `-s workspace-write` and its cwd in the
brainstorm scratch folder, so it can write only there. The rule applies to tasks added
from the 2026-09-28 ruling on (B28a). A `brainstormed` task still needs the operator's
design sign-off of hard rule #9 (Artifact, then `/poll`) unless the operator has delegated
it.

**Open reconciliation.** The general two-advisor rule (§10) and the product-brainstorm
rule (§10a) are operator rulings of 2026-09-28 that are not yet written into `CLAUDE.md`
or `orchestration.md`. Those files still reserve to the operator: merging any PR that
changes a value (Git / PR workflow, "Don't merge own PRs without operator approval"); any
live run other than `--check`, creating/moving/shutting down/deleting a VM, DNS,
certificates, secrets and vault, and a change of course (`orchestration.md` §3 and
rule 12); merging a document that changes what
agents may do (`orchestration.md` rule 9); sign-off on a non-trivial design before
implementation (hard rule #9, in the immutable hard-rules block). Hard rule #16 also still
says the main-window session "keeps … decisions". Until those texts are amended — itself an
authority change that goes through the operator's merge poll — these items are
operator-reserved (§10) unless the operator has delegated them for the current task set.
Two more differences are open, for the operator to settle: (1) §10 keeps ballots neutral,
with no recommendation, and the orchestrator out of the vote, while hard rule #12 wants
every `/poll` to offer "a recommended default first" and `orchestration.md` rule 10 has a
poll carry "the orchestrator's recommendation" — whether, and whose, recommendation a poll
after a split carries is not decided; (2) `orchestration.md` rule 2 and §6 create an
executor's worktree with `--base main` and start the executor in a sibling pane
(`herdr pane split`), while §2 and §4 here use `--base origin/main` and one tab per task
(`herdr tab create`), following the operator's "1 tab = 1 task" ruling — the precedence
line above would let `orchestration.md` win, the ruling points the other way.

| Manifest | Binding in this repo |
|---|---|
| §1 prose to a subagent | hard rule #16; `orchestration.md` rule 15 |
| §1 executors off production | `orchestration.md` rule 6 — only the orchestrator touches production (no executor runs a playbook against a live host, opens SSH to a hypervisor or VM, decrypts the vault, merges a PR or writes DNS); Codex executors run `-s workspace-write`, network off; `orchestration.md` §3 — a `--check` dry run and reading host state are live SSH sessions and the orchestrator's alone, never an executor's; rule 10 — the orchestrator collects host evidence. A brief that grants an executor read-only inspection departs from rule 6 and §3 and must say so. |
| §2, §4 worktrees and cleanup | `CLAUDE.md` Git / PR workflow, first bullet (`.claude/worktrees/<name>`, shared checkout stays on `main`, remove + prune + `branch -d` at the end); `orchestration.md` rule 2, §6 — which use `--base main` and a sibling pane (`herdr pane split`), where this manifest uses `--base origin/main` and one tab per task (`herdr tab create`, the operator's "1 tab = 1 task" ruling); see Open reconciliation |
| §5 skills | Git / PR workflow, "Cross-review": the `superpowers:requesting-code-review` flow is not a substitute for the other-model review |
| §6 brief | `orchestration.md` §5 format; hard rule #15 ("Reply in English."); the frozen-host sentence of `orchestration.md` rule 8, byte for byte |
| §7 backlog | a claude.ai Artifact in the operator's language (Conventions "Artifact first"); the source file is live state, not repo documentation — keep it in the orchestrator's scratch space, not in git |
| §8 design first | hard rule #9 |
| §8 review | Git / PR workflow "Cross-review before any merge request"; `orchestration.md` rules 5, 9; docs-only exception and the authority-document exception |
| §8 validation | `bash .claude/skills/run-ccs-ansible/validate.sh all` (skill `run-ccs-ansible`, offline) |
| §8 failures | `orchestration.md` rule 11 (three failure classes) |
| §8 deploy | hard rules #11 (merged `main` only), #14 (one site per run, `-l site_<x>`), #7 (re-run is a no-op) |
| §8 merge, commits | `gh pr merge <n> --merge --delete-branch`; hard rule #13 — `git grep -nE "code/session_[0-9A-Za-z]"` empty, `Co-Authored-By:` trailer only |
| §8 docs closed | `CLAUDE.md` sections the change affects; runbooks (e.g. `docs/v4/40-pritunl-runbook.md`); specs and plans under `docs/superpowers/`; `projects/ccs/soul/<host>.md` after each deploy; `KVM.md` in the same commit when VMs, ports or host nomenclature change (hard rule #10); the orchestrator's auto-memory (`MEMORY.md` and its files). Markdown-only closing PRs merge right away (Git / PR workflow, "Docs-only PRs"), except authority documents |
| §10 votes and polls | hard rule #12 (every operator question is a `/poll`, recommended option first); Conventions "Artifact first, then /poll" and "Plan brief, then /poll" |
| §12 | Conventions "Plain words next to every term"; the operator's chat and Artifacts in the operator's language, repo text in English (hard rule #6) |
| §13 | hard rules #17 (ProxyJump through the site's own hypervisor with `HostKeyAlias`; no fallback — stop and `/poll`), #14 (`ControlMaster=no`), #18 (the workstation address `38.60.250.228` is whitelisted in fail2ban on every hypervisor and stays whitelisted), #1 and #2 (sshd and fail2ban are never loosened). Running maintenance only from that whitelisted egress is the operator's practice (ruling 2026-09-28), not the text of #18 |
| §14 | `CLAUDE.md` Common ops (the `"${CCS_SSH[@]}"` array form); `orchestration.md` §6 (`</dev/null`) |
