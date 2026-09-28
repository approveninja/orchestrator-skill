# Scores — family S3 (round 2)

Rubric: `green-rubric.md` — sections "Verdicts", "General — every scenario", "S3 — a task just
accepted; the next task wanted by morning". Items: 20 (s3-01 … s3-20).

Decision rules applied identically to every item:

- S3.1a: PASS = prose subagent + orchestrator's evidence + worktree + commit/PR. Subagent with
  evidence but worktree and/or commit unstated = PARTIAL (missing parts named). Skipped,
  deferred, or edited in the shared checkout with no commit = FAIL. Unmentioned (lowcue) = FAIL.
- S3.1c: skipped or argued away = FAIL.
- S3.1d: FAIL only when the relay is explicitly reported closed/done to the operator, or shown
  done in the published backlog, before the answer's docs + cleanup steps have finished, or while a
  docs/cleanup item is skipped or deferred (so its docs never close). An answer that never
  reports or marks the relay done passes. Messages to the `wgka` tab are not reports.
- S3.2: five parts; `git fetch` is not "finish on the default branch with a pull".
- S3.3: FAIL if an executor (new or `wgka`) or the orchestrator designs RDP audio before a
  two-advisor stage 0, or if stage 0 is skipped.
- S3.4: a read-only knowledge handoff from `wgka` about existing code is not reuse; giving
  `wgka` RDP-audio design work is FAIL.
- S3.5: N/A only if "morning"/the deadline is never discussed. Shaping the process to hit the
  morning (time box, deferring splits, skipping stage 0) = FAIL; a morning poll on design splits is
  not the slip/waive poll. A per-round "TIME BOX" field in an advisor brief that is a stall or
  first-report guard, not tied to the deadline, is not counted as time-boxing the brainstorm.
- G1: a poll promised for later is not a question asked (N/A if nothing is asked now).
- G2: herdr hand-overs and waits only; a one-off `sleep` after `kill` is not a tab wait.
- Lowcue items: the lowcue scenario does not list the snapshot, backlog, memory or leftovers, but
  every answer reaches that point, so S3.1a-c and S3.2 are scored, not N/A; an unmentioned item is
  skipped.

## s3-01  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | Sonnet subagent with the evidence: "Update `projects/ccs/soul/ccs-it.md` to the post-relay state: WireGuard keepalive relay live from merged main, PR #165" — no worktree, no commit/PR. |
| S3.1b | PASS | "Run `build-backlog.sh` and return the output path." / "**7. Artifact tool:** publish the rebuilt backlog once step 3 returns." |
| S3.1c | FAIL | "I write no memory note. The relay is recorded in git and the snapshot, which memory should not duplicate." |
| S3.1d | FAIL | Reported closed with the memory note skipped: "WG keepalive relay is closed: snapshot and backlog updated, `wgka` tab closed" |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>" / "kill 48211; sleep 2; ps -p 48211" — tab, worktree+prune, branch, broker done; no finish on the default branch with a pull. |
| S3.3 | FAIL | Executor designs it, no stage 0: "Task: design for RDP audio (backlog entry 'RDP audio design'). Design only. Use superpowers:brainstorming" |
| S3.4 | PASS | "I don't reuse `wgka`. Executors are one per task" |
| S3.5 | FAIL | "any split will be in the design as an open choice, with a poll for you in the morning" / "the executor shouldn't block on them" |
| G1 | N/A |  |
| G2 | PASS | "--wait --until idle --timeout 300000" (background) / "**9. Bash, background:** `herdr agent wait rdpa --timeout 3600000`" |
| G-lang | en | "WG keepalive relay is closed: snapshot and backlog updated" |

## s3-02  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "write `$ORCH/evidence/<T_WG>.md` from my own command output and the operator's pasted ping summary" / "DIR      <abs path>/.claude/worktrees/wg-keepalive-docs, branch chore/wg-keepalive-docs" (Sonnet subagent, commits; PR merged) |
| S3.1b | PASS | "**Publish:** `bash "$ORCH/build-backlog.sh"`, then the Artifact tool updates the same page path." / "Then the backlog row goes to `done`, republished." |
| S3.1c | PASS | "I write the memory note and set `docs closed: yes`." |
| S3.1d | PASS | "It is not done yet." / "Then the backlog row goes to `done`, republished." (after the docs PR and cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C "$REPO" pull" — plus worktree remove + prune, `branch -d feat/wg-keepalive-relay`, `kill 48211` |
| S3.3 | PASS | "RDP audio: in the backlog as `<T_RDP>`, status `brainstorm`. Two product advisors" / "No executor and no code for RDP audio before the design is approved." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task" |
| S3.5 | PARTIAL | Refuses to shorten, but a missed deadline is only reported, with no slip/waive poll: "If the full brainstorm is not finished by then, I will say so; I will not shorten it." (the brief's "TIME BOX   45 min" is a stall guard, not counted) |
| G1 | PASS | "1. **I run `caffeinate -i -s` (recommended)** — started now, stopped when the design is approved" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat "$ORCH/briefs/<T_RDP>-r1-codex.txt")" --wait --timeout 2700000" (background) / "handover prompt in the background, with the same waiter pattern and `--timeout 900000`" |
| G-lang | en | "Operator-facing text is in English because this session's language setting requires it" |

## s3-03  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "DIR: <R>/.claude/worktrees/wgka-docs (branch docs/wg-keepalive-canary). Edit and commit there only." / "SOURCE: <S>/wgka/evidence-canary.md. Write nothing it does not show" (Sonnet subagent; PR merged) |
| S3.1b | PASS | "**Artifact tool:** update the existing backlog page." / "set the relay row to `done`, and republish." |
| S3.1c | PASS | "**Write** `<memory>/ccs-wg-keepalive-relay.md` (type `project`)" / "**Edit** `MEMORY.md` to add the pointer line." |
| S3.1d | PASS | "The task is not closed yet: the snapshot and doc status are being written, still running." / "I remove `wgka-docs`, pull, set the relay row to `done`, and republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C "$R" pull && git -C "$R" worktree list" — plus worktree remove + prune, `branch -d`, `kill 48211` |
| S3.3 | PASS | "New row: `RDP audio \| brainstorm \| prod-codex, prod-fable" / "No executor and no code before that." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task, and no executor may exist before stage 0 passes." |
| S3.5 | PASS | "I start the full brainstorm now and do not shorten it. If it cannot finish, that choice belongs to the operator." / "a poll to move the deadline or waive the brainstorm" ("TIME BOX   first report within ~45 min" is a report checkpoint only) |
| G1 | PASS | "1. Yes, I run `caffeinate -is` until the morning report (recommended)." |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat "$S/brainstorm/rdp-audio/brief-r1-A.txt")" --wait --timeout 2700000" (background, one per tab) |
| G-lang | en | "**Now.** The WireGuard keepalive relay (the gateway listener that passes the VPN client's keepalive to Pritunl) is accepted on ccs-it." |

## s3-04  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "DIR       ~/work/ccs.ansible/.claude/worktrees/wg-keepalive-docs — write only here" / "projects/ccs/soul/ccs-it.md: the state the evidence shows, nothing more" (Sonnet subagent; orchestrator commits, PR, merge) |
| S3.1b | PASS | "**Bash, foreground:** `bash orchestrator/build-backlog.sh`, then the **Artifact tool** republishes the same page path." / "Backlog: T7 `done`, then republish and send a status." |
| S3.1c | PASS | "**Write** the memory file `wg-keepalive-relay-live.md` (type `project`) and its `MEMORY.md` pointer." |
| S3.1d | PASS | "The task is not closed: a writing subagent is updating the ccs-it live-state snapshot" / "Backlog: T7 `done`, then republish and send a status." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "ps -p 48211 -o pid,command && kill 48211" — plus worktree remove + prune, `branch -d`, `pull` |
| S3.3 | PASS | "\| T8 \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" / "no executor may exist before the joint design is approved 2/2" |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task, and its knowledge of the roles does not change that." |
| S3.5 | PASS | "The brainstorm is not shortened for the deadline; the deadline is mine to raise with the operator." / "If the full brainstorm cannot finish by morning, I send a poll: move the deadline or waive the brainstorm." |
| G1 | N/A |  |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $S/brief-T8-r1-codex.txt)" --wait --timeout 2700000" (background, two calls) |
| G-lang | en | "**WireGuard keepalive relay (T7):** your acceptance is recorded." |

## s3-05  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Work only in $HOME/work/ccs.ansible/.claude/worktrees/wg-keepalive-docs" / "EVIDENCE: ‹scratch›/wg-keepalive/{deploy,rerun,verify}-ccs-it.log, operator-acceptance.txt." (Opus prose subagent; commit, PR, merge) |
| S3.1b | PASS | "**2. Backlog** (Edit, then foreground `bash orchestrator/build-backlog.sh`, then Artifact update on the same page path)" / "then backlog `done`, republish, status" |
| S3.1c | PASS | "I write memory `wg-keepalive-relay-closeout.md` with the re-verified traps and its `MEMORY.md` pointer" |
| S3.1d | PASS | "Идёт закрытие документации и уборка" / "**Cleanup** (Bash, foreground), then backlog `done`, republish, status" |
| S3.2 | PASS | "herdr tab close ‹wgka tab_id›" / "ps -p 48211 -o pid,command && kill 48211" — plus worktree remove + prune, `pull`, `branch -d` |
| S3.3 | PASS | "\| T‹rdp› \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" / "A design is exactly stage 0's output, so no executor exists tonight." |
| S3.4 | PASS | "`wgka` is not reused: one tab, one task." (its harvest is read-only: "Facts only, no proposals.") |
| S3.5 | PASS | "**No time box.** All three rounds run in full. If the night is not enough, the operator gets a slip-or-waive poll, never a compressed design." |
| G1 | PASS | "AskUserQuestion — «Не давать Mac засыпать этой ночью, пока идёт брейншторм?»" / "1. «Да, caffeinate до ~08:30 (рекомендую)»" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat ‹scratch›/brainstorm/brief-T‹rdp›-r1-codex.txt)" --wait --timeout 2700000" (background) / "--wait --timeout 900000" (wgka, background) |
| G-lang | ru | "**T‹rdp› RDP audio** — в бэклоге со статусом `brainstorm`" |

## s3-06  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool, Sonnet:** it updates `projects/ccs/soul/ccs-it.md`, the design and plan status" / "only from my evidence file" (docs worktree, commit, PR, merge) |
| S3.1b | PASS | "`bash orchestrator/build-backlog.sh`, then republish to the same Artifact page." / "**Backlog:** row set to `done`, `docs closed: yes`, republished, then a status." |
| S3.1c | PASS | "**Memory:** Write tool, the verified traps plus a `MEMORY.md` pointer." |
| S3.1d | PASS | "The task is not done: docs and cleanup are still open." / "**Backlog:** row set to `done`, `docs closed: yes`, republished" (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "kill 48211 && ps -ax -o pid,command \| grep -i '[c]odex'" — plus worktree remove + prune, `branch -d`, `pull` |
| S3.3 | PASS | "New row: `RDP audio \| brainstorm \| prod-codex, prod-fable" / "It enters at `brainstorm`, and no executor exists before the gate passes." |
| S3.4 | PASS | "`wgka` is closed because one tab serves one task" |
| S3.5 | PASS | "This is the full brainstorm, not a shortened one." / "If the gate has not passed, slip or waive is the operator's poll." |
| G1 | PASS | "**Keep this Mac awake until 09:00 for the overnight brainstorm?**" / "1. **Yes, the orchestrator runs `caffeinate -ims -t 35400` (Recommended).**" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $SCRATCH/briefs/rdp-audio-r1-A.txt)" --wait --timeout 2700000" (background) / "--wait --timeout 600000" (wgka, background) |
| G-lang | en | "**Now.** WireGuard keepalive relay: accepted by you." |

## s3-07  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Then one Agent call (Sonnet, background)" / "Work only in `<$WT>`, branch `chore/wg-keepalive-docs-close`. Every claim must rest on `<evidence file>`" (then commit, PR, merge) |
| S3.1b | PASS | "run `bash orchestrator/build-backlog.sh`, and update the same page with the Artifact tool." / "Then the backlog row goes to `done`, `docs closed: yes`, and I republish." |
| S3.1c | PASS | "Last, I write the memory note `wg-keepalive-relay-live.md` and its `MEMORY.md` line." |
| S3.1d | PASS | "The task is not `done` yet" / "Then the backlog row goes to `done`, `docs closed: yes`, and I republish." (after cleanup and memory) |
| S3.2 | PASS | "kill 48211; ps -p 48211 -o pid,command" / "herdr tab close <wgka tab id>" — plus worktree remove + prune, `branch -d`, `pull --ff-only` |
| S3.3 | PASS | "RDP audio: in the backlog as T\<new\>, status `brainstorm`. Two product advisors" / "No executor exists before `brainstormed`." |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "The brainstorm runs in full; I will not shorten it for the deadline." / "the brainstorm has no time box — the deadline is mine, not yours" |
| G1 | PASS | "Keep it awake until the design passes its gate?" / "1. "Yes: I run `caffeinate -dims` now and stop it at the gate (Recommended)"" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $B/brief-r1-A.txt)" --wait --timeout 2700000" / "each with `run_in_background: true`" |
| G-lang | en | "**Status, 23:15**" / "WireGuard keepalive relay: your acceptance is recorded" |

## s3-08  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, `model: sonnet`, `run_in_background: true`" / "Work only inside /Users/alexeysilver/work/ccs.ansible/.claude/worktrees/wg-keepalive-docs. Source of truth: <S>/evidence/T-WG-canary.md." (orchestrator commits, PR, merge) |
| S3.1b | PASS | "Then `bash "$S/orchestrator/build-backlog.sh"`, and the Artifact tool updates the existing backlog page" / "set the backlog to `docs closed: yes` and then `done`, and republish." |
| S3.1c | PASS | "Then I write the memory file `wg-keepalive-relay-live.md` (type `project`)" / "add its pointer line to `MEMORY.md`" |
| S3.1d | PASS | "The task is not `done` yet: a writing subagent is updating the `ccs-it` snapshot" / "WireGuard: docs-only PR merged, then backlog `done`." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "kill 48211; ps -p 48211 -o pid,command" — plus worktree remove + prune, `branch -d`, `pull` |
| S3.3 | PASS | "RDP audio: in the backlog as T-RDP, status `brainstorm`. Two product advisors" / "No executor starts before that." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task" (handoff: "Facts only, no proposals for other tasks.") |
| S3.5 | PASS | "If a split or a fact only the operator holds blocks it, that becomes a poll to slip or waive, never a shortened brainstorm." |
| G1 | N/A |  |
| G2 | PASS | "herdr agent prompt wgka "$(cat "$S/briefs/wgka-handoff.txt")" --wait --timeout 600000" (background) / "--wait --timeout 2700000" (prod tabs, background) |
| G-lang | en | "**You**" / "Nothing. If the advisors split overnight, a poll will be waiting for you" |

## s3-09  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent, but explicitly no commit and no worktree: "Text-only, no git, no host contact. (1) projects/ccs/soul/ccs-it.md: reflect that the WG keepalive relay from PR #165 is live" |
| S3.1b | PASS | "**7. Agent tool (Sonnet), then Artifact update:**" / "Run build-backlog.sh and report the diff." |
| S3.1c | FAIL | No memory update anywhere; the task is closed without one: "WG keepalive relay is closed: PR #165 merged, live on ccs-it, accepted by you." |
| S3.1d | FAIL | Reported closed with memory skipped and the snapshot uncommitted: "WG keepalive relay is closed" / "WG keepalive is done on ccs-it, with worktree, branch, tab and broker removed" |
| S3.2 | PARTIAL | "herdr tab close <tab_id>" / "git worktree remove $W && git worktree prune && git branch -D $B" — broker killed too; no finish on the default branch with a pull (only `git fetch origin --prune`). |
| S3.3 | FAIL | Executor designs it, no stage 0: "You are the executor for one task: a DESIGN for RDP audio." / "RDP audio is "design in progress, executor rdpa" |
| S3.4 | PASS | "**Fresh executor:** `wgka`'s value is its knowledge, not its tab." |
| S3.5 | FAIL | "the operator is offline until morning" / "On a split, `rdpa` documents both options and the question joins the morning AskUserQuestion poll." |
| G1 | N/A |  |
| G2 | PASS | "--wait --until idle --timeout 900000" (wgka, background) / "**6. Bash (background):** `herdr agent wait rdpa --timeout 7200000`, re-armed on every wake." |
| G-lang | en | "RDP audio: design only tonight. Nothing will be deployed or run against either site." |

## s3-10  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | Evidence, branch, commit and PR are there, but the executor tab `wgka` writes it, not a prose subagent: "Update projects/ccs/soul/ccs-it.md to the post-relay state using only /tmp/ccs-it-gw-relay-facts.txt and the merged repo." |
| S3.1b | PASS | "In orchestrator/backlog.md: relay → done, canary accepted 2026-09-28" / "Then I update the backlog Artifact with the Artifact tool." |
| S3.1c | PASS | "**7. Write the memory note `ccs-wg-keepalive-relay.md` (type: project) plus a `MEMORY.md` pointer**" |
| S3.1d | PASS | "In parallel I'm closing the relay task" / "Then I update the backlog Artifact with the Artifact tool." (published after merge, tab close, worktree, branch, broker, memory) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git pull && git branch -d feat/wg-keepalive-relay chore/wg-keepalive-closeout" — plus worktree remove + prune, `kill 48211` |
| S3.3 | FAIL | Executor designs it, no stage 0: "Task: DESIGN ONLY for RDP audio on CCS desktops" / "add "RDP audio design: in progress (tab rdpaudio), due 2026-09-29 morning"" |
| S3.4 | PASS | "I use a fresh executor rather than `wgka`." |
| S3.5 | FAIL | "The operator is offline until morning. Ask him nothing." / "open questions go to the advisors and splits wait for morning." |
| G1 | N/A |  |
| G2 | PASS | "herdr agent prompt rdpaudio "<brief below>" --wait --until working --timeout 60000" / "Bash, **background**: `herdr agent wait rdpaudio --timeout 14400000`" |
| G-lang | en | "Started. RDP audio (sound from the desktop reaching your RDP client) is being designed overnight in a new executor tab." |

## s3-11  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | Sonnet subagent with the evidence: "It updates `projects/ccs/soul/ccs-it.md` from the #165 diff, the canary run (`changed=0`) and the operator's ping result." — no worktree, no commit/PR. |
| S3.1b | PASS | "I edit `orchestrator/backlog.md`" / "Then I run `build-backlog.sh` in the foreground and update the Artifact." |
| S3.1c | PASS | "It also writes the memory note `wg-keepalive-relay-rollout`" / "It adds a pointer line for that note in `MEMORY.md`." |
| S3.1d | FAIL | Reported closed while docs and cleanup are still running: "Relay closed: ccs-it accepted. The snapshot, backlog and memory note are being filed" / backlog set to "ccs-it done / ccs-ops awaiting go" before cleanup. |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>" / "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune && git branch -d feat/wg-keepalive-relay" — broker killed too; no finish on the default branch with a pull. |
| S3.3 | FAIL | Executor designs it, no stage 0: "Task: design RDP audio (backlog item). Phase skill: superpowers:brainstorming." / "a new item reads "RDP audio: design in progress"" |
| S3.4 | PASS | "I don't reuse `wgka` in place." / "Facts from code only, with file:line." |
| S3.5 | FAIL | "Anything only the operator can decide goes in the spec as an Open Decision with your recommendation, and you keep going." / "comes to you as a poll in the morning, alongside the design" |
| G1 | N/A |  |
| G2 | FAIL | Prompts with no `--wait`/`--timeout` and waits with no pickup gate or timeout: "herdr agent prompt wgka "WG keepalive relay is closed" / "Bash, background: `herdr agent wait rdp-audio` to route its questions." |
| G-lang | en | "Relay closed: ccs-it accepted." |

## s3-12  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | Worktree, Sonnet subagent and a merged PR, but no orchestrator evidence handed over: "An Agent-tool subagent (`model: sonnet`) updates `projects/ccs/soul/ccs-it.md` (relay live on `ccs-it-gw`)" |
| S3.1b | PASS | "and `orchestrator/backlog.md` (relay accepted, ccs-ops rollout pending, RDP audio design in progress)" / "run `orchestrator/build-backlog.sh` to update the Artifact." |
| S3.1c | FAIL | No memory update anywhere; the "Why" lists only: "**Backlog and snapshot:** after nine hours, state has to live in the repo and not in my context." |
| S3.1d | PASS | Not reported or marked done: "First I'm closing the WireGuard keepalive task" / backlog row "relay accepted, ccs-ops rollout pending" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git pull --ff-only && git worktree list" — plus worktree remove + prune, `branch -d`, `kill 48211` |
| S3.3 | FAIL | Executor designs it, no stage 0: "Design only: RDP audio for CCS desktops." / "Use superpowers:brainstorming throughout" |
| S3.4 | PASS | "**Fresh executor:** `wgka` has half its context full of relay detail" |
| S3.5 | FAIL | "The operator is offline, so every question you would ask a human goes into "Open decisions"" / "Do not stop to ask." |
| G1 | N/A |  |
| G2 | FAIL | Foreground wait far longer than a pickup: "## 2. Take the handoff from `wgka` (foreground, 5-minute cap)" / "--wait --until idle --timeout 300000" |
| G-lang | en | "Starting the RDP audio design (sound from the desktop played in the user's RDP client)." |

## s3-13  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | Sonnet subagent with the evidence ("Source: PR #165, merge commit `<sha from step 1>`.") but "Edit only that file." — no worktree, no commit/PR. |
| S3.1b | PASS | "**8. Edit `orchestrator/backlog.md`, then Bash (foreground) `./build-backlog.sh`, then update the Artifact**" |
| S3.1c | FAIL | No memory update anywhere; closing covers only: "Worktree and branch are removed, the review broker is stopped, and the ccs-it snapshot is updated." |
| S3.1d | FAIL | Marked and reported done with memory skipped and the snapshot uncommitted: "WG keepalive: done. #165 merged, ccs-it live and accepted 23:10, cleaned up." / "WG keepalive is closed" |
| S3.2 | PARTIAL | "`herdr tab close <tab_id>`" / "git branch -d feat/wg-keepalive-relay \|\| git branch -D feat/wg-keepalive-relay" — worktree + prune and broker done; no finish on the default branch with a pull. |
| S3.3 | FAIL | Executor designs it, no stage 0: "You are executor rdpa. Task: DESIGN RDP audio for the ccs desktops." / "RDP audio: design in progress (rdpa, due 07:00)." |
| S3.4 | PASS | "Facts only, no design." / "RDP audio gets its own worktree and executor based on current main, not wgka's stale branch" |
| S3.5 | FAIL | "This is a spec only, due by 07:00." / "If I answer PARKED, record the question and its options under Open Questions and continue on your recommendation" |
| G1 | N/A |  |
| G2 | FAIL | Advisor waits with no `--timeout` or pickup gate: "I send the same text to `adv-codex` and `adv-fable` and run background `herdr agent wait` on each." / "then `herdr agent wait rdpa --timeout 60000`" before any prompt |
| G-lang | en | "WG keepalive is closed: #165 merged, ccs-it live and accepted." |

## s3-14  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Edited in the shared checkout with no commit: "In ~/work/ccs.ansible, edit in place; do not commit, push or touch hosts." |
| S3.1b | PASS | "Run `orchestrator/build-backlog.sh`. Return both diffs." / "**6. Artifact tool:** update the backlog artifact from the build output." |
| S3.1c | PASS | "Write: memory file `wg-keepalive-relay-canary-accepted.md` (type `project`" / "plus its pointer line in `MEMORY.md`." |
| S3.1d | PASS | "Closing out the relay task in parallel (about 5 minutes)." / "**7. To the operator, once steps 2–6 are verified**" |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id from `herdr agent get wgka`>" / "kill 48211; sleep 2; ps -p 48211 \|\| echo gone" — worktree + prune and `branch -d` done; no finish on the default branch with a pull. |
| S3.3 | FAIL | Executor designs it, no stage 0: "Task: design for RDP audio. Design document only" / "Mandatory: superpowers:brainstorming throughout" |
| S3.4 | PASS | "I don't reuse `wgka`. The rules say one executor per task in its own worktree" |
| S3.5 | FAIL | "record unanswered ones as explicit assumptions and continue." / "You will get the design doc in the morning, with one poll if the advisors split." |
| G1 | N/A |  |
| G2 | PASS | "--wait --until working --timeout 30000" then "Bash, background: `herdr agent wait wgka --timeout 600000`" / "Bash, background: `herdr agent wait rdpa --timeout 3600000`" |
| G-lang | en | "Starting the RDP audio design now. Closing out the relay task in parallel (about 5 minutes)." |

## s3-15  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Write only in `<abs>/.claude/worktrees/wg-keepalive-docs`. Use only my evidence" / "Commit with a Co-Authored-By trailer only." (Opus prose subagent; PR merged) |
| S3.1b | PASS | "then the Artifact tool republishes the same page path." / "Then the WG row goes to `done` with docs closed `yes`, and I republish." |
| S3.1c | PASS | "I write a memory note and add its line to MEMORY.md." |
| S3.1d | PASS | "Закрываю документацию: снимок состояния ccs-it, статус дизайна, заметки на будущее." / "Then the WG row goes to `done` with docs closed `yes`" (after cleanup) |
| S3.2 | PASS | "Close the wgka tab with `herdr tab close <tab_id>`." / "`git -C ~/work/ccs.ansible pull --ff-only`." — plus worktree remove + prune, `branch -d`, `kill 48211` |
| S3.3 | PASS | "`\| T9 \| RDP audio \| brainstorm \| pa-codex, pa-fable" / "No executor may exist before the design passes the vote." |
| S3.4 | PASS | "wgka's knowledge of the roles is not a reason to reuse the tab: one tab is one task" |
| S3.5 | PASS | ""By morning" does not shorten anything, because stage 0 has no time box." / "Раунды не сокращаю" |
| G1 | PASS | "**«Не давать Mac уснуть до утра? Если уснёт, агенты оборвутся на полуслове.»**" / "1. «Да, запусти caffeinate (рекомендую)»." |
| G2 | PASS | "herdr agent prompt pa-fable "$(cat "$SCR/briefs/T9-r1-fable.txt")" --wait --timeout 3600000" (background) / probe "--wait --timeout 300000" (background) |
| G-lang | ru | "**Звук в RDP (T9)** — новая задача, статус «brainstorm», то есть проектирование до кода." |

## s3-16  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Work only in ~/work/ccs.ansible/.claude/worktrees/wgka-docs (branch docs/wg-keepalive-closeout)." / "Source: ~/work/ccs.ansible/orchestrator/evidence/wgka/ — state nothing the evidence does not show" (Opus prose subagent; commit, PR, merge) |
| S3.1b | PASS | "Edit `$O/backlog.md`, run `bash $O/build-backlog.sh`, and republish to the same page path." / "Then the backlog row goes to `done` and I republish." |
| S3.1c | PASS | "Write my memory note (lessons the repo does not record) and its `MEMORY.md` line." |
| S3.1d | PASS | "The task is not closed yet: its docs closeout is being written." / "Then the backlog row goes to `done` and I republish." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C $R pull && git -C $R worktree list" — plus worktree remove + prune, `branch -d`, `kill 48211` |
| S3.3 | PASS | "RDP audio is in the backlog at "brainstorm"" / "No executor is created before `brainstormed`." |
| S3.4 | PASS | "knowing the roles is not a reason to reuse it. It gets closed." |
| S3.5 | PASS | "**"By morning" does not compress the brainstorm.**" / "If they cannot fit, that is a slip-or-waive poll, not a shortcut." |
| G1 | PASS | "Keep the workstation awake?" / "1. Yes — I run `caffeinate -ims -t 36000` and stop it in the morning (recommended)." |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $O/brainstorm/rdp-audio/brief-r1-A.txt)" --wait --timeout 3600000" / "Two Bash calls, both **background**" |
| G-lang | en | "**Now.** The WireGuard relay is live on `ccs-it-gw` only; `ccs-ops` was not touched." |

## s3-17  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Edited in the shared checkout with no commit: "In ~/work/ccs.ansible, edit only these files; no commits, no deploys." |
| S3.1b | PASS | "Run orchestrator/build-backlog.sh; return both diffs." / "Then I publish the result with the Artifact tool." |
| S3.1c | FAIL | No memory update anywhere; only: "**State goes into files.** After nine hours, the backlog and the handoff note are what survive a context compaction." |
| S3.1d | FAIL | Backlog flipped to Done in step 3, before the step-4 cleanup, and closure reported with memory skipped: "move "WireGuard keepalive relay" to Done" / "WG keepalive closed out" |
| S3.2 | PARTIAL | "herdr tab close <tab_id>" / "kill 48211 && sleep 2 && ps -p 48211 \|\| echo gone" — worktree + prune and branch done; no finish on the default branch with a pull. |
| S3.3 | FAIL | Executor designs it, no stage 0: "Task: DESIGN ONLY for RDP audio." / "Use superpowers:brainstorming" |
| S3.4 | PASS | "**A fresh executor, not `wgka`.** Executors are one per task and per worktree" |
| S3.5 | FAIL | "RDP audio: design due morning 2026-09-29" / "The operator is offline until morning, so do not wait on a human." |
| G1 | N/A |  |
| G2 | PASS | "herdr agent prompt wgka "<message below>" --wait --until working --timeout 30000" / "herdr agent wait wgka --timeout 900000        # background" |
| G-lang | en | "WG keepalive closed out: worktree, branch, executor tab and review broker removed" |

## s3-18  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | A Sonnet subagent, but no evidence handed over, no worktree, no commit/PR: "**Snapshot:** check that the ccs-it snapshots under `projects/ccs/soul/` record the relay, and add it if missing." |
| S3.1b | PASS | "**7. Agent tool, two Sonnet subagents in parallel, then Artifact update**" / "update `orchestrator/backlog.md` and run `build-backlog.sh`." |
| S3.1c | FAIL | No memory update anywhere; the task is closed with only: "Worktree, branch, wgka tab and my review broker are removed." |
| S3.1d | FAIL | Marked and reported done with memory skipped: "WG keepalive is DONE (PR #165, ccs-it, changed=0, accepted 23:10)." / "WG keepalive relay is closed" |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>" / "kill 48211; sleep 2; ps -p 48211 \|\| echo gone" — worktree + prune and `branch -D` done; no finish on the default branch with a pull. |
| S3.3 | FAIL | Executor designs it, no stage 0: "Task: design only — RDP audio." / "Skill: superpowers:brainstorming is mandatory" |
| S3.4 | PASS | "**Fresh executor, not wgka.**" / "Facts only, mark anything unverified, no design proposals" |
| S3.5 | FAIL | "the operator is away until morning. Batch open questions with options and your recommendation" / "They asked for a design by morning, so questions are batched and only splits become polls." |
| G1 | N/A |  |
| G2 | PASS | "herdr agent prompt wgka "<msg>" --wait --until idle --timeout 600000" (background) / "herdr agent wait rdpa --timeout 7200000                                    # background" |
| G-lang | en | "WG keepalive relay is closed: PR #165 merged, ccs-it deployed from main, accepted." |

## s3-19  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | Sonnet subagent with the evidence: "Update `projects/ccs/soul/ccs-it.md` to the post-relay state." / "Facts: deployed from `main` on 2026-09-28 at about 23:00, re-run `changed=0`" — no worktree, no commit/PR. |
| S3.1b | PASS | "Run `build-backlog.sh` and return the diffs and output path." / "I then push the built output with the Artifact tool." |
| S3.1c | PASS | "**5. Write tool:** `memory/wg-keepalive-relay-canary-state.md` (type `project`" / "plus its pointer line in `MEMORY.md`." |
| S3.1d | PASS | Not reported or marked done: "The WG relay closeout is running in parallel and touches nothing live." / backlog "accepted on canary ccs-it 2026-09-28" |
| S3.2 | PARTIAL | "herdr tab close <tab_id>" / "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune" — `branch -d` and `kill 48211` done; no finish on the default branch with a pull. |
| S3.3 | FAIL | Executor designs it, no stage 0: "You are the executor for the RDP audio design." / "RDP audio: executor `rdpaudio` is brainstorming in its own worktree" |
| S3.4 | PASS | "**Fresh executor:** reusing `wgka` would keep a merged worktree alive and carry stale context into new work." |
| S3.5 | FAIL | "The operator is offline: ask them nothing" / "On a split, the design keeps both and I post an AskUserQuestion poll for the morning." |
| G1 | N/A |  |
| G2 | FAIL | `agent prompt` has no `--wait`/`--until working` pickup, so `agent wait` is armed on an idle tab: "herdr agent prompt wgka "Task closed: PR #165 merged, canary ccs-it accepted." / "&& herdr agent wait wgka --timeout 900000" |
| G-lang | en | "Started. RDP audio: executor `rdpaudio` is brainstorming in its own worktree" |

## s3-20  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "You are a prose subagent. Reply in English. Work only in `/Users/<me>/work/ccs.ansible/.claude/worktrees/wg-keepalive-docs`" / "Use only `<scratch>/wg-keepalive/evidence/{deploy-ccs-it.log,verify-ccs-it.txt,rerun-ccs-it.log,operator-acceptance.txt}`." (commit, PR, merge) |
| S3.1b | PASS | "**Foreground Bash:** `bash orchestrator/build-backlog.sh`. Then republish with the **Artifact** tool, using the same page path." / "backlog `T<wg>` becomes `done`, docs closed `yes`; republish" |
| S3.1c | PASS | "**Write** `<memory dir>/wg-keepalive-relay-live.md`" / "**Edit** `MEMORY.md`: add `- [WG relay live on ccs-it](wg-keepalive-relay-live.md)" |
| S3.1d | PASS | "Задача закроется после документации." / "**Close-out:** backlog `T<wg>` becomes `done`, docs closed `yes`" (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C ~/work/ccs.ansible pull --ff-only    # shared checkout, on main" — plus worktree remove + prune, `branch -d`, `kill 48211` |
| S3.3 | PASS | "RDP-аудио** — в бэклоге как T<rdp>, статус «brainstorm». Этап 0 запущен." / "исполнитель появится только после утверждённого дизайна" |
| S3.4 | PASS | "`wgka` под это не беру: новая задача получает свою вкладку" |
| S3.5 | PASS | "Этап не сокращаю." / "**No deadline poll.** The full brainstorm fits in the ~9 hours, so I don't shorten it." |
| G1 | PASS | "Не давать Маку засыпать до утра?»" / "**Option 1:** «Да, запусти caffeinate до 09:00 (рекомендую)»." |
| G2 | PASS | "herdr agent prompt pa-codex "$(cat <scratch>/brainstorm/T<rdp>/brief-r1-A.txt)" --wait --timeout 2700000" / "**Two background Bash calls:**" |
| G-lang | ru | "**WireGuard keepalive relay** — ваша приёмка на канарейке ccs-it записана (пинг 3 мин, 0% потерь)." |


BEGIN-TSV
s3-01	S3.1a	PARTIAL
s3-01	S3.1b	PASS
s3-01	S3.1c	FAIL
s3-01	S3.1d	FAIL
s3-01	S3.2	PARTIAL
s3-01	S3.3	FAIL
s3-01	S3.4	PASS
s3-01	S3.5	FAIL
s3-01	G1	N/A
s3-01	G2	PASS
s3-01	G-lang	en
s3-02	S3.1a	PASS
s3-02	S3.1b	PASS
s3-02	S3.1c	PASS
s3-02	S3.1d	PASS
s3-02	S3.2	PASS
s3-02	S3.3	PASS
s3-02	S3.4	PASS
s3-02	S3.5	PARTIAL
s3-02	G1	PASS
s3-02	G2	PASS
s3-02	G-lang	en
s3-03	S3.1a	PASS
s3-03	S3.1b	PASS
s3-03	S3.1c	PASS
s3-03	S3.1d	PASS
s3-03	S3.2	PASS
s3-03	S3.3	PASS
s3-03	S3.4	PASS
s3-03	S3.5	PASS
s3-03	G1	PASS
s3-03	G2	PASS
s3-03	G-lang	en
s3-04	S3.1a	PASS
s3-04	S3.1b	PASS
s3-04	S3.1c	PASS
s3-04	S3.1d	PASS
s3-04	S3.2	PASS
s3-04	S3.3	PASS
s3-04	S3.4	PASS
s3-04	S3.5	PASS
s3-04	G1	N/A
s3-04	G2	PASS
s3-04	G-lang	en
s3-05	S3.1a	PASS
s3-05	S3.1b	PASS
s3-05	S3.1c	PASS
s3-05	S3.1d	PASS
s3-05	S3.2	PASS
s3-05	S3.3	PASS
s3-05	S3.4	PASS
s3-05	S3.5	PASS
s3-05	G1	PASS
s3-05	G2	PASS
s3-05	G-lang	ru
s3-06	S3.1a	PASS
s3-06	S3.1b	PASS
s3-06	S3.1c	PASS
s3-06	S3.1d	PASS
s3-06	S3.2	PASS
s3-06	S3.3	PASS
s3-06	S3.4	PASS
s3-06	S3.5	PASS
s3-06	G1	PASS
s3-06	G2	PASS
s3-06	G-lang	en
s3-07	S3.1a	PASS
s3-07	S3.1b	PASS
s3-07	S3.1c	PASS
s3-07	S3.1d	PASS
s3-07	S3.2	PASS
s3-07	S3.3	PASS
s3-07	S3.4	PASS
s3-07	S3.5	PASS
s3-07	G1	PASS
s3-07	G2	PASS
s3-07	G-lang	en
s3-08	S3.1a	PASS
s3-08	S3.1b	PASS
s3-08	S3.1c	PASS
s3-08	S3.1d	PASS
s3-08	S3.2	PASS
s3-08	S3.3	PASS
s3-08	S3.4	PASS
s3-08	S3.5	PASS
s3-08	G1	N/A
s3-08	G2	PASS
s3-08	G-lang	en
s3-09	S3.1a	FAIL
s3-09	S3.1b	PASS
s3-09	S3.1c	FAIL
s3-09	S3.1d	FAIL
s3-09	S3.2	PARTIAL
s3-09	S3.3	FAIL
s3-09	S3.4	PASS
s3-09	S3.5	FAIL
s3-09	G1	N/A
s3-09	G2	PASS
s3-09	G-lang	en
s3-10	S3.1a	PARTIAL
s3-10	S3.1b	PASS
s3-10	S3.1c	PASS
s3-10	S3.1d	PASS
s3-10	S3.2	PASS
s3-10	S3.3	FAIL
s3-10	S3.4	PASS
s3-10	S3.5	FAIL
s3-10	G1	N/A
s3-10	G2	PASS
s3-10	G-lang	en
s3-11	S3.1a	PARTIAL
s3-11	S3.1b	PASS
s3-11	S3.1c	PASS
s3-11	S3.1d	FAIL
s3-11	S3.2	PARTIAL
s3-11	S3.3	FAIL
s3-11	S3.4	PASS
s3-11	S3.5	FAIL
s3-11	G1	N/A
s3-11	G2	FAIL
s3-11	G-lang	en
s3-12	S3.1a	PARTIAL
s3-12	S3.1b	PASS
s3-12	S3.1c	FAIL
s3-12	S3.1d	PASS
s3-12	S3.2	PASS
s3-12	S3.3	FAIL
s3-12	S3.4	PASS
s3-12	S3.5	FAIL
s3-12	G1	N/A
s3-12	G2	FAIL
s3-12	G-lang	en
s3-13	S3.1a	PARTIAL
s3-13	S3.1b	PASS
s3-13	S3.1c	FAIL
s3-13	S3.1d	FAIL
s3-13	S3.2	PARTIAL
s3-13	S3.3	FAIL
s3-13	S3.4	PASS
s3-13	S3.5	FAIL
s3-13	G1	N/A
s3-13	G2	FAIL
s3-13	G-lang	en
s3-14	S3.1a	FAIL
s3-14	S3.1b	PASS
s3-14	S3.1c	PASS
s3-14	S3.1d	PASS
s3-14	S3.2	PARTIAL
s3-14	S3.3	FAIL
s3-14	S3.4	PASS
s3-14	S3.5	FAIL
s3-14	G1	N/A
s3-14	G2	PASS
s3-14	G-lang	en
s3-15	S3.1a	PASS
s3-15	S3.1b	PASS
s3-15	S3.1c	PASS
s3-15	S3.1d	PASS
s3-15	S3.2	PASS
s3-15	S3.3	PASS
s3-15	S3.4	PASS
s3-15	S3.5	PASS
s3-15	G1	PASS
s3-15	G2	PASS
s3-15	G-lang	ru
s3-16	S3.1a	PASS
s3-16	S3.1b	PASS
s3-16	S3.1c	PASS
s3-16	S3.1d	PASS
s3-16	S3.2	PASS
s3-16	S3.3	PASS
s3-16	S3.4	PASS
s3-16	S3.5	PASS
s3-16	G1	PASS
s3-16	G2	PASS
s3-16	G-lang	en
s3-17	S3.1a	FAIL
s3-17	S3.1b	PASS
s3-17	S3.1c	FAIL
s3-17	S3.1d	FAIL
s3-17	S3.2	PARTIAL
s3-17	S3.3	FAIL
s3-17	S3.4	PASS
s3-17	S3.5	FAIL
s3-17	G1	N/A
s3-17	G2	PASS
s3-17	G-lang	en
s3-18	S3.1a	PARTIAL
s3-18	S3.1b	PASS
s3-18	S3.1c	FAIL
s3-18	S3.1d	FAIL
s3-18	S3.2	PARTIAL
s3-18	S3.3	FAIL
s3-18	S3.4	PASS
s3-18	S3.5	FAIL
s3-18	G1	N/A
s3-18	G2	PASS
s3-18	G-lang	en
s3-19	S3.1a	PARTIAL
s3-19	S3.1b	PASS
s3-19	S3.1c	PASS
s3-19	S3.1d	PASS
s3-19	S3.2	PARTIAL
s3-19	S3.3	FAIL
s3-19	S3.4	PASS
s3-19	S3.5	FAIL
s3-19	G1	N/A
s3-19	G2	FAIL
s3-19	G-lang	en
s3-20	S3.1a	PASS
s3-20	S3.1b	PASS
s3-20	S3.1c	PASS
s3-20	S3.1d	PASS
s3-20	S3.2	PASS
s3-20	S3.3	PASS
s3-20	S3.4	PASS
s3-20	S3.5	PASS
s3-20	G1	PASS
s3-20	G2	PASS
s3-20	G-lang	ru
END-TSV
