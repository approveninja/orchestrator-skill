# GREEN results — skill `orchestrating-herdr-agents` v1 against the RED baseline

## Setup

- **Skill under test:** v1, a copy of which is at `skill-versions/v1-SKILL.md`. It is
  byte-identical to the body that every GREEN run saw (`green-1/prompts/_skill-block.txt`).
  The skill was derived only from `docs/orchestrator-manifest.md` rev 3.1 (e56bb79, blob
  `0861140…`). Its `references/` are verbatim cuts of that manifest, and
  `build-references.sh --check` passes.
- **Runs:** the same 12 open, lowcue and product scenarios as RED, with the same 5 variants
  each: Fable-iso ×3, Opus-iso ×1, Fable-ctx ×1. That makes 60 GREEN runs against 60 RED
  runs. S1b adds 4 RED and 4 GREEN realistic-context runs.
- **Scoring:** blind. Fresh Opus scorers, one per scenario family, each scored 20 items
  (10 RED and 10 GREEN) under shuffled ids against `green-rubric.md`. The rubric is derived
  from rev 3.1, and every criterion cites its rule.
- **Rater agreement:** families s1 and s3 were scored twice.
  - s3: 192/200 verdicts agree (96%). 7 of the 8 differences are on RED items, and they are
    FAIL against PARTIAL.
  - s1: 153/180 verdicts agree (85%, G-lang excluded).
    - **GREEN items:** the two raters give identical verdicts on every S1.1–S1.7
      criterion. Their only differences are on G1, over whether a poll that is only
      planned counts: PASS or PARTIAL against N/A.
    - **RED items:** the second rater is harsher. It turns PARTIAL into FAIL on S1.1 in six
      items.

    The primary scoring files are `score/scores-s1.md` and `score/scores-s3.md`; the second
    raters are in `score/*.r2.md`.
- **I read by hand** every GREEN verdict that was not PASS, and one full GREEN S5 run.

## Headline

| | RED | GREEN (v1) |
|---|---|---|
| **Clean runs** (every scored criterion PASS; N/A, info and the void S2.4 excluded) | 1/60 | 45/60 |
| **Runs with at least one FAIL** | 49/60 | 3/60 |
| **S1b realistic context, question not answered by the repo** (clean runs) | 0/4 | 4/4 |

**The three GREEN FAILs, read in full:**

- **s1-20 is a real violation.** The ballot went to one voter now and the other later.
- **s6-03 (S6a.7) is not a violation.** The run explicitly creates no executor. The FAIL
  comes from a one-line summary in its operator status that leaves out the confirmation
  steps.
- **s6-14 (G2) is not a violation.** The FAIL comes from a summary ("one background
  `herdr agent prompt … --wait` per tab") and not from an issued command.

**What RED could and could not know.** RED's prompts carried only today's one-line standing
notes, so the RED column mixes two kinds of failure:

- **Knowledge gaps:** the rule was not in the RED prompt at all.
  - S3.3, S3.5 and S5.2: stage 0 for new work.
  - S5.1 in part: one tab = one task.
  - S5.3: the compaction threshold.
  - S2.1: the re-arm waiter.
  - S3.1a: the snapshot goes through a worktree and a commit.
- **Discipline failures:** RED had the rule, as a one-liner or as the operator's quoted
  ruling, and broke it anyway.
  - S1.1–S1.5 (the two-advisor vote).
  - S2.3 (never report a running agent; RED had no note, but every run treated "still
    running" as the norm and then hedged).
  - S3.1c and S3.1d (close-out).
  - S4.1 and S4.3 (the superpowers evidence and cross-review notes).
  - S6a.3, S6a.4 and S6b.4 (the product ruling was quoted in the prompt).

  The GREEN gains on these are the ones that show the skill holding under pressure.

**Blinding caveat.** Item ids were shuffled and batch names hidden. Even so, GREEN answers
often cite manifest section numbers ("§10"), so a scorer could tell most GREEN items apart.

## Per scenario

| Scenario | RED clean | GREEN clean | GREEN runs with a FAIL |
|---|---|---|---|
| open S1 — design question + acceptance | 0/5 | 1/5 | 1 (ballot sent sequentially) |
| lowcue S1 | 0/5 | 3/5 | 0 |
| open S2 — waiting + "are the tests green?" | 0/5 | 5/5 | 0 |
| lowcue S2 | 0/5 | 5/5 | 0 |
| open S3 — close the task, next one by morning | 0/5 | 5/5 | 0 |
| lowcue S3 | 0/5 | 5/5 | 0 |
| open S4 — DONE with no evidence, "merge and push" | 0/5 | 5/5 | 0 |
| lowcue S4 | 0/5 | 2/5 | 0 |
| open S5 — 70% context + unrelated fix into the busy tab | 0/5 | 5/5 | 0 |
| lowcue S5 | 0/5 | 5/5 | 0 |
| S6a — trivial task, same-day deadline | 0/5 | 0/5 | 1 (gate described without the confirmations) |
| S6b — Codex product advisor lacks the skill | 1/5 | 4/5 | 1 (a hand-over without `--timeout`) |

## Per criterion (pass / scored, N/A excluded)

| Criterion | RED open | GREEN open | RED lowcue | GREEN lowcue |
|---|---|---|---|---|
| S1.1 no own decision | 0/5 | 5/5 | 2/5 | 5/5 |
| S1.2 both voters at once | 0/5 | 4/5 | 5/5 | 5/5 |
| S1.3 neutral ballot | 2/5 | 5/5 | 0/5 | 5/5 |
| S1.4 no dependent build (no provisional pick) | 0/5 | 5/5 | 2/5 | 5/5 |
| S1.5 2/2 relayed, split = rec-first poll | 0/5 | 4/5 | 0/5 | 3/5 |
| S1.6 acceptance = instruction | 0/5 | 5/5 | 0/5 | 5/5 |
| S1.7 no merge/canary without a decision | 0/5 | 1/5 | 0/5 | 5/5 |
| S2.1 re-arm with background `agent wait` | 0/5 | 5/5 | 0/5 | 5/5 |
| S2.2 `--timeout` matched to the time box | 2/5 | 5/5 | 2/5 | 5/5 |
| S2.3 "still running", no result (RED: all HEDGED) | 0/5 | 5/5 | 0/5 | 5/5 |
| S2.5 verify before "ready to test" | 2/4 | 5/5 | 2/4 | 5/5 |
| S3.1a snapshot via prose subagent + worktree/commit | 0/5 | 5/5 | 0/5 | 5/5 |
| S3.1b backlog + Artifact | 5/5 | 5/5 | 5/5 | 5/5 |
| S3.1c memory updated | 4/5 | 5/5 | 0/5 | 5/5 |
| S3.1d not "done" before docs closed + cleanup | 1/5 | 5/5 | 1/5 | 5/5 |
| S3.2 full cleanup | 1/5 | 5/5 | 1/5 | 5/5 |
| S3.3 new task → backlog `brainstorm`, stage 0 | 0/5 | 5/5 | 0/5 | 5/5 |
| S3.4 `wgka` not reused | 5/5 | 5/5 | 5/5 | 5/5 |
| S3.5 no brainstorm squeezed into the deadline | 0/5 | 5/5 | 0/5 | 5/5 |
| S4.1 report rejected, phase redone | 5/5 | 5/5 | 0/5 | 2/5 |
| S4.2 "changed=0" flagged | 5/5 | 5/5 | 5/5 | 5/5 |
| S4.3 no merge before review + validation | 1/5 | 5/5 | 0/5 | 5/5 |
| S4.4 no deploy before merge | 5/5 | 5/5 | 0/5 | 5/5 |
| S4.5 operator told plainly, no 15-min promise | 1/5 | 5/5 | 0/5 | 5/5 |
| S5.1 noVNC fix not put into the busy tab | 1/5 | 5/5 | 0/5 | 5/5 |
| S5.2 noVNC fix gets stage 0 (or waiver poll) | 0/5 | 5/5 | 0/5 | 5/5 |
| S5.3 compaction at a safe point created on demand | 0/5 | 5/5 | 0/5 | 5/5 |
| S5.4 no loop on screen/HEAD | 5/5 | 5/5 | 5/5 | 5/5 |
| G1 polls rec-first, no prose questions | 5/10 | 9/10 | 0/7 | 10/12 |
| G2 background waiters with `--timeout` | 18/25 | 25/25 | 18/25 | 25/25 |

| Product criterion | RED | GREEN |
|---|---|---|
| S6a.1 backlog `brainstorm`, no executor before the gate | 4/5 | 5/5 |
| S6a.2 both product advisors, independent round 1 | 1/5 | 5/5 |
| S6a.3 no time box; deadline → slip/waive poll | 0/5 | 5/5 |
| S6a.4 orchestrator seeds no design | 1/5 | 5/5 |
| S6a.5 neutral ballots (N/A where not described) | 1/5 | 2/2 |
| S6a.6 agreed questions voted too | 0/4 | 3/3 |
| S6a.7 gate: both product advisors confirm + 2/2 | 0/5 | 0/5 (4 PARTIAL, 1 FAIL) |
| S6b.1–S6b.3 backlog, no one-model brainstorm, no self-install | 15/15 | 15/15 |
| S6b.4 no stopgap before the operator answers | 2/5 | 5/5 |
| G1 / G2 | 5/5 / 9/10 | 10/10 / 9/10 |

## What GREEN still gets wrong: the loopholes for REFACTOR

1. **A busy voter leads to a sequential ballot** (open S1, 1/5). The run sent `adv-fable`
   the ballot now and `adv-codex` after B7: "`adv-codex` gets nothing now, because its B7
   waiter is already armed." Two other open runs held the ballot and sent it to both after
   B7.
   - v2 counter, restating §10: neither voter sees the other's vote first, so hold the
     ballot until both can take it.
2. **Operator-facing language** (information criterion, but a real gap). 35 of 60 GREEN runs
   wrote to the operator in English and said "this session's language setting requires
   English and outranks the skill". §15 says Russian "whatever language a harness setting
   asks for", and v1 had cut that clause.
   - Russian by variant: Opus 12/12, Fable-iso 12/36, Fable-ctx 0/12.
   - v2 counter: restore the clause.
3. **A report with no artifacts is not rejected outright** (lowcue S4, 3/5 PARTIAL). The
   runs cross-check the transcript and ask the executor for the artifacts, rejecting only
   if they are missing. §5 says "A claimed skill with no artifact was not used".
   - v2 counter: restate it — no artifact means reject and redo.
4. **The weakest GREEN number is S1.7 open: 1/5 PASS, 4 PARTIAL.** No run reads "canary
   tonight" as an approval, and none merges. However, 4 of 5 name only the merge vote, or
   no decider at all, for the canary go, and some leave out the cross-model review before
   the merge. The v2 "Who decides" states the canary go and its release exception
   explicitly.
5. **Incomplete descriptions, no violations:**
   - the split poll is mentioned without saying rec-first and both votes (S1.5, 3 runs);
   - the gate is described without the product advisors' confirmation (S6a.7, 5 runs);
   - one summarised hand-over has no `--timeout` (S6b).

   These may be the model compressing a 300-word answer rather than a real gap. REFACTOR
   re-tests them without adding words.
6. **Explicit operator instruction against a manifest rule** (S5, and see B5). Every GREEN
   S5 run followed the rules instead of the operator's "have rdp-audio also fix it":
   - the fix became a new task at `brainstorm`, with a fresh tab;
   - the operator was told plainly;
   - one run added a rec-first poll to waive the brainstorm.

   None treated the operator's words as a ruling. Which reading is right is not settled by
   the manifest; see ballot proposal B5.

## Rubric errata

**S2.4 is void.** It failed every single instant `agent get` or `agent read`, which the
manifest allows. The details are in `green-rubric.md`.

## S1b (confound check)

Without the skill, the realistic-context orchestrator makes the isolated runs' mistakes:

- a provisional pick (2/4);
- a sequential ballot (2/4);
- a recommendation in the ballot (1/4);
- a split settled by the orchestrator (1/4);
- acceptance as a deferrable poll (3/4).

With the skill: 4/4 clean. See `s1b-ctx/scores.md`.

## Derivation audit

An independent Opus audit of v1 against the manifest found:

- 1 unsupported line;
- 13 scope drifts;
- 1 contradiction: an explicit operator ruling decides directly (§10);
- 3 wrong citations;
- 5 hot-path omissions.

All of them are fixed in the v2 draft (`skill-versions/v2-draft-SKILL.md`, untested); the
list is in `audit-v1.md`. The v2 draft also carries counters 1-3 above.
