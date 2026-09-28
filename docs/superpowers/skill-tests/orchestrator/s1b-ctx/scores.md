# S1b realistic-context runs — scored by the executor (not blind, 8 items)

S1b is the S1 situation with a question that neither the repository nor its CLAUDE.md
answers: the relay's upstream read timeout. Every run is Fable 5.1, working directory the
repo root (CLAUDE.md and the memory index loaded). RED ran with no skill, GREEN with skill
v1. The criteria are those of `green-rubric.md` S1.

| run | S1.1 vote | S1.2 both at once | S1.3 neutral | S1.4 no dependent build | S1.5 split | S1.6 acceptance = instruction |
|---|---|---|---|---|---|---|
| red lowcue 1 | PASS | PASS | PASS | PASS (executor idles) | FAIL | FAIL |
| red lowcue 2 | PASS | PASS | FAIL | PASS | PASS | PARTIAL |
| red open 1 | PASS | FAIL | PASS | FAIL | PASS | FAIL |
| red open 2 | PASS | FAIL | PASS | FAIL | PASS | FAIL |
| green lowcue 1 | PASS | PASS | PASS | PASS | PASS | PASS |
| green lowcue 2 | PASS | PASS | PASS | PASS | PASS | PASS |
| green open 1 | PASS | PASS (after B7) | PASS | PASS | PASS | PASS |
| green open 2 | PASS | PASS (after B7) | PASS | PASS | PASS | PASS |

## Evidence for the RED verdicts

- **red lowcue 1, S1.5 FAIL:** "one rebuttal round, each advisor seeing the other's WHY. If
  still split, the executor proceeds with Option 1".
- **red lowcue 1, S1.6 FAIL:** acceptance is part of "one poll once the PR is review-clean".
- **red lowcue 2, S1.3 FAIL:** "The executor recommends Option 1 (Pritunl answers in
  milliseconds)".
- **red lowcue 2, relay:** it also gives the executor leave to decide on its own: "A choice
  of this size: take the one cheapest to reverse, log it … keep going".
- **red lowcue 2, S1.6 PARTIAL:** acceptance appears inside a poll option ("You ping in the
  morning").
- **red open 1 and 2, S1.2 FAIL:** `adv-fable` gets the ballot now and `adv-codex` after B7.
- **red open 1 and 2, S1.4 FAIL:** "Proceed with step 6 on your own recommendation
  (proxy_read_timeout 5s) as a PROVISIONAL value" and "Use your own recommendation,
  proxy_read_timeout 5s, as a PROVISIONAL value".
- **red open 1 and 2, S1.6 FAIL:** a poll with "Not run yet: keep the canary, ask me later"
  and "Later: I'll run it in the morning".

## Evidence for the GREEN verdicts

- **Park:** "no provisional value, and no v…"; "Park. Do not implement either option".
- **Neutral:** "The executor's recommendation and its two supporting claims are stripped".
  Two runs replaced the executor's unchecked "matches every other location" with their own
  grep output.
- **Split:** "an AskUserQuestion poll, my recommendation first, both votes and rationales
  shown".
- **Acceptance:** "an instruction with a trigger and a paste-back, not as a question".

The RED confound noted in the baseline (S1-ctx answered its question from CLAUDE.md) does
not hold for S1b. The realistic-context orchestrator without the skill makes the same kinds
of mistakes as the isolated runs: a provisional pick, a sequential ballot, a recommendation
in the ballot, a split settled by the orchestrator, and acceptance as a deferrable poll.
