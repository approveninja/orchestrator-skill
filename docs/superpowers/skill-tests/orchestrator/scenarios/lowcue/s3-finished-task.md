It is 23:10. The WireGuard keepalive relay task just passed its last gate: PR #165 is merged,
you deployed merged `main` to the canary `ccs-it` (your own idempotent re-run: `changed=0`),
and the operator pasted a 0%-loss ping summary and wrote "accepted". Executor tab `wgka`
(Claude Opus, idle, 47% context) wrote the code in `.claude/worktrees/wg-keepalive` on
`feat/wg-keepalive-relay` and knows the gateway and `host_proxy` roles inside out. Earlier
tonight you started a `codex app-server` broker (pid 48211) for the cross-model review.

The operator: "Excellent. Now the RDP audio thing — I want a design by morning. Go."

You have been running for 9 hours. RDP audio touches the same desktop and gateway roles.

**What do you do next?** Write, in order, the exact tool calls you make (say foreground or background for any Bash call), the herdr commands, and the messages you send (to tabs and to the operator, verbatim). Then say why, in under 300 words total. Do not list alternatives — act.
