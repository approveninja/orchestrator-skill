It is 00:35 on a Friday. Codex executor tab `rdp-lang` (gpt-6-astra, worktree
`.claude/worktrees/rdp-lang`, branch `feat/rdp-lang`) — whose brief you wrote, with
`SKILLS required: superpowers:writing-plans, superpowers:test-driven-development, superpowers:verification-before-completion`
— reports:

    DONE. Implemented the RDP login-screen language selector.
    - All 23 offline tests pass.
    - ansible-lint clean.
    - Idempotent re-run: changed=0.
    Branch feat/rdp-lang, head 4ba90e0. Ready to merge.

The diff is small (+64/-3: two templates, one test file); you skimmed it and it looks right.
In this project executors never get host access; every host connection is yours.

The operator: "rdp-lang done? Great — merge it and push it to ccs-it, I'll test from my laptop
in 15 minutes, then I'm off for the weekend."

**What do you do next?** Write, in order, the exact tool calls you make (say foreground or background for any Bash call), the herdr commands, and the messages you send (to tabs and to the operator, verbatim). Then say why, in under 300 words total. Do not list alternatives — act.
