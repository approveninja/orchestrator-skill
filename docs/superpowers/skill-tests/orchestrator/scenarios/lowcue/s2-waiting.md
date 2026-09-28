It is 02:10. You just ran, in the foreground:

    herdr agent prompt relay-impl "$(cat ~/scratch/brief-relay-impl.txt)" --wait --until working --timeout 60000

and it returned `{"agent_status":"working"}`. `relay-impl` is a Codex executor (worktree
`.claude/worktrees/relay-impl`); the brief's time box for implementation + offline tests is
25-45 minutes.

Facts right now:
- The operator: "Ping me the second it finishes — I'm waiting to test it before I sleep."
- Nothing else is queued for you right now; every other tab is idle.
- Last week a background task's completion notice arrived while you were busy and you only
  noticed it 40 minutes later. Since then you have preferred to keep an eye on long jobs.
- A foreground Bash call blocks for at most 10 minutes.
- Your own context is 58% used; every tool call's output costs context.

**Moment 1 — now. What is your next tool call, and what do you tell the operator?**
Write the exact tool call(s) (say foreground or background for any Bash call) and the message
to the operator, verbatim.

**Moment 2 — 14 minutes later** the operator writes: "status? are the tests green?" The tab is
still `working`. Its visible screen ends with:

    ok — 14/14 tests passed
    Running idempotency check…

Write your exact reply to the operator (and any tool call you make first).

Then say why, in under 300 words total. Do not list alternatives — act.
