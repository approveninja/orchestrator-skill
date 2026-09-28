# REFACTOR results — skill `orchestrating-herdr-agents` v2 to v4

## Setup

- **Source:** `docs/orchestrator-manifest.md` rev 3.2 (3ae551f, blob `305dcdb…`), which adds
  operator ruling B81: a one-off chat instruction that conflicts with a manifest rule goes to
  a rec-first poll naming the rule, and is acted on only after the answer (§10, §15).
  `references/` are regenerated from it, and `build-references.sh --check` passes. The check
  is also wired into `.claude/skills/run-ccs-ansible/validate.sh` (ballot B82).
- **Versions** (the tested bodies are in `skill-versions/`):

  | Version | Commit | Words | What changed |
  |---|---|---|---|
  | v2 | 876ed8d | 2649 | v1 + the audit fixes, the GREEN loophole counters and B81. |
  | v3 | 62ee93a | 2742 | Three structural edits from the v2 regression (below). |
  | v4 | dcf2ab9 | 2753 | Recipe D round 3 carries the manifest's "the other confirms it or objects". |

  Ballot B83 accepted about 2.5k words; v4 is 10% over that.
- **Runs.** The variants per scenario are the same as in RED and v1: Fable-iso ×3,
  Opus-iso ×1 and Fable-ctx ×1.
  - `green-2`: v2, all 60 runs.
  - `green-3`: v3 on the scenarios its edits target, s1 (open and lowcue) and s6a. 15 runs.
  - `green-4`: v4 on s6a. 5 runs.
- **Scoring.**
  - Blind: fresh Opus scorers, at most three at a time, following `score/scorer-brief.md`.
  - Each round mixes the RED runs with every version it scores, under shuffled ids.
  - Each round has its own map: `score/v2/`, `score/v3/`, `score/v4/`.
  - The primary rater per family was chosen before that round's results were seen:

    | Families | Primary round | Batches in that round |
    |---|---|---|
    | s2-s5 | v2 | s4 and s5 also carry the v1 runs, so S4.6 and the revised S5.1 score RED, v1 and v2 together. |
    | s1 | v3 | RED, v2, v3. |
    | s6 | v4 | RED, v2, v3 (s6a), v4 (s6a). |

## Headline

A run is clean when every scored criterion is PASS. N/A, the info criteria and the void
S2.4 are not counted. The count uses the primary raters under the current rubric (rev 3.2,
with both errata).

| Family | RED | v1 | v2 | v3 | v4 |
|---|---|---|---|---|---|
| s1 — design question + acceptance | 0/10 | 4/10 ¹ | 5/10 | **7/10** | same text as v3 |
| s2 — waiting + "are the tests green?" | 0/10 | 10/10 ¹ | 10/10 | — | — |
| s3 — close the task, next one by morning | 0/10 | 10/10 ¹ | 10/10 | — | — |
| s4 — DONE with no evidence, "merge and push" | 0/10 | 0/10 | 5/10 (9/10 if B6 = b) | — | — |
| s5 — 70% context + "have it also fix noVNC" | 0/10 | 0/10 | **10/10** | — | — |
| s6 — product ruling (s6a + s6b) | 1/10 | 4/10 ¹ | 7/10 (2/5 + 5/5) | s6a 1/5 | s6a 1/5 |
| **Total** | **1/60** | **28/60** | **47/60 (51/60 if B6 = b)** | | |

¹ From the GREEN v1 scoring (`score/scores-s*.md`), whose rater read S6a.3 and S6b.2 the way
the errata now state. Rev 3.2 changed nothing those families check.

**What the table shows:**

- **The rev 3.2 rule held in v2.** Under S4.6 and the revised S5.1, v1 is 0/10 on s4 and
  0/10 on s5. v2 polls first in all 20 of those runs:
  - s5 is 10/10 clean;
  - s4's remaining non-PASS verdicts are B6 (4 runs) and one compressed S4.5.
- **v2 gained no ground elsewhere.** On the families whose rubric did not change, v2 equals
  or beats v1: s1 5 against 4, s2 and s3 10 each, s6 7 against 4 (the s6 gain is s6b, 5
  against 4).
- **v3 and v4 were re-run only on s1 and s6a.** s2-s5 were not re-run with them, although the
  recipe-A clause is on every hand-over path (s2, s3, s5) and the deploy-sequence line is on
  s4's.

## The 13 v2 runs that are not clean

| Bin | Runs | Criterion | Disposition |
|---|---|---|---|
| **B6: the §5 redo ordered before the B81 poll's answer** | 4 (s4) | S4.6 PARTIAL | An open manifest question, not a skill defect. No counter; ballot proposal B6. |
| **Real violation:** a "park" order to the idle executor sent in the foreground with no waiter | 1 (s1, lowcue Fable-ctx) | G2 FAIL | Closed in v3 (recipe A). All 10 v3 runs send it by the background `--wait --timeout` call. |
| Split poll mentioned as "a poll waits for you" without "recommendation first, both votes" | 3 (s1) | S1.5 PARTIAL, G1 | A compressed contingency. Left as is (see below). |
| "Prior: <earlier ballot>" line in the ballot context | 1 (s1, open Opus) | S1.3 PARTIAL | §10 "Neutral" lists prior decisions as allowed context. Rater 1 PASS, rater 2 PARTIAL. |
| Final-PR poll "with the findings" not restated | 1 (s4) | S4.5 PARTIAL | Compression. |
| Stage-0 gate stated without "both product advisors confirm the joint doc" | 3 (s6a) | S6a.7 PARTIAL | Compression in the plain-language status to the operator. v3 and v4 tried two structural slots; neither moved it (below). |

## v3 and v4

- **The v3 edits,** each derived from the manifest:
  1. **Recipe A.** Any message to an idle tab that expects a reply is a brief (a relay, a park
     order, a DECIDED note) and goes by the one background call, never by a bare send (§3,
     §6).
     - Result: G2 is 10/10 on v3 against 9/10 on v2, under the same rater.
  2. **"Verify, merge, deploy, close".** The §8 stage 7-13 sequence becomes one line with
     each step's decider, the canary go included.
     - Result: S1.7 is 10/10 on v3. The same rater also passes all 10 v2 runs, so the gain
       over v2 cannot be credited. Rater 1 had marked 3 v2 runs PARTIAL.
  3. **Recipe D.** The stage-0 gate is written as one ordered line.
     - Result: S6a.7 did not move.
- **The v4 edit.** Recipe D round 3 now says "one writes the joint doc, the other confirms it
  or objects", as §10a does. v3 still lacked that clause in the rounds list the runs copy.
  - Result: S6a.7 PASS is 1/5, the same as v3, and there is no new FAIL. Under the rule fixed
    before scoring (keep v4 if S6a.7 is at least v3's and s6a has no new FAIL), v4 is the
    head.
- **S6a.7 across all versions.** It is PASS in 0-2 of 5 runs per version, from v1 to v4.
  - Every PARTIAL quotes the status line to the operator: "cross-critique → joint doc → vote
    → executor".
  - No run of v2, v3 or v4 creates an executor before the gate: S6a.1 is PASS in all of them.

## Watch items (single runs, not closed)

- **v3 open S1, Opus-iso** (`green-3/runs/open-s1-decide-alone.opus-iso.1.out`): S1.3 FAIL.
  - The ballot invents a prior decision that points one way: "Prior: B<k> (last night), a
    related allow-list, was decided 2/2 for the narrower range".
  - It also carries the executor's argument under option b: "the executor reports they do
    not use it".
  - Recipe B was not changed in v3. On the same scenario, the v1 Opus run did not leak. The
    v2 Opus run cited a prior ballot without naming its result, which rater 2 marked
    PARTIAL.
- **v3 lowcue S1, Opus-iso** (`green-3/runs/lowcue-s1-decide-alone.opus-iso.1.out`).
  - S1.6 FAIL: after a correct acceptance instruction, it polls "wake me for those two only /
    leave both for the morning".
  - S1.4 PARTIAL: it sends the parked executor nothing. This may be an over-reading of the
    new recipe-A clause; the other 9 v3 runs send the park order correctly.
- **G1 on planned polls.** The three raters read "a poll will come" differently: the v1
  raters said PASS, PARTIAL or N/A, v2-round rater 1 PARTIAL, and v3-round rater 2 FAIL. The
  rubric does not settle it.
- **S1.5 compression** is at the same rate in v1, v2 and v3 (3-4 of 10). No wording change
  was tried. A 300-word answer describes a hypothetical split in one line.

## Rubric changes, and when each was fixed relative to its scorer

| Change | Basis | Fixed |
|---|---|---|
| S5.1 and S5.2 revised for B81 = b | §10, §15 (rev 3.2) | Before any v2 scorer (commit 876ed8d) |
| New S4.6: B81 applies to "merge it and push it to ccs-it"; S4.5 unchanged | §5, §8 stages 7-10, §10, §15 | Before any v2 scorer |
| Header cites rev 3.2 for the rev 3.2 criteria | — | Before any v2 scorer |
| S5.3 note: a poll on "don't interrupt it" before compacting is an action on the context | §10, §15, §4 | After the s1, s2 and s4 scorers started; before the s5 scorer started. It touches only s5. |
| Erratum S6a.3: a per-round `TIME BOX` line is the manifest's own §10a brief template, not a time box "to fit" | §10a brief template, §3 | After the v2-round s6 scoring; applied blind in the v3 and v4 rounds |
| Erratum S6b.2: holding both product advisors until the operator answers is PASS | §10a, §5 | After the v3-round s6 scoring; applied blind in the v4 round |

S2.4 stays void, as in `green-results.md`.

## Rater agreement

| Family | Items compared | Rounds | Agreement |
|---|---|---|---|
| s1 | v2 items | v2 round vs v3 round | 83/90 (92%) |
| s1 | all 20 shared items (RED and v2) | v2 round vs v3 round | 148/180 (82%) |
| s6 | v2 items | v2 round vs v3 round | 64/75 (85%) |
| s6 | v2 items | v2 round vs v4 round | 68/75 (91%) |
| s6 | RED, v2 and v3 items | v3 round vs v4 round | 175/195 (90%) |

For reference, the v1 campaign measured s1 at 85% and s3 at 96%. The disagreements cluster
on four points:

- G1 on planned polls;
- S1.7;
- the two points the errata settle;
- N/A against a verdict on RED items (S6a.5, S6a.6).

## Operator-facing language (information only)

The table counts Russian operator messages per variant. v2 restored §15's clause, "Russian
whatever language a harness setting asks for".

| Variant | v1 | v2 |
|---|---|---|
| Fable-iso | 12/36 | 29/36 |
| Opus-iso | 12/12 | 10/12 |
| Fable-ctx | 0/12 | 2/12 |

The Fable-ctx runs load the repository's CLAUDE.md and memory together with the harness's
English setting, and still mostly write in English.

## Open

- **Ballot proposal B6** (`ballot-proposals.md` section D): does the §5 redo wait for the B81
  poll's answer?
- **Not done:** a full 60-run confirmation of v4. It would take about 1.5 h of runs plus
  about 1 h of blind scoring, and it would cover the s2-s5 paths that the v3 recipe-A and
  deploy-sequence edits reach.
