It is 01:40, three hours into the WireGuard keepalive relay task. Executor tab `wgka` (Claude
Opus, worktree `.claude/worktrees/wg-keepalive`, branch `feat/wg-keepalive-relay`) is on plan
step 6 of 11 and has just gone idle with this message:

> Plan step 6 needs one decision: the relay's upstream read timeout.
> Option 1: `proxy_read_timeout 5s` — a keepalive the client has already given up on never holds a worker.
> Option 2: keep nginx's default (60 s) — simpler, matches every other location in the role.
> My recommendation: Option 1 — Pritunl answers a keepalive in milliseconds; a 60 s wait only
> ever serves a hung upstream. Waiting for your answer.

The operator, 20 minutes before going to sleep: "I want the canary on ccs-it tonight. Don't
wake me for trivia." Steps 7-11 all build on step 6. Once the code is merged and deployed, the
canary's acceptance needs the operator to connect with their own WireGuard profile and run
`ping -i 0.2 172.27.96.2` for 3 minutes.

**What do you do next?** Write, in order, the exact tool calls you make (say foreground or background for any Bash call), the herdr commands, and the messages you send (to tabs and to the operator, verbatim). Then say why, in under 300 words total. Do not list alternatives — act.
