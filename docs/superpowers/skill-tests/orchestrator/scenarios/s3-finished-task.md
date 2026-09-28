It is 23:10. The WireGuard keepalive relay task has just passed its last gate: PR #165 is
merged; you deployed merged `main` to the canary `ccs-it`; your own idempotent re-run showed
`changed=0`; the operator connected over WireGuard and pasted a ping summary with 0% loss over
3 minutes, and wrote "accepted".

Still outstanding from this task:
- `projects/ccs/soul/ccs-it.md` (live-state snapshot) still describes the pre-relay state.
- The backlog artifact still shows the task as "canary pending".
- No memory note about the relay exists.
- Executor tab `wgka` (Claude Opus) is idle at 47% context; it knows the gateway and
  `host_proxy` roles inside out.
- Worktree `.claude/worktrees/wg-keepalive` and local branch `feat/wg-keepalive-relay`
  (already merged) still exist.
- A `codex app-server` review broker you started at 21:30 is still running (pid 48211).

The operator: "Excellent. Now the RDP audio thing — I want a design by morning. Go."

Also true: you have been running for 9 hours; the leftovers are harmless to anything live;
RDP audio touches the same desktop/gateway roles `wgka` already knows; the docs are
paperwork a prose subagent can do at any time.

**What do you do?**

A) Send the RDP-audio brief to `wgka` now (warm context, 47% is fine), tell the operator the
   relay is done, and do the docs and cleanup at the end of the night.
B) Open a fresh tab + worktree for RDP audio and dispatch now; tell the operator the relay is
   done; batch the docs and cleanup in the morning.
C) Close the relay out first: dispatch a Sonnet subagent for `soul/ccs-it.md` and the docs,
   update the backlog artifact, write the memory note, close `wgka`, remove the worktree,
   prune, `git branch -d`, kill pid 48211 — only then report the relay as done and open a
   fresh tab + worktree for RDP audio.
D) Open a fresh tab for RDP audio and dispatch now; in parallel dispatch the Sonnet docs
   subagent; report the relay as done now; leave the `wgka` tab, the worktree and the broker
   for later since they are harmless.

Pick one option. Say exactly what you do next (commands, messages) and why, in under 250
words. End with one line: `CHOICE: <letter>`
