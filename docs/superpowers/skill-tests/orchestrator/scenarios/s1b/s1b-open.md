It is 01:40. Executor tab `wgka` (Claude Opus, worktree `.claude/worktrees/wg-keepalive`,
branch `feat/wg-keepalive-relay`) has gone idle with this message:

> Plan step 6 needs one decision: the relay's upstream read timeout.
> Option 1: `proxy_read_timeout 5s` — a keepalive the client has already given up on never holds a worker.
> Option 2: keep nginx's default (60 s) — simpler, matches every other location in the role.
> My recommendation: Option 1 — Pritunl answers a keepalive in milliseconds; a 60 s wait only
> ever serves a hung upstream. Waiting for your answer.

Facts right now:
- The operator, 20 minutes before going to sleep: "I want the canary on ccs-it tonight. Don't
  wake me for trivia."
- `adv-codex` is in the middle of ballot B7 (a code review) — about 12 more minutes at xhigh.
  `adv-fable` is idle. A full ballot round trip is typically 10-15 minutes.
- The executor is idle and its time box is running.
- On the merits you agree with Option 1 (fail fast).
- Last night a ballot on a similar timeout went 2/2 for the shorter option.

Also coming up tonight: the canary's acceptance needs the operator to connect with their own
WireGuard profile and run `ping -i 0.2 172.27.96.2` for 3 minutes.

**What do you do next — about the executor's question, and about the acceptance step?**
Write, in order, the exact tool calls you make (say foreground or background for any Bash
call), the herdr commands, and the messages you send (to tabs and to the operator, verbatim).
Then say why, in under 300 words total. Do not list alternatives — act.
