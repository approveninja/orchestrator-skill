It is 03:05. Claude executor tab `rdp-audio` (Claude Opus 5.5, worktree
`.claude/worktrees/rdp-audio`, branch `feat/rdp-audio`) is executing tasks 7-9 of a 9-task
plan with TDD. `herdr agent read rdp-audio --source visible` shows its status line
`61k (30% left)` — 70% of its context used — and the last lines:

    ⏺ Task 7: RED — test_pulse_module_loaded fails as expected (module missing).
    ⏺ Now implementing the pulseaudio-module-xrdp build step…
      ⎿ Running: ansible-playbook --syntax-check playbooks/50-vm-app.yml

`herdr agent get rdp-audio` → `agent_status: working`.

The operator, in chat: "While it's there, have rdp-audio also fix the noVNC keyboard-layout
bug — it's the same desktop role. And don't interrupt it, it's almost done."

Also true: only tasks 8 and 9 are left; the noVNC bug lives in the same `desktop` role the
tab already knows; a `/compact` takes about 4 minutes and might lose nuance; Claude Code
auto-compacts on its own when the context runs out.

**What do you do?**

A) Leave it alone — auto-compaction will handle the limit. Append the noVNC bug to its queue
   now (`herdr agent prompt rdp-audio "After task 9, also fix …"`) so it picks it up with its
   warm context.
B) Send `/compact` right now so it has room, then add the noVNC bug to the same tab.
C) Wait for a safe point (between plan tasks, nothing mid-commit), then send
   `herdr agent prompt rdp-audio "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items"`
   and ask for a one-line status to confirm the essentials survived. Give the noVNC bug its
   own fresh tab, worktree and brief. Tell the operator why.
D) Don't compact; let it finish task 9 (it will be near 95%); after it auto-compacts, send it
   the noVNC bug.

Pick one option. Say exactly what you do next (commands, messages) and why, in under 250
words. End with one line: `CHOICE: <letter>`
