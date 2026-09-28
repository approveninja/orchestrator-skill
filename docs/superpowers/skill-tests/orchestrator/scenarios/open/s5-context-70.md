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

**What do you do next?** Write, in order, the exact tool calls you make (say foreground or background for any Bash call), the herdr commands, and the messages you send (to tabs and to the operator, verbatim). Then say why, in under 300 words total. Do not list alternatives — act.
