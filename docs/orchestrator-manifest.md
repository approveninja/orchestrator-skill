# Orchestrator manifest

How one Claude Code session runs several AI agents working in herdr tabs. herdr is a
terminal multiplexer for coding agents: it hosts each agent (Claude Code, Codex, …) in its
own tab or pane and gives the orchestrator a `herdr` CLI to start, prompt, watch, read and
interrupt them (`herdr --skill` prints its own usage guide). The whole document is
project-agnostic: the settings that follow the operator from project to project are in the
operator profile (§15), and a project binds the manifest through its own rules, which the
orchestrator reads before anything else (§16).

**Precedence.** Project hard rules > operator rulings in the operator profile (§15) > this
manifest > agent defaults. A project's other rules (its working agreement, its conventions)
override this manifest where they are stricter (§16), never an operator ruling. No brief,
ballot or vote can set a project hard rule or an operator ruling aside.

---

## 1. Roles

| Role | Owns | Never does |
|---|---|---|
| **Orchestrator** — one Claude Code session, the main tab | sequencing, supervision, verification, ballot framing and records, relaying between the product-advisor tabs and playing their skill's human partner (§10a), executing decided steps, every production action, the backlog, all operator communication | taking a decision alone, voting, designing a task itself, large edits, prose drafting |
| **Product advisor** ×2 — one herdr tab each, different model families, separate from the voting advisors | the product brainstorm of every new task under `superpowers:brainstorming`: an independent draft, a critique of the other's draft, the joint design doc (§10a) | decisions (every open question goes to a ballot), writing anything but its own files in the scratch folder the orchestrator names, commits, host access, herdr commands, messages to other tabs or the operator |
| **Voting advisor** ×2 — one read-only herdr tab each, different model families | votes on every decision (§10) — design approval, scope, every merge before a task's final PR, the canary, machine lifecycle, DNS and certificates, secrets — and every question a product brainstorm raises; second opinions, design review (code review goes to a fresh session of the other model, §8) | edits, commits, host access, herdr commands, messages to other tabs |
| **Executor** — one herdr tab per task, Claude or Codex | investigation, root cause, design, plan, code, offline tests, local commits in its own worktree | production, push/PR/merge (unless the phase grants it), creating or driving tabs, decisions, contact with the operator |
| **Prose subagent** — Sonnet by default, Opus when the text needs technical judgement | docs, state snapshots, PR bodies, reports, translations | decisions, host access |
| **Operator** — the human who owns the work | the final PR and the release of every task, every change of course, every advisor split, and every change to the operator's own environment (§10); the hands-on acceptance steps; any ballot the operator chooses to decide directly | being asked about what the vote already decided 2/2 — that reaches the operator in the status and the backlog |

- **Orchestrate; don't implement.** — The orchestrator's context is the scarcest resource;
  large edits burn it and leave nobody supervising the other tabs.
- **Take no decision alone** — every decision goes to the vote of the two voting advisors
  (§10), and the vote decides everything except the four kinds of decision the operator
  keeps: the final PR and the release of a task, a change of course, every split, and
  every change to the operator's own environment. —
  The orchestrator frames the options; deciding them too removes the only independent
  check.
- **Brainstorm every new task before any executor exists** — two product advisors, relayed
  rounds, one joint design doc (§10a). — An executor that designs alone builds the first
  framing it finds; two model families and a vote on every question catch the wrong
  problem before any code exists.
- **Run four advisor tabs, two roles:** two product advisors design, two voting advisors
  decide. — An advisor that votes on its own draft is not an independent check.
- **Every tab is born from the main tab and reports back to it.** Executors never create
  tabs or start agents; their own in-session subagents are fine. — One owner knows the
  whole topology.
- **Pick the executor by the task:** a herdr executor tab for bounded work with a verifiable
  acceptance criterion; a one-shot read-only `codex exec` for a short analysis question; an
  in-session subagent for search and prose; an existing peer session only when it already
  holds the context the task needs. The operator profile names the default (§15). — A
  fresh tab costs a brief; a subagent costs the orchestrator's own context.
- **Send prose-only work to a subagent** (models: §15); the main tab keeps orchestration,
  supervision, verification and everything that touches a live system, and only reviews
  and integrates the text. — Drafting text is cheap for a smaller model and expensive for
  the session that has to keep every thread in its head.
- **Be the only channel to the operator.** — Executors and advisors send questions to the
  orchestrator; two voices reaching the operator contradict each other.
- **Review with the other model family.** — The same model misses the same things;
  Claude's work is reviewed by Codex and Codex's by Claude.
- **Keep executors off production.** Collect host evidence yourself and hand it over — to
  executors and advisors alike; neither goes to the host for a diagnosis. Allow read-only
  inspection by an executor only when the project permits it and the brief grants it by
  name. — The orchestrator must know about every connection made to a live system.

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
  brief too;** never start an executor in the orchestrator's own working directory
  (`--cwd "$PWD"`). — A tab on the shared checkout edits files that other sessions switch
  branches under; a branch alone does not isolate files.
- **Every task that changes a repository works in its own worktree** — executors, the
  orchestrator's own edits (e.g. the docs of stage 14) and any subagent that writes files,
  which gets the worktree's absolute path. The shared checkout stays on the default branch;
  read-only work needs no worktree. — Several sessions share one checkout, and a branch
  switch by one moves the others' files onto the wrong branch.
- **Pass the model explicitly on every start and every `codex exec`.** — A missing config
  key pins nothing; the CLI default drifts.
- **Use `--dangerously-skip-permissions` only with a strict brief** (explicit MAY / MUST NOT,
  worktree cwd, no production). — It removes the last guard between the brief and the shell.
- **Rest "executors stay off production" on a verified run profile, not on the brief's
  text.** Probe each sandbox once before relying on it (e.g. a network call that must
  fail), answer every approval or escalation request yourself — default deny — and write
  down what the sandbox does not enforce (e.g. files it can still read, such as a secret
  store's password file), so the brief and the orchestrator cover that gap. — Agent
  prompts bias toward action; only a tested boundary holds.
- **On `agent_not_ready`, read the screen before sending anything.** A Codex "Update
  available" prompt blocks startup: choose Skip with `herdr agent send-keys <name> …`;
  updating the CLI changes the operator's own environment — the operator's call, asked by
  poll with the recommendation first (§10), never a side effect of answering a dialog. —
  Blind keystrokes can accept the wrong dialog.

**Hand over a brief** — one background call that delivers it and waits for the result (§3):

```bash
# Claude Code Bash tool: run_in_background: true
herdr agent prompt <name> "$(cat <scratch>/brief-<task>.txt)" --wait --timeout <time box in ms>; \
herdr agent read <name> --source recent-unwrapped --lines 200 > <inbox>/<name>.last
```

- **Keep briefs in files**; the part shared by every executor in a phase is one common file.
  — Quoting long text inline breaks, and a file is a record.
- **`agent_prompt_stalled` or a timeout does not prove the brief was lost:** `herdr agent
  read` before re-sending. — A duplicate brief makes the agent do the work twice.
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
work over in a background call that is also the waiter, and goes back to work; the harness
wakes it when the tab settles. (a) is the primary mechanism and always works; (b) and (c)
complement it.

**(a) Primary — ONE background `herdr agent prompt … --wait` per brief or ballot.** Run as
a background task of the orchestrator's harness, it delivers the text and waits on herdr's
socket API — event-driven, no polling loop. Sent to an idle agent, `--wait` must see it
start (`working` or `blocked`) within 5 s or it returns `agent_prompt_stalled`; after that
it waits for the first settled state (`idle`, `done` or `blocked`). That pickup gate closes
the race in which a separate wait armed on a still-idle tab returns at once.

```bash
# background (Claude Code Bash tool: run_in_background: true); the harness notifies on exit
herdr agent prompt <name> "$(cat <scratch>/brief-<task>.txt)" --wait --timeout <time box in ms>; \
herdr agent read <name> --source recent-unwrapped --lines 200 > <inbox>/<name>.last
```

**Re-arming on an agent that is already working** — after a timeout while the tab is still
busy, after answering a `blocked` dialog, after a queued message (§4) — is the one case for
a separate `herdr agent wait`, which tracks lifecycle state, not a turn (on an idle agent it
returns at once):

```bash
# background, only when `herdr agent get <name>` shows the agent working
herdr agent wait <name> --timeout <remaining time box in ms>; \
herdr agent read <name> --source recent-unwrapped --lines 200 > <inbox>/<name>.last
```

- **Always set `--timeout`, matched to the brief's time box** — the `TIME BOX` line of §6
  (e.g. ~30 min to the first report → `1800000`); without it the call waits forever. A
  timeout exits non-zero: read the tab before re-arming. — A silent tab past its time box
  is itself news.
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
- **Codex has its own mechanism** (a `notify` program in its config, run at turn end);
  wiring it changes the operator's own environment (§10) — ask the operator by poll,
  recommendation first, if a durable record of Codex tabs is needed.

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
  steps, never mid-deploy, mid-commit or mid-migration — send, as a background call like
  any other waiter (§3):

  ```bash
  herdr agent prompt <name> "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" \
    --wait --timeout 300000
  ```

  (Codex: a bare `/compact`.) Then ask for a one-line status (phase, branch, head SHA,
  next step) to confirm the essentials survived. — Automatic compaction at the limit fires
  at the worst moment and keeps the wrong things.
- **Make the safe point on demand; never poll for it.** An agent working through a plan
  never goes idle between plan steps, so no waiter fires until the end. When a tab needs
  compacting, queue one message into it — no `--wait`, the tab is already working — then
  re-arm the separate waiter of §3 and compact when it settles:

  ```bash
  herdr agent prompt <name> "Finish the current step, commit, stop and report: phase, branch, head SHA, next step."
  # background: herdr agent wait <name> --timeout <ms>; herdr agent read … > <inbox>/<name>.last
  ```

  Claude Code delivers queued input at its next tool boundary; for a Codex tab, confirm
  with `herdr agent read` that the message was taken before relying on it. Send it only
  when compaction is due — not as a standing clause in every brief. — A loop on the screen
  or on git HEAD is polling under another name.
- **Unrelated next task → fresh tab, not compaction.** Close the old tab and start a new one
  with its own worktree and brief. — Compaction keeps residue; a fresh tab starts clean.
- **Clean up after every task, merged or abandoned** (pipeline stage 16):

  ```bash
  herdr tab close <tab_id>                                        # tabs you created only
  git -C <repo> worktree remove <worktree> && git -C <repo> worktree prune
  git -C <repo> branch -d <branch>                                # merged branches only
  git -C <repo> pull                                              # the shared checkout, on the default branch
  git -C <repo> worktree list                                     # main checkout + work in progress only
  ps -ax -o pid,command | grep -i '[c]odex'                       # e.g. review brokers you started
  ```

  Finish in the original directory, on the default branch. Kill only helper processes you
  started. Never force-remove a worktree with uncommitted work: discarding work drops part
  of a task, a change of course — the operator's (§10). — Leftovers pile up, hold branches,
  and confuse the next session.

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
  dispatching to it.** If they are not, a CLI install changes the operator's own
  environment: ask the operator by poll (recommendation first, §10) to install them, or
  give the task to an agent that already has them — never waive the rule. — A missing
  skill otherwise turns into a silent skip.

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
SAFETY     <the project's host-safety constraints and ban sentences, verbatim>
DIR/BASE   <absolute worktree path>   branch <name>   base <ref> @ <sha>
FILES      <the files in scope>; touching any other file needs a reason in the report
MAY        read the repo, upstream sources, the web; edit and commit locally in DIR;
           run <exact commands> — nothing else
MUST NOT   touch production; push, open a PR or merge; edit outside DIR; create tabs;
           contact the operator — questions go to the orchestrator
MODE       <run profile: CLI, sandbox, network, approvals — e.g. workspace-write, network off>
DECISIONS  any choice between alternatives: stop and send me a ballot proposal
           (question + 2-4 concrete options + your recommendation); do not decide it, and
           build nothing that depends on it until I relay the decision
DELIVER    <root cause with evidence | design doc path | branch + tests>
DONE       <acceptance criterion: the checks that must pass, at the head SHA>
REPORT     done / not done; skills used + their artifacts; evidence (command output);
           files changed (stat); head SHA; docs touched; risks; open questions. Compact.
TIME BOX   first report within ~30 min; do not stall on one path — report and ask
FAIL       (a) approach defect — counts, stop after the second; (b) expected red test in a
           write-test-fix loop — iterate; (c) tool, sandbox or permission failure — BLOCKED
BLOCKED    reply "BLOCKED: <what> <why>" and stop; never work around a guard
```

- **Quote the operator; don't paraphrase the problem.** — Paraphrase is where the task
  quietly changes.
- **Open every brief and every plan that touches a live system with the project's
  host-safety constraints** — the `SAFETY` line of a brief, a banner at the top of a plan.
  — A constraint met after the plan is written is met too late.
- **Separate facts from hypotheses.** — Executors build on whatever you call a fact.
- **Copy mandatory sentences byte for byte.** — A paraphrased ban is a different ban.
- **Read-only by default; grant write, commit and host access per phase.** — The phase,
  not the agent's initiative, decides what it may change.
- **Demand the reply language in every brief** — the working language of §15, in every
  message to another agent (tab, subagent, peer session, `codex exec`, review request);
  send a reply in any other language back to be redone. — Reports get quoted into commits
  and docs; mixed-language relays lose precision.

## 7. The backlog — one file, always published

The orchestrator keeps ONE backlog of every task and is its only writer. The operator can
read it at any moment.

- **Source file = the truth; a published Artifact = the operator's view.** Publish a
  claude.ai Artifact page generated from the source file once, in the operator's language
  (§15); after every write to the source, regenerate the page and republish it from the
  same page path, which keeps the same URL. — The operator reads state without asking,
  and one writer means no conflicting versions.
- **Keep the source file in the orchestrator's scratch space, not in git.** — It is live
  state, not repository documentation, and it changes at every step.
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
- **The advisor, vote and review stages** — 4 (design review and approval), 5 (decisions),
  7 (code review), the reviewer's half of 8, and the go decisions of 10, 11 and 13 — are
  governed by §10 and the review rules below.

| # | Stage | Who | Exit evidence |
|---|---|---|---|
| 0 | Product brainstorm — at backlog entry | two product advisors, relayed by the orchestrator (§10a); every open question to the voting advisors | joint design doc confirmed by both product advisors and approved by both voting advisors (2/2; the operator rules on a split); every blocking question has a ballot result or operator ruling; status `brainstormed` |
| 1 | Investigate, read-only | executor | findings, each with its evidence |
| 2 | Root cause | executor → orchestrator | one mechanism that explains every symptom |
| 3 | Design doc | executor, in its worktree | doc path + SHA (for a brainstormed task: the joint design doc committed in the worktree) |
| 4 | Design review and approval | both voting advisors — two model families | both ACCEPT the doc at its SHA (2/2), or only implementation-level findings left; a split goes to the operator |
| 5 | Decisions — and whenever a choice arises at any later stage | vote of the two voting advisors; splits to the operator | ballot results / operator rulings recorded |
| 6 | Plan + code + offline tests | executor, local commits only | branch, head SHA, test output |
| 7 | Code review at an exact SHA | the other model, fresh session | "no actionable findings" at that SHA |
| 8 | Fix; re-review every later commit | executor, reviewer | clean review at the final SHA |
| 9 | Independent validation | orchestrator | its own run of the repo's checks at that SHA |
| 10 | Merge decision → push, PR, merge | the vote (2/2) for every PR before the task's final PR; the operator for the final PR (§10); orchestrator executes | merge commit on main |
| 11 | Canary deploy from merged main | go decided by the vote — or by the operator when this rollout is the task's release (§10); orchestrator executes; prose subagent for the snapshot | dry run where the deploy tool has one, real run, read-only verification, idempotent re-run with zero changes; live-state snapshot updated — written by a prose subagent from the orchestrator's evidence, checked by the orchestrator |
| 12 | Operator acceptance | operator's hand actions | operator-produced evidence |
| 13 | Fleet rollout — the release | go decided by the operator (§10); orchestrator executes; prose subagent for the snapshots | the canary checks per target; live-state snapshots updated the same way as in stage 11 |
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

- **The reviewer is a fresh session of the other model family:** Claude's code goes to a
  fresh Codex session, Codex's code to a fresh Claude session that did not author it; with
  mixed authorship each hunk goes to the model that did not write it. The reviewer gets the
  requirements and the diff, reviews one SHA and never continues the author's session.
  Same-model review, and generic review commands (a security review, a simplify pass, the
  review skills of §5), are no substitute. — A different engine lowers the chance of
  repeating the author's mistake; it does not remove it, which is why the findings travel
  with the merge decision (§11).
- **Iterate design review until ACCEPT or only implementation-level findings remain.** —
  Further design rounds have diminishing returns; code review catches the rest.
- **Tie every test run, review and merge decision to one SHA.** — Any later commit voids
  them: re-run the checks and re-review at the new SHA.
- **Run the validation yourself before the merge decision** (the ballot, or the operator's
  poll for a final PR). — An executor's "all green" is a claim, not evidence.
- **Docs-only changes skip review and the merge decision:** merge them at once and report
  it in the next status. Docs-only means documentation, plus comment-only edits whose
  rendered output is byte-identical; the project's rules define the check. **Exception:** a
  document that changes what agents may do (the project's rules, its working agreement,
  this manifest) is docs-only in bytes but authority in effect — its PR counts as a final
  PR and waits for the operator's merge poll (§10). — Reviewing prose costs more than it
  catches; changing the rules is not prose.
- **The orchestrator pushes and opens the PR** (or tells the executor to, in that phase's
  brief). — Nothing leaves the machine without passing the orchestrator's own check.
- **Stop an executor after two approach defects.** An expected red test in a
  write-test-fix loop does not count; an infrastructure failure does not count — fix the
  environment and restart. — A third blind attempt rarely converges.
- **Deploy only from merged main, canary first:** a dry run where the deploy tool has one
  (e.g. a check-and-diff mode), the real run, read-only verification, then a re-run that
  must report zero changes — every deploy is idempotent. If an emergency requires deploying
  unmerged work, announce it to the operator first and merge it immediately after. — Two
  sessions deploying different branches silently revert each other.
- **Persist enablement in versioned configuration**, never a one-off command-line flag. —
  The next routine deploy would silently revert a flag-only canary.
- **Merge code dark; arm the canary with a separate one-line change** once the vote has
  approved the canary. — The merge stays low-risk and the canary starts on a decision, not
  a side effect.
- **Update the live-state snapshot after each deploy, from its evidence — never before.**
  A prose subagent writes it from the evidence the orchestrator collected; the
  orchestrator checks every claim in it against that evidence. — A doc that predicts a
  result is read later as a record of it.

**Repository conventions** — defaults for every repository; a project's own rules may
override them (§16). Executors get them through the brief.

- **Branch names `feat/<name>` for new work, `fix/<name>` for bug fixes, `chore/<name>` for
  non-functional changes.** — The prefix says what a branch is before anyone opens it.
- **Merge with `gh pr merge <n> --merge --delete-branch`; never squash.** — The commit
  structure is the review record, and `--delete-branch` removes the remote branch.
- **Shell scripts are bash, never python.** — One scripting language across the repository
  keeps every script reviewable by everyone.
- **Repository documentation is written in the working language** (§15); the operator's
  chat and the Artifacts for the operator are in the operator's language. — Repository
  text outlives the conversation and is quoted into commits, reviews and briefs.
- **Nothing committed contains a per-session link** — documents, plans, code comments,
  commit messages, PR titles and bodies. Commits carry a `Co-Authored-By:` trailer only,
  never a session trailer, even when a harness suggests one; before every commit,
  `git grep -nE "code/session_[0-9A-Za-z]"` must be empty. — Session links are private and
  short-lived, and they leak account context into a repository that outlives them.
- **Secrets are never in plaintext in git;** they live in the project's secret store. —
  Git history keeps what a later commit deletes.
- **A live-inventory document changes in the same commit as what it describes** (a machine
  added, removed, resized or renamed). — An inventory updated "later" is wrong exactly when
  someone needs it.

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
- **Never use a bare `git stash` / `git stash pop`; make a WIP commit instead.** The stash
  stack is shared by the checkout and every worktree, and a branch can be checked out in
  only one worktree at a time. — A pop in one tree can apply another task's changes.

## 10. Decisions — the two-advisor vote

This is the default operating mode, not an exception. **The orchestrator takes no decision
by itself.** A decision is any choice between alternatives that changes the outcome —
design approval and design options, scope, rollout order, every merge, the canary
go/no-go, creating, moving, stopping or deleting a machine, DNS and certificates, secrets
and vault, an exception to a plan. Executing a step that is already decided is not a
decision.

**Who decides what**

- **The vote decides everything (2/2) except four kinds of decision, which the operator
  keeps:**
  1. **The final PR and the release of a task.** The final PR is the task's last PR that
     changes a value (code, configuration, inventory); a PR that changes what agents may do
     counts as a final PR whenever it lands (§8); any other docs-only PR is never one. The
     release is the rollout that completes the task: in a canary-first rollout the fleet
     rollout (§8 stage 13), with the canary before it a voted step; in a task with a single
     rollout, that rollout.
  2. **A change of course** — dropping a task or changing its goal.
  3. **Every split.**
  4. **Every change to the operator's own environment** — the workstation (Mac settings,
     keeping it awake, local configs such as the Codex config or the status line, CLI
     installs and updates), the operator's network (VPN profiles) and accounts. Asked by
     poll with the orchestrator's recommendation first, never decided by the vote.

  — Operator ruling (§15; item 4 an interpretation poll, 2026-09-28, overruling the literal
  reading of an earlier revision). The advisors decide everything before the final PR and
  the release; the operator decides the end of a task, its direction, what touches their
  own environment, and what the advisors cannot agree on. A vote cannot widen its own
  mandate, which is why a change to the rules is a final PR.
- **Project hard rules still bind; a vote never overrides one.** An action a project hard
  rule reserves to the operator stays the operator's until the project amends that rule. A
  vote cannot revise an operator ruling either (precedence, top of this document); a
  question that would goes to the operator. — Rules are not voted away.
- **A one-off instruction the operator gives in chat that conflicts with a manifest rule is
  not acted on directly.** Poll the operator first — recommendation first, one question —
  naming the rule the instruction would set aside, and act on the poll's answer. A standing
  change to the rule itself still needs the operator's own explicit ruling, recorded in the
  manifest (§15) — a one-off instruction is not by itself that ruling. — Operator ruling
  (§15, 2026-09-28, decided after a voting-advisor split). A rule stands for a reason; a
  word said once in passing should not silently set it aside.
- **The operator is not asked about what the vote decided 2/2.** Report each decision in
  the next status and record it in the backlog. — Interruptions are for the four kinds of
  decision above, and for an instruction that conflicts with a rule (above).
- **Routine steps need neither a ballot nor a poll:** creating branches and worktrees;
  writing code and docs in a worktree; starting and stopping the tabs and subagents you
  own; offline checks; opening PRs and ordering reviews; asking the advisors; merging
  docs-only changes that do not change what agents may do (§8); read-only inspection of a
  live system, which is the orchestrator's alone and is announced in the next status
  (§13). — A ballot on a step with one sensible option wastes two advisors' turns.
- **Build nothing that depends on an open or split ballot until it is decided** — 2/2 or an
  operator ruling. No provisional pick, and no build "parameterised for now" that stands in
  for the choice; the executor works on independent steps or parks. — Work built on a
  guess is rework when the guess loses, and it tilts the decision toward the option that
  already exists.
- **Irreversible or outward-facing actions run only after a decision whose options stated
  the cost of being wrong and the rollback path** — a merge that changes a value, a deploy,
  creating, moving, stopping or deleting a machine, a DNS or certificate change, a secret
  rotation or a vault change. The vote decides them, except where one of the four kinds
  above applies. — The cost and the rollback are what the voters actually weigh.

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
  recommendation. Before the ballot goes out, strip every recommendation and every
  one-sided argument from every source that feeds it — an executor's ballot proposal, a
  product advisor's proposal, a design doc that argues for one option. Each option carries
  its own facts, pros and cons, stated symmetrically. — A reason attached to one option
  only is a recommendation under another label.
- **Irreversible or outward-facing options state the cost of being wrong and the rollback
  path.**
- **Each voting advisor picks exactly one option** with a 1-3 sentence rationale, or writes
  `X: <proposal>` when every option is wrong; an X matches only a materially identical X.
- **Send the ballot to both at once** — one background `herdr agent prompt … --wait
  --timeout` to each (§3); neither sees the other's vote first.

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
- **Go to the operator with a structured poll for the four kinds of decision above, where a
  project hard rule reserves the action, and before acting on a one-off instruction that
  conflicts with a rule** (Who decides what, above). Every operator poll has concrete,
  mutually exclusive options, the orchestrator's recommendation as the first option, and
  one question; a poll on a split also shows both votes and both rationales next to the
  options.
- **The recommendation in an operator poll is advice given after the vote, not a third
  vote** — including on a split (operator ruling, §15). The ballot to the advisors stayed
  neutral and the orchestrator still casts no vote; the operator decides with every view
  in front of them.
- **Never ask the operator in prose,** and publish any document the question depends on
  before the poll (§12). — Polls are answered in seconds and leave a clean record.
- **The release decision rests on operator-produced acceptance evidence** (§8 stage 12).
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

**The rounds** — relay by file path, never by pasting text; one background
`herdr agent prompt … --wait` per tab per round (§3).

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

- **Every open question, in any round, goes to a ballot (§10)** — including the ones both
  product advisors agree on. A draft goes on around an open question and builds nothing
  on it until the result is relayed (§10). — The product advisors design; they do not
  decide.
- **No time box on the brainstorm.** A deadline the full brainstorm cannot meet is a change
  of course, the operator's (§10): a poll to slip the deadline or to waive the brainstorm
  for this task — never a quietly shortened brainstorm. — A brainstorm squeezed into the
  deadline keeps its name and loses its checks.

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

- **A task counts as brainstormed only after both product advisors confirm the joint doc,
  both voting advisors approve it, and every blocking question has a recorded ballot
  result or operator ruling.** Only then does its status become `brainstormed`, and only
  then may an executor be created for it. — One confirmation, one missing approval or one
  unanswered blocking question means the design is not settled.
- **The vote is the design approval.** Put the confirmed joint doc to the voting advisors
  as a ballot of its own — approve, or return it to the product advisors with named
  findings — presented neutrally (§10: any recommendation inside the doc is stripped from
  the ballot, the open options stand side by side). 2/2 approves it; the operator rules
  only on a split. A project hard rule that still reserves design sign-off to the operator
  binds until the project amends it (precedence). — Two model families that did not draft
  the design are the independent check; the operator's time goes to what they cannot
  agree on.
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
           (question + 2-4 concrete options + your recommendation); do not decide it, and
           draft nothing that depends on it until I relay the result
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

- **Write in the operator's language** (§15) — every chat reply, poll, status and Artifact
  for the operator; agent-to-agent traffic and repository text stay in the working
  language.
- **Every question to the operator is a structured poll** — concrete, mutually exclusive
  options, the orchestrator's recommendation as the first option, one question per poll.
  Decisions reach the operator only as §10 allows; the other questions are facts nobody
  else can supply (e.g. a project binding that is missing, §16). Never ask anything in
  prose, and never end a turn on a prose question. — A prose question is answered slowly,
  ambiguously, or not at all.
- **Publish any document the operator must read to decide — a design, spec, plan or report
  — as an Artifact, full text in the operator's language, before the poll that asks for the
  decision.** Never a wall of text in chat, never a bare file path. — The operator decides
  on what they can read in one place.
- **Every status has three parts:** what is happening now, what comes next, what the
  operator must do (or "nothing"); link the backlog page. Name what the vote decided since
  the last status, with the ballot ids. — The operator is not asked about those decisions,
  so the status is where they learn of them.
- **When a plan is written, the next status carries its brief:** the goal in one line, the
  tasks one line each, what is blocked and on what, the acceptance gate. Launching the plan
  is a decision for the vote (§10); never ask the operator whether they want to see the
  plan — the brief is the default. — A plan nobody summarised is a plan nobody read.
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
- **Never weaken host security to get a run through** — no routine unbans, no allow-list
  additions, no tuning of the SSH server or of any access path you depend on (its port,
  host keys, authorised keys) as a workaround. Each such change is a decision of its own
  (§10), and the operator's where a project hard rule reserves it. Never remove the
  operator's allow-listed address from a host's ban exceptions. — The access path is the
  one thing a failed change cannot be repaired through.
- **Stop when a host becomes unreachable mid-run;** tell the operator and do not retry in
  a loop. — Retries extend a ban and hide the cause.
- **The same failure on two unrelated hosts points at the local side** — the key agent, a
  locked keychain, the egress address (§15). Stop probing and fix the workstation; no blind
  retries. — Unrelated hosts rarely break the same way at the same minute.
- **Pace connection-heavy runs:** few parallel connections, a retry budget, a narrower
  selection to shorten runs; never two runs against one target at once.
- **One target group per run; canary first; the fleet only after acceptance.**
- **Turn SSH connection sharing off wherever one address exists in more than one
  environment.** A master socket keyed on user, host and port — without the jump host — can
  carry a run to the wrong environment's machine, and a change count will not show it
  (§11). — Reused internal addresses are exactly where a shared socket lands silently.
- **Use only the project's maintenance routes, and verify the target's identity over a
  fresh connection before the first mutating command.** If the maintenance route is down,
  stop and tell the operator; never improvise a fallback route. **An end-user access path
  (the VPN or front door that users take) is never a maintenance route and never
  maintenance evidence** — acceptance through it is the operator's. — An end-user path
  often cannot say which machine it reached.
- **Treat a retired or frozen host as nonexistent:** the project's ban sentence goes into
  every brief, verbatim.
- **Dry-run first and say so in the status.** Read-only live inspection — a dry run,
  reading host state — is the orchestrator's alone (§1), needs no ballot, and is announced
  in the next status. — Every connection to a live system is on the record.
- **Never hold an end user's credential.** Verify an authentication path only through its
  reject cases, and undo their side effects (lock-out counters, bans) afterwards; accepting
  a real login is the operator's acceptance step. — A credential in an agent's context
  lands in transcripts and logs.
- **Never put a secret on a command line;** pass it through a file or the tool's own secret
  variables. — The command line lands in shell history and `ps` output, whatever the tool
  does with the value afterwards.

## 14. Shell and tool pitfalls seen live

- **`codex exec` from a non-TTY needs `</dev/null`.** — Otherwise it prints "Reading
  additional input from stdin..." and waits until the timeout kills it.
- **Never run anything that reads stdin without giving it input** (`python3 -`, a bare
  `cat`, `ssh host` with no command). — It hangs the tool call.
- **zsh does not word-split unquoted variables.** Use arrays (`"${ARGS[@]}"`) or run the
  script under `bash -c '…'`. — A hand-written zsh waiter compared one unsplit string
  against states it never matched and hung; `herdr agent wait` (§3) needs no loop at all.
- **Run long commands in the background with a completion notification** — deploy runs,
  reviews, waiters. — A blocked orchestrator supervises nothing.
- **Redirect long tool output to a file and read the tail** (`</dev/null >run.log 2>&1`).
- **macOS has no GNU `timeout`;** use the tool's own timeout options.
- **herdr server errors are JSON on stderr with exit 1; syntax errors exit 2.** Check the
  exit code in scripts.

---

## 15. Operator profile

Settings that follow the operator from project to project, not any one repository. The
languages, models and standing rulings are operator rulings, each dated where it was made:
they rank above this manifest and below a project's hard rules (Precedence, top), and they
change only on the operator's word. The workstation notes are facts about the operator's
machine.

**Languages**

- **Operator-facing language: Russian** (2026-09-21). Every chat reply, poll, status and
  Artifact for the operator is in Russian, whatever language a harness setting asks for. —
  The operator decides fastest in their own language.
- **Working language: English** (2026-09-10) — every brief, ballot, report and review
  request between agents, and all repository text. Every brief demands an English reply; a
  reply in another language is sent back to be redone (§6). — Briefs and findings are
  quoted into commits and docs, and a mixed-language relay loses precision at every hop.

**Models**

- **Voting advisors** (2026-09-28): Codex `gpt-6-astra` with
  `-c model_reasoning_effort=xhigh`, and Claude Fable 5.1 with `--effort xhigh` — each in
  its own read-only herdr tab (§2, §10).
- **Product advisors** (2026-09-28): the same two models at the same effort, each in its own
  herdr tab, separate from the voting advisors (§10a).
- **Prose subagents** (2026-09-10): Sonnet by default; Opus when the text needs technical
  judgement (§1).
- **Executors** (2026-09-10): Codex `gpt-6-astra` is the default workhorse for bounded work
  with a verifiable acceptance criterion; a Claude executor where the task needs the
  context a Claude tab has already built up. The model is passed explicitly every time
  (§2).
- **superpowers for Codex CLI** (installed 2026-09-28): installed with
  `codex plugin add superpowers@openai-curated-remote`; confirm it is present before
  dispatching to a Codex tab (§5).

**Standing rulings**

- **Decision authority** (2026-09-28): the voting advisors decide everything 2/2; the
  operator keeps the final PR and the release of each task, every change of course, every
  split, and every change to the operator's own environment — in the operator's words
  (translated), "the final PR and the release are the operator's; before that, the
  advisors 2/2" (§10). The environment item is a 2026-09-28 interpretation ruling: it
  stays with the operator, asked by poll with the recommendation first, never swept into
  the vote by the general rule.
- **Recommendation first** (2026-09-28): every operator poll leads with the orchestrator's
  recommendation, including a poll on an advisor split, with both votes and rationales
  next to the options (§10, §12).
- **Every task is brainstormed** (2026-09-28) by the two product advisors, whatever its
  size (§10a).
- **Worktrees** (2026-09-21): every repository-changing task works in its own worktree and
  is cleaned up at the end (§2, §4). This standing ruling is the explicit consent a
  harness's native worktree tool asks for.
- **One-off instruction vs. rule** (2026-09-28, decided after a voting-advisor split): a
  one-off instruction in chat that conflicts with a manifest rule is never acted on
  directly — poll the operator first, recommendation first, naming the rule it would set
  aside, and act on the answer (§10). This is not a rule change by itself; see "Rule
  changes" below.
- **Rule changes** (2026-09-10; wording poll 2026-09-28; distinguished from a one-off
  instruction 2026-09-28): a standing rule changes on one explicit ruling from the
  operator — words meant as a change to the rule, not a one-off instruction for a single
  case (the ruling above) — and takes effect at once. The orchestrator records it here or
  in the project's rules and brings the text to the operator's merge poll as a change to
  what agents may do (§8) — the poll confirms the wording, not the ruling a second time.

**Workstation — macOS with zsh**

- **The zsh and macOS pitfalls of §14 apply:** no word-splitting of unquoted variables (use
  arrays), no GNU `timeout`.
- **A sleeping workstation kills agent turns mid-response and locks the keychain,** after
  which SSH fails with "Permission denied" on every host. Keeping the machine awake during
  long orchestration (`caffeinate`) changes the operator's own environment: ask the
  operator by poll, recommendation first (§10), rather than starting it yourself. Keep the
  SSH key loaded in the agent (`ssh-add --apple-use-keychain`). — Seen live: turns cut off
  mid-answer, then every host refusing the same key.
- **The same "Permission denied" on unrelated hosts means the keychain** (§13): stop
  probing, and ask the operator to run `ssh-add --apple-use-keychain` — a hand action, an
  instruction rather than a question.
- **Maintenance runs from the operator's allow-listed egress address** (operator practice,
  ruling 2026-09-28) — the address itself lives in each project's rules. A personal VPN switched on or off changes the egress:
  check it before a bursty run (§13).

## 16. Project hook

Nothing project-specific lives in this manifest. A project binds it through its own rules.

- **Before anything else in a project, read its own rules** — e.g. `CLAUDE.md`, its working
  agreement, its hard rules — and carry the relevant ones into every brief and ballot as
  already-decided constraints (`DECIDED`, `SAFETY`, §6). — A rule read after the first
  dispatch is a rule the first brief already broke.
- **Project rules override this manifest where they are stricter;** a project hard rule
  also outranks every operator ruling (Precedence, top). Where a project's other text
  contradicts an operator ruling — e.g. it still reserves to the operator what the ruling
  gives to the vote — the ruling governs; where a hard rule does, the hard rule binds.
  Either way, propose the amendment of the project's text: it changes what agents may do,
  so it goes to the operator's merge poll (§8). — Two texts that disagree get followed
  inconsistently.
- **The project names, in its own rules:**
  - its validation commands — what §8 stage 9 runs at the SHA;
  - its deploy and target-selection commands, and how one run is held to one target group
    (§13);
  - its maintenance routes and the identity check before a mutating command (§13);
  - its live-state files — the snapshots and inventories that stages 11 and 13 and the
    docs-closed gate update (§8);
  - its forbidden targets and their ban sentences, verbatim (§6 `SAFETY`, §13);
  - its docs-only check and its authority documents (§8);
  - anything it reserves to the operator beyond the four kinds of decision of §10 — as a
    hard rule, since only a hard rule outranks the operator's rulings.
- **If a project does not name one of these, ask the operator in a poll before the first
  dispatch that needs it** — never guess a deploy command or a maintenance route. — A
  guessed route is how a run lands on the wrong machine.
- **Keep project lessons in the project.** A trap that belongs to one repository goes into
  its own rules or docs; a lesson that holds everywhere comes back here as a manifest
  change. — A manifest that mentions one project's hosts is no longer a manifest.
