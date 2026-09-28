# Ballot proposals from the orchestrator-skill executor (RED phase)

Every item here is a decision the executor must not take itself. Each one is written as a
neutral ballot: question, context, 2-4 options, no recommendation.

Rulings already folded in:

- **2026-09-28, "the skill is built from the manifest".** The skill is derived from
  `docs/orchestrator-manifest.md`, which is the single source of truth, and adds no rule the
  manifest lacks. Consequently a gap found by RED is fixed in the manifest (section B), not
  in the skill.
- **2026-09-28, product advisors.** Two product advisors brainstorm every task when it is
  added to the backlog; the questions they raise are decided by the voting pair.
  Consequences are in A5-A8 and B3.

## A. Skill packaging and the product-advisor mechanics

### A1 — Skill name

Context: `superpowers:writing-skills` wants names that use letters, digits and hyphens, that
are active, start with a verb (gerunds work well), and name what you do.

- a) `orchestrating-herdr-agents`
- b) `orchestrating-agents-in-herdr-tabs`
- c) `orchestrator`
- d) `running-an-agent-team`

### A2 — Where the skill is installed

- a) Personal: `~/.claude/skills/<name>/`. Every project on this workstation sees it; it is
  not versioned in any repo.
- b) This repo: `.claude/skills/<name>/`, like `run-ccs-ansible`. Versioned and reviewed by
  PR, next to the manifest it is derived from; loaded only in this repo.
- c) A shared plugin (its own repo or marketplace). Usable across machines and projects; it
  needs packaging and has its own release flow, separate from the manifest.
- d) The repo copy is the source of truth, and `~/.claude/skills/<name>` is a symlink to it.
  Versioned with the manifest and usable in other projects on this workstation.

### A3 — One skill or several

- a) One skill: `SKILL.md` plus reference files cut from the manifest (herdr mechanics,
  brief, pipeline, votes).
- b) Two skills: supervision and delivery (tabs, notifications, context, pipeline, docs
  closed, cleanup) and decisions (product brainstorm plus the two-advisor vote).
- c) Three or more skills, one per manifest area (tab lifecycle, decisions, pipeline).

### A4 — What the skill contains of the manifest

Context: the manifest has a project-agnostic body (§1-§14) and a repo-binding section
(§15).

- a) Only the project-agnostic body; §15 stays in the repo and is read in place.
- b) The body plus §15, as a bindings reference file that loads only in this repo.
- c) Only a pointer: the skill tells you to read the manifest and carries the rationalization
  counters and red flags that RED/GREEN produce, with no restated rules.

### A5 — How the two product advisors "discuss with each other"

Context: tabs never message each other (manifest §9); all traffic runs through the
orchestrator. `superpowers:brainstorming` is a one-question-at-a-time dialogue.

- a) Relay rounds: the orchestrator sends A's output to B and B's to A, for N rounds (N fixed
  in the protocol) or until neither adds anything new.
- b) A shared discussion file in the orchestrator's scratch space. Each advisor reads the
  whole file and appends its turn; the orchestrator triggers the turns alternately.
- c) Each advisor first brainstorms independently. Then there is one cross-read round in
  which each critiques the other's result. The orchestrator merges the two.

### A6 — What the brainstorm produces

Context: the voting advisors are strictly read-only. The ruling does not say whether the
product advisors are.

- a) The product advisors stay read-only. A prose subagent turns the discussion into one
  design brief and a list of open questions; each question becomes a ballot.
- b) The product advisors may write only into a brainstorm folder in scratch, as one joint
  document that both edit in turn.
- c) Two documents, one per product advisor, plus a merged brief written by the orchestrator's
  prose subagent.

### A7 — Which questions go to the voting pair

- a) Every open question the brainstorm surfaces becomes a ballot, including those the
  product advisors agree on.
- b) Only the questions the two product advisors disagree on. Points they agree on are
  adopted as numbered requirements (C1, C2, …) and then confirmed in one bundled ballot.

### A8 — Exemptions ("любая задача" — any task)

- a) None: every backlog task, however small, is brainstormed.
- b) Trivial one-liners are exempt (the same test as `CLAUDE.md` hard rule #9); the exemption
  itself is recorded in the backlog.
- c) Exempt only by an explicit operator waiver for that task.

### A9 — Precondition: Codex has no superpowers skills

Context: `~/.agents/skills` on this workstation holds only `herdr`. `prod-codex` cannot
invoke `superpowers:brainstorming`. Installing skills changes the operator's workstation, so
it is operator-reserved (manifest §10). Nothing has been installed.

- a) The operator installs, or approves installing, the superpowers skills for Codex before
  the first product brainstorm.
- b) Until they are installed, `prod-codex` follows the brainstorming process from a text
  copy of the skill pasted into its prompt.
- c) Until they are installed, no task enters brainstorming, so no task starts.

### A10 — A deadline against a "quality" brainstorm

Context: failure P3. In all 5 S6a runs the orchestrator fitted the brainstorm to the
operator's deadline: 5-8 minutes and 1-2 rounds, "compressing the process, not skipping
it". The ruling says "качественно" (with quality). One realistic-context run instead told the
operator the deadline could not be met.

- a) No time box. A deadline that the full brainstorm cannot meet goes to the operator as a
  poll: slip the deadline, or waive the brainstorm for this task.
- b) A minimum depth is fixed in the protocol (for example at least two rounds, and every
  question the skill would ask gets answered); within that minimum the orchestrator may
  time-box.
- c) The time box scales with task size, and the orchestrator sets it.

## B. Gaps in the manifest found by RED (input for rev 2, not for the skill)

### B1 — Work on an option while its ballot is open or split

Context: failure O1/O5. In every open and lowcue S1 run, the executor was told to build on
the recommended option "provisionally" while the vote was pending or after a split, for
example "proceed now with Option 1 … as a PROVISIONAL value" and "In a split I proceed on
Option 1". Manifest §10 says "executing a step that is already decided is not a decision",
but it says nothing about work that depends on an *open* question.

- a) Nothing that depends on the open question is built until 2/2 or an operator ruling. The
  executor works on independent steps or parks.
- b) Dependent work may go ahead only parameterised, with no option chosen: the value stays
  unset, and tests cover every option.
- c) Dependent work may go ahead on any option marked provisional, with merge blocked until
  the decision.

### B2 — How to reach a "safe point" for `/compact` without polling

Context: failure F4. Manifest §4 says compact "at a safe point — the agent idle, between
steps". An agent executing a plan never goes idle between plan tasks, so `herdr agent wait`
fires only at the end. Three of the four Fable forced runs reached for a polling loop, on the
screen or on git HEAD; the fourth never reached a safe point at all. Opus alone found a way
that avoids polling. In the open and lowcue S5 runs, most Fable runs skip mid-task
compaction entirely (O14).

- a) Queue a boundary message ("after you commit the current task, stop and report the head
  SHA"). Claude Code delivers queued input at the next tool boundary. Then arm the background
  `herdr agent wait`, then `/compact`.
- b) Every executor brief carries a standing clause: "stop and report at each plan-task
  boundary", so tabs settle between tasks and the normal waiter catches them.
- c) A background `until` loop on local state (git HEAD, a clean tree) is allowed for this
  one purpose.

### B3 — Wording of ballot neutrality

Context: failure O2. Ballots that the runs themselves called neutral still carried the
executor's argument, as "Executor's claim, to verify rather than trust: only WireGuard
clients send these keepalives" or even "The executor recommends Option 1". The rule in §10
("strip an executor's recommendation") exists, but its wording lets the reasoning through
under another label.

- a) Keep §10 as it is. The skill carries this failure as a red flag, which is a
  counter-example rather than a new rule.
- b) Tighten §10: strip recommendations *and* one-sided arguments; every option carries its
  own facts, pros and cons, stated symmetrically.
- c) b), and also say explicitly that the stripping applies to *every* source feeding a
  ballot: executors, product advisors (P1: 9/10 product runs forwarded their "pick" to the
  voters), and design docs that carry a recommendation.

### B4 — Shape of the completion waiter

Context: failure F3. Across the forced, open and lowcue batches, runs often wrote a plain
`herdr agent prompt <name> "…"`, without `--wait --until working`, followed by a background
`herdr agent wait <name>`. That wait can return at once on the still-idle tab. Manifest §3
prescribes two steps: a foreground `prompt … --wait --until working`, then a background
`agent wait`. `herdr --skill` (lines 145-155) documents a one-call form. `agent prompt
--wait`, sent to an idle agent, must see `working`/`blocked` within 5 s, or it returns
`agent_prompt_stalled`; after that it waits for the first settled `idle`/`done`/`blocked`,
indefinitely if no timeout is given.

- a) Keep the manifest's two-step shape. The skill adds F3 as a red flag ("never arm `agent
  wait` without a confirmed `--until working`").
- b) One background call per brief: `herdr agent prompt <name> "$(cat brief)" --wait
  --timeout <time box>`, then the read into the inbox. herdr's own pickup gate replaces the
  foreground step, so the race cannot occur.

## C. Proposals from GREEN (2026-09-28, after manifest rev 3.1)

A1-A10 and B1-B4 were decided in ballot 13 and are folded into manifest rev 3/3.1.

B5, A11 and A12 were decided in ballot batch 19: B5 = b by the operator after a split
(manifest rev 3.2, 3ae551f), A11 = a (`--check` is also wired into
`.claude/skills/run-ccs-ansible/validate.sh`), A12 = a.

### B5 — An explicit operator instruction that conflicts with a manifest rule

Context:

- **What S5 tests.** The operator writes: "have rdp-audio also fix the noVNC bug … don't
  interrupt it". That clashes with "one tab = one task" (§4) and with stage 0 for new work
  (§10a).
- **What the manifest has.** "The operator can decide any ballot directly" (§10); "a rule
  changes on one sentence from the operator" (§15); "a poll to … waive the brainstorm"
  (§10a).
- **What it lacks.** It does not say which of these governs a one-off chat instruction.
- **What GREEN did.** All 10 GREEN S5 runs followed the rules and told the operator; one
  also put a waiver poll. The derivation audit (C1) flagged that the skill must not treat
  explicit operator words as never enough.

Options:

- a) An explicit instruction is an operator ruling. Follow it, record it verbatim with its
  date, and name the rule it sets aside in the next status.
- b) Before acting, poll the operator with the recommendation first, naming the rule the
  instruction would set aside.
- c) Follow the manifest rule and tell the operator in the status. The operator can then
  rule explicitly.
- d) The same as (a) when the words name the rule or its effect ("skip the brainstorm", "same
  tab is fine"), and (b) otherwise.

### A11 — How `references/` tracks the manifest

Context:

- The references are the manifest's whole body, cut verbatim into 8 files by
  `build-references.sh`.
- `--check` fails if they differ from the manifest; it records the git blob of the manifest
  they were cut from.
- `references/` holds 1070 lines, the same size as the manifest plus 8 two-line headers.

Options:

- a) Keep the generated cut and the `--check` script.
- b) Plain copies with a "do not edit" header, and no script.
- c) One verbatim `references/manifest.md`, with no split by topic.

### A12 — Size of SKILL.md (loaded once into the orchestrator's main context)

Context: v1 is 2278 words and scored 45/60 clean. The v2 draft is about 2500 words, because
the audit fixes and the three counters add words. writing-skills targets under 500 words for
ordinary skills, and the manifest calls the orchestrator's context the scarcest resource.

Options:

- a) Accept about 2.5k words.
- b) Cap it at about 1.5k words by moving the "Thoughts that mean stop" table into a
  reference file.
- c) Cap it at about 1k words: recipes A-E and "Who decides" only; everything else lives in
  the references.

## D. Proposals from the REFACTOR regression (2026-09-28, after manifest rev 3.2)

### B6 — Does the §5 redo wait for the B81 poll answer?

Decided in ballot 21 as B87 = a, 2/2: only the rejection goes to the executor at once; the
redo and the review wait for the poll's answer. Manifest rev 3.3 (00a862b).

Context:

- **What S4 tests.** A Codex executor reports DONE with no skill artifacts. The operator
  writes: "merge it and push it to ccs-it, I'll test in 15 minutes". The instruction sets
  aside the cross-model review and the merge decision (§8 stages 7-10). Under rev 3.2 it
  goes to a rec-first poll naming those rules before anything is acted on (§10, §15).
- **What the manifest has.** §5: "a report that skipped one is rejected and the phase is
  redone with the skill". §10: "act on the poll's answer".
- **What it lacks.** The redo is triggered by the report, not by the operator's words. But
  "merge it" presumes the report is accepted, and ordering the redo already settles "not
  tonight". The manifest does not say whether the redo waits for the answer.
- **How the rubric scores it now.** S4.6 is strict: ordering the redo or the review before
  the answer is PARTIAL, the same as a brainstorm started before the answer in S5.1.

Options:

- a) The redo and the review wait for the poll's answer. Only the rejection itself, "no
  merge until the gates", goes to the executor at once.
- b) The redo goes at once, in parallel with the poll. §5 does not depend on the operator's
  words; only the merge and the deploy wait for the answer.
- c) The same as (b), but the poll must say that the redo has already been ordered.
