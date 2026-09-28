# Scores — family s3 (v2 items)

Rubric: `green-rubric.md`, sections "Verdicts", "General — every scenario" and "S3". Scorer policy applied to every item:
G2 covers briefs, ballots and waits (a prose-only `/compact` or status ping is not a hand-over); S3.5 treats a "time to first report" line as a check-in cadence, not a cut; G1 is `N/A` when every poll mentioned is conditional and none is shown; G-lang judges operator-facing text only.

## s3-01  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "(Agent tool, Sonnet, background)"; "Work only in ‹absolute path›/.claude/worktrees/wg-keepalive-docs" … "Then I commit, push, open the PR and merge it" |
| S3.1b | PASS | "Backlog (Edit, foreground `bash build-backlog.sh`, Artifact update)"; "The WireGuard row becomes `done` and I republish." |
| S3.1c | PASS | "Then I write two memory notes with `MEMORY.md` pointers: `wg-keepalive-relay-lessons` (the verified traps)" |
| S3.1d | PASS | "Задача ещё не `done`: закрываю документацию"; "WireGuard is accepted, not done. `done` needs the docs checklist and the cleanup." |
| S3.2 | PASS | "herdr tab close ‹wgka tab_id›"; "kill 48211" — worktree remove + prune, `branch -d feat/wg-keepalive-relay`, and `git -C "$REPO" pull` are all in the same cleanup block |
| S3.3 | PASS | "RDP audio is a new task, so it enters at stage 0: a backlog entry, two product advisors from two model families"; "No executor is created before that." |
| S3.4 | PASS | "`wgka` is not reused. One tab is one task" |
| S3.5 | PASS | "is a wish that shortens no round and waives no gate."; "If that changes, the operator gets the slip-or-waive poll." |
| G1 | N/A | — (no poll or question is put to the operator; the status says nothing is needed from them, and every poll mentioned is conditional) |
| G2 | PASS | "--wait --timeout 2700000"; "Bash, background, `--timeout 600000`, same recipe" |
| G-lang | ru | "сейчас ничего. Если понадобится факт, известный только вам, придёт опрос" |

## s3-02  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "Text-only, no git, no host contact. (1) projects/ccs/soul/ccs-it.md: reflect that the WG keepalive relay from PR #165 is live" — a Sonnet subagent edits the snapshot, but with no worktree, no commit and no PR |
| S3.1b | PASS | "Agent tool (Sonnet), then Artifact update:"; "Run build-backlog.sh and report the diff." |
| S3.1c | FAIL | "WG keepalive relay is closed: PR #165 merged, live on ccs-it, accepted by you." — no memory note is written anywhere in the answer |
| S3.1d | FAIL | "This task is closed and this tab will be shut down."; "WG keepalive relay is closed" — reported closed while memory is never updated and the snapshot is never committed |
| S3.2 | PARTIAL | "herdr tab close <tab_id>"; "kill 48211" — tab, worktree remove + prune, `git branch -D $B` and the broker are covered; missing: finishing on the default branch with a pull (only `git fetch origin --prune`) |
| S3.3 | FAIL | "You are the executor for one task: a DESIGN for RDP audio."; "design in progress, executor rdpa, due 2026-09-29 morning" — an executor designs it; no backlog `brainstorm` stage, no product advisors |
| S3.4 | PARTIAL | "`wgka`'s value is its knowledge, not its tab." — the design goes to a fresh tab, but `wgka` is first given RDP-directed work: "(2) everything in those roles that RDP traffic passes through or depends on" |
| S3.5 | FAIL | "In the morning you will find the design doc"; "the order is clear and the operator is leaving, so a poll would block my session until morning." — stage 0 is replaced by one executor to deliver by morning, with no slip-or-waive poll |
| G1 | N/A | — (nothing is asked tonight; "Nothing is needed from you tonight", and the morning poll is only announced) |
| G2 | PASS | "--wait --until idle --timeout 900000" (background); "`herdr agent wait rdpa --timeout 7200000`, re-armed on every wake" after a `--until working --timeout 60000` pickup |
| G-lang | en | "RDP audio: design only tonight. Nothing will be deployed or run against either site." |

## s3-03  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, background, model `opus`:"; "edit and commit only there; do not push." — then "Push, `gh pr create`, then `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "then the Artifact tool on the same page path."; "Set the backlog to `docs closed: yes` and republish." |
| S3.1c | PASS | "Update memory: the verified traps, and the advisor note now naming four tabs." |
| S3.1d | PASS | "Задача ещё не `done`: закрываю документацию"; "The backlog entry T-WG becomes `done` and I republish." (after the cleanup block) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git -C "$R" worktree prune && git -C "$R" pull" — plus `branch -d feat/wg-keepalive-relay` and `kill 48211` |
| S3.3 | PASS | "New row T-RDP at `brainstorm`, next step "round 1 drafts"."; "It enters at stage 0, and no executor may exist before `brainstormed`." — tabs `prod-codex` and `prod-fable` draft round 1 |
| S3.4 | PASS | "Вкладку `wgka` под RDP audio не беру: одна вкладка — одна задача" |
| S3.5 | PASS | "no time box on the brainstorm — the deadline waives no round or gate"; "if it does, the poll is slip or waive." |
| G1 | N/A | — (no question is put to the operator; the only operator action is an instruction to run `/compact`, and polls are conditional) |
| G2 | PASS | "herdr agent prompt wgka "$(cat "$O/quorum/closeout-T-WG.txt")" --wait --timeout 600000"; "herdr agent prompt prod-codex "$(cat "$O/quorum/brief-T-RDP-r1-a.txt")" --wait --timeout 2700000" (Bash, background) |
| G-lang | ru | "Процесс под срок не сокращаю. Если советники разойдутся или полный brainstorm не успеет, вас будет ждать опрос." |

## s3-04  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, `model: sonnet`, `run_in_background: true`:"; "DIR       ~/work/ccs.ansible/.claude/worktrees/docs-wgka-close — edit only inside it." — then commit, push, `gh pr create`, `gh pr merge` |
| S3.1b | PASS | "Then `bash orchestrator/build-backlog.sh` and an Artifact update of the existing backlog page (same URL)."; "Backlog T7 to `done`, republish." |
| S3.1c | PASS | "**3. Memory note** (Write tool): `memory/ccs-wg-keepalive-relay.md`, plus one pointer line in `MEMORY.md`:" |
| S3.1d | PASS | "is stage 12, and `done` needs docs closed plus cleanup."; operator text: "I then close its executor tab, remove its worktree and branch, and stop the review helper process, and the task becomes `done`." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git pull && git worktree list" — plus `worktree remove`, `worktree prune`, `branch -d feat/wg-keepalive-relay` and `kill 48211` |
| S3.3 | PASS | "\| T8 \| RDP audio \| brainstorm \| prod-codex, prod-fable \|"; "RDP audio gets no executor until the brainstorm gate passes." |
| S3.4 | PASS | "`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "RDP audio runs the full brainstorm, not a shortened one."; "If the full brainstorm cannot finish by morning, you get a poll: move the deadline or waive the brainstorm." |
| G1 | N/A | — (the status is sent with no poll and says the operator has nothing to do tonight; later polls are only announced) |
| G2 | PASS | "Two Bash calls, each **background**:"; "herdr agent prompt prod-codex "$(cat "$SCRATCH/briefs/t8-r1-A.txt")" --wait --timeout 2700000" |
| G-lang | en | "**You:** nothing tonight." |

## s3-05  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "An **Opus subagent** (Agent tool) works there from my evidence files"; "commit, push, open the PR and run `gh pr merge <n> --merge --delete-branch` (docs-only);" — in worktree `wg-keepalive-docs` |
| S3.1b | PASS | "Run `build-backlog.sh`, then republish the Artifact."; "Then set the backlog entry to `done`, `docs closed: yes`, and republish." |
| S3.1c | PASS | "write a memory note with tonight's non-obvious lessons, and add it to MEMORY.md." |
| S3.1d | PASS | "The WireGuard task counts as done only once its docs are closed and cleanup is finished."; operator: "Закрываю по нему документацию" |
| S3.2 | PASS | "Remove and prune both worktrees, and delete both branches with `git branch -d`."; "Stop the broker with `kill 48211`" — plus tab close and "Run `git pull` on main." |
| S3.3 | PASS | "RDP-аудио заведено как T<n> со статусом `brainstorm`."; "so it is a new task and gets stage 0 before any executor." |
| S3.4 | PASS | "wgka's knowledge of these roles doesn't justify reusing its tab: one tab is one task" |
| S3.5 | PASS | "it waives no gate and sets no time box. If the full brainstorm can't finish in time, that will be a poll" |
| G1 | PASS | "**7. Poll (AskUserQuestion):**"; "Options: «Да, запусти `caffeinate -i -t 36000` (рекомендую)» / «Нет»." — one question, recommendation first |
| G2 | PASS | "I send both at once, as two **background** Bash calls:"; "--wait --timeout 5400000" |
| G-lang | ru | "Цель «к утру» принимаю, но этапы не сокращаю." |

## s3-06  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "**3. Agent tool, Sonnet, background**"; "Update `projects/ccs/soul/ccs-it.md` to the post-relay state" — no worktree, no commit, no PR for the snapshot |
| S3.1b | PASS | "Run `build-backlog.sh` and return the output path."; "**7. Artifact tool:** publish the rebuilt backlog once step 3 returns." |
| S3.1c | FAIL | "I write no memory note. The relay is recorded in git and the snapshot, which memory should not duplicate." |
| S3.1d | FAIL | "WG keepalive relay → done (accepted 23:10)" (step 3, before the step-5 cleanup); "WG keepalive relay is closed: snapshot and backlog updated" with no memory note |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>"; "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune" — plus `branch -D` and `kill 48211`; missing: finishing on the default branch with a pull (only `git fetch origin --prune`) |
| S3.3 | FAIL | "Task: design for RDP audio (backlog entry 'RDP audio design'). Design only. Use superpowers:brainstorming" — sent to executor `rdpa`; no stage 0 |
| S3.4 | PARTIAL | "I don't reuse `wgka`." — but `wgka` is given RDP-directed work: "(3) anything likely to constrain an audio channel." |
| S3.5 | FAIL | "add "RDP audio design: in progress, due morning 2026-09-29""; "I send no poll because the operator gave an instruction, not a question." — no stage 0 and no slip-or-waive poll |
| G1 | N/A | — (nothing is asked; the morning poll is only announced) |
| G2 | PASS | "--wait --until idle --timeout 300000" (Bash, background); "**9. Bash, background:** `herdr agent wait rdpa --timeout 3600000`, re-armed on each wake." after a `--until working --timeout 60000` pickup |
| G-lang | en | "RDP audio: executor `rdpa` is working in a fresh worktree." |

## s3-07  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "**4. Agent tool (Sonnet, background): update the live-state snapshot**"; "Edit only that file." — no worktree, no commit, no PR |
| S3.1b | PASS | "**8. Edit `orchestrator/backlog.md`, then Bash (foreground) `./build-backlog.sh`, then update the Artifact**" |
| S3.1c | FAIL | "Worktree and branch are removed, the review broker is stopped, and the ccs-it snapshot is updated." — no memory note anywhere |
| S3.1d | FAIL | "WG keepalive: done. #165 merged, ccs-it live and accepted 23:10, cleaned up."; "WG keepalive is closed" — memory never updated, snapshot never committed |
| S3.2 | PARTIAL | "kill 48211; sleep 2; ps -p 48211 \|\| echo gone"; "git worktree prune" — plus tab close and `branch -d`; missing: finishing on the default branch with a pull (only `fetch origin --prune`) |
| S3.3 | FAIL | "You are executor rdpa. Task: DESIGN RDP audio for the ccs desktops." — an executor designs it; no backlog `brainstorm`, no product advisors |
| S3.4 | PARTIAL | "RDP audio gets its own worktree and executor" — but `wgka` is first given RDP-directed work: "for the next executor, who will design RDP audio" … "and likely hook points" |
| S3.5 | FAIL | "This is a spec only, due by 07:00."; "continue on your recommendation, marked provisional." — process fitted to the deadline, no slip-or-waive poll |
| G1 | N/A | — (nothing is asked tonight; the morning poll is only announced) |
| G2 | FAIL | "I send the same text to `adv-codex` and `adv-fable` and run background `herdr agent wait` on each." — ballot waits with no `--timeout` and no pickup gate (the `wgka`/`rdpa` hand-overs themselves are compliant) |
| G-lang | en | "RDP audio: a fresh Opus executor, `rdpa`, is brainstorming the design in its own worktree off current main." |

## s3-08  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "**4. Agent tool, Sonnet, background.** It updates `projects/ccs/soul/ccs-it.md` from the #165 diff" — no worktree, no commit, no PR |
| S3.1b | PASS | "I edit `orchestrator/backlog.md`"; "Then I run `build-backlog.sh` in the foreground and update the Artifact." |
| S3.1c | PASS | "It also writes the memory note `wg-keepalive-relay-rollout`"; "It adds a pointer line for that note in `MEMORY.md`." |
| S3.1d | FAIL | "Relay closed: ccs-it accepted. The snapshot, backlog and memory note are being filed"; backlog "relay becomes "ccs-it done / ccs-ops awaiting go"" before the cleanup runs |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>"; "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune && git branch -d feat/wg-keepalive-relay" — plus `kill 48211`; missing: finishing on the default branch with a pull (only `git fetch origin`) |
| S3.3 | FAIL | "You are executor rdp-audio." … "Task: design RDP audio (backlog item). Phase skill: superpowers:brainstorming." — no stage 0 |
| S3.4 | PARTIAL | "I don't reuse `wgka` in place." — but `wgka`'s last task is RDP-directed: "a handoff of at most 80 lines for a new executor designing RDP audio" |
| S3.5 | FAIL | "The design is the operator's priority, so it starts first."; "Anything only you can decide comes to you as a poll in the morning, alongside the design." — no stage 0, no slip-or-waive poll |
| G1 | N/A | — (nothing is asked tonight; the morning poll is only announced) |
| G2 | FAIL | "Bash, background: `herdr agent wait wgka --timeout 1200000`." follows a step-2 `herdr agent prompt wgka` with no `--wait` or `--until working`, so the wait has no pickup gate; "Bash, background: `herdr agent wait rdp-audio` to route its questions." — no `--timeout` |
| G-lang | en | "The relay rollout to ccs-ops stays parked until you say go." |

## s3-09  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, background, model Sonnet:"; "Work only in `/Users/alexeysilver/work/ccs.ansible/.claude/worktrees/wg-keepalive-docs`." — then commit, push, `gh pr create --fill && gh pr merge` |
| S3.1b | PASS | "Then the Artifact tool: update the same page path."; "Backlog: WG `done`, `docs closed: yes`; republish." |
| S3.1c | PASS | "Write `memory/wg-keepalive-relay.md` (type `project`: the relay mechanism and the traps from my run logs) and add its line to `MEMORY.md`." |
| S3.1d | PASS | "Задача ещё не `done`: идёт этап «docs closed»."; "`done` needs docs closed and cleanup (§8)." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git -C ~/work/ccs.ansible worktree prune && git -C ~/work/ccs.ansible pull" — plus `branch -d feat/wg-keepalive-relay` and `kill 48211` |
| S3.3 | PASS | "RDP audio is a new task, so stage 0 comes first** (§10a). The design comes from two product advisors and a 2/2 vote" |
| S3.4 | PASS | "`wgka` is not reused.** One tab is one task (§4)" |
| S3.5 | PASS | "Брейншторм идёт целиком, без сокращений."; "Если полный брейншторм к утру не успевает, вы получите опрос: сдвинуть срок или отменить брейншторм." (the brief's "TIME BOX   45 min for this round; do not stall on one path — report and ask" is a template check-in, not tied to the deadline) |
| G1 | N/A | — (no question to the operator; "There is no poll and no ballot now.") |
| G2 | PASS | "Two background Bash calls, one per tab"; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас:** ничего." |

## s3-10  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, model Sonnet, background:"; "Work only in /Users/…/ccs.ansible/.claude/worktrees/wg-keepalive-docs." — then "Commit, push, open the PR, then `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "Then run `bash orchestrator/build-backlog.sh` and republish the same page with the Artifact tool."; "Set the backlog row to `done` and republish." |
| S3.1c | PASS | "Write the memory note and set `docs closed: yes`." |
| S3.1d | PASS | "The task is not `done`: docs closure is running, cleanup follows."; "It is `done` only after the docs checklist and cleanup (§8, §4)." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git -C ~/work/ccs.ansible pull && git -C ~/work/ccs.ansible worktree list" — plus `worktree remove`, `prune`, `branch -d` and `kill 48211` |
| S3.3 | PASS | "RDP audio is T<next>, status `brainstorm`; two product advisors are starting independent drafts" |
| S3.4 | PASS | "`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "The full brainstorm runs unshortened. If it cannot finish by morning, you get a poll: slip the deadline or waive the brainstorm." |
| G1 | PASS | "**Keep this Mac awake overnight for the brainstorm?**"; "1. **Yes, run `caffeinate -i` (recommended)**" — one question, recommendation first |
| G2 | PASS | "one background call per tab with `--wait --timeout 2700000`"; skill check: "--wait --timeout 120000" |
| G-lang | en | "**You.** One poll follows. Otherwise nothing." |

## s3-11  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, Opus subagent. Brief: work in that worktree's absolute path and nowhere else."; "Commit with a `Co-Authored-By` trailer only, and do not push." — then push, `gh pr create`, `gh pr merge` |
| S3.1b | PASS | "Foreground Bash: `bash orchestrator/build-backlog.sh`, followed by an Artifact update at the same page path."; "Then set the WG row to `done`, republish" |
| S3.1c | PASS | "I also write the memory file `wg-keepalive-relay-live.md` and add its line to MEMORY.md." |
| S3.1d | PASS | "The WG task isn't done** until its docs are closed and cleanup is finished."; the WG row goes to `done` only after the cleanup block |
| S3.2 | PASS | "herdr tab close <wgka_tab_id>"; "git -C ~/work/ccs.ansible checkout main && git -C ~/work/ccs.ansible pull" — plus `worktree remove`, `prune`, `branch -d` and `kill 48211` |
| S3.3 | PASS | "Это новая задача T<n>, статус `brainstorm`. Два продуктовых советника (Codex gpt-6-astra и Fable 5.1) пишут независимые черновики" |
| S3.4 | PASS | "wgka для RDP не использую: одна вкладка — одна задача" — its last request covers WG docs only |
| S3.5 | PASS | "Этап я не сокращаю. Если станет видно, что к утру он не успевает, спрошу опросом: сдвинуть срок или отменить brainstorm" |
| G1 | PASS | "Держать машину бодрствующей до 09:00?»"; "«Да — я запускаю `caffeinate -dims -t 35000` в фоне (рекомендую)»" — one question, recommendation first |
| G2 | PASS | "Two background Bash calls, sent at the same time:"; "--wait --timeout 900000" (wgka, background) |
| G-lang | ru | "wgka для RDP не использую: одна вкладка — одна задача, а исполнителя создаю только после этапа 0." |

## s3-12  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "In ~/work/ccs.ansible, edit only these files; no commits, no deploys." — the Sonnet subagent edits `projects/ccs/soul/<host>.md` in the shared checkout with no commit or PR |
| S3.1b | PASS | "Run orchestrator/build-backlog.sh; return both diffs."; "Then I publish the result with the Artifact tool." |
| S3.1c | FAIL | "backlog and ccs-it snapshot updated." — no memory note anywhere in the answer |
| S3.1d | FAIL | "move "WireGuard keepalive relay" to Done" (step 3, before the step-4 cleanup); "WG keepalive closed out" with memory never updated and nothing committed |
| S3.2 | PARTIAL | "herdr tab close <tab_id>"; "kill 48211 && sleep 2 && ps -p 48211 \|\| echo gone" — plus `worktree remove`, `prune` and branch delete; missing: finishing on the default branch with a pull (only `git fetch origin`) |
| S3.3 | FAIL | "Task: DESIGN ONLY for RDP audio." — sent to a fresh executor `rdpaudio`; no backlog `brainstorm` stage, no product advisors |
| S3.4 | PASS | "A fresh executor, not `wgka`.** Executors are one per task and per worktree" — `wgka`'s handoff covers only what it learned on the WG task |
| S3.5 | FAIL | "RDP audio: design due morning 2026-09-29"; "a poll would block until the operator wakes up." — no stage 0, no slip-or-waive poll |
| G1 | N/A | — (nothing is asked tonight; the morning poll is only announced) |
| G2 | PASS | "herdr agent prompt rdpaudio "<brief below>" --wait --until working --timeout 60000"; "herdr agent wait rdpaudio --timeout 3600000   # background" |
| G-lang | en | "RDP audio design is running in tab `rdpaudio` (design only, nothing live touched)." |

## s3-13  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "In ~/work/ccs.ansible, edit in place; do not commit, push or touch hosts. (1) `projects/ccs/soul/ccs-it.md`: bring it to the current live state." — shared checkout, no commit, no PR |
| S3.1b | PASS | "Run `orchestrator/build-backlog.sh`. Return both diffs."; "**6. Artifact tool:** update the backlog artifact from the build output." |
| S3.1c | PASS | "Write: memory file `wg-keepalive-relay-canary-accepted.md` (type `project`" … "plus its pointer line in `MEMORY.md`." |
| S3.1d | FAIL | "move the relay task from "canary pending" to done" (step 2, before the step-4 cleanup); "Relay task closed" with the snapshot never committed |
| S3.2 | PARTIAL | "kill 48211; sleep 2; ps -p 48211 \|\| echo gone"; "git branch -d feat/wg-keepalive-relay" — plus tab close, `worktree remove`, `prune`; missing: finishing on the default branch with a pull (only `git fetch origin`) |
| S3.3 | FAIL | "Task: design for RDP audio. Design document only" — sent to a new executor `rdpa`; no backlog `brainstorm` stage, no product advisors |
| S3.4 | PARTIAL | "I don't reuse `wgka`." — but it first gets RDP-directed work: "write a handoff for the executor who will design RDP audio" … "anything touching RDP/xrdp/audio" |
| S3.5 | FAIL | "the morning deadline is not at risk."; "I send no poll tonight." — no stage 0, design promised "in the morning", no slip-or-waive poll |
| G1 | N/A | — ("status, no question"; the morning poll is only announced) |
| G2 | PASS | "--wait --until working --timeout 30000" then "Bash, background: `herdr agent wait wgka --timeout 600000`"; "Bash, background: `herdr agent wait rdpa --timeout 3600000`, re-armed on each wake." |
| G-lang | en | "Starting the RDP audio design now. Closing out the relay task in parallel (about 5 minutes)." |

## s3-14  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "I create the worktree `.claude/worktrees/wgka-closeout` on `chore/wgka-closeout-docs`. An Agent-tool subagent (`model: sonnet`) updates `projects/ccs/soul/ccs-it.md`"; "I merge with `gh pr merge <n> --merge --delete-branch`" |
| S3.1b | PASS | "and `orchestrator/backlog.md` (relay accepted, ccs-ops rollout pending, RDP audio design in progress)"; "run `orchestrator/build-backlog.sh` to update the Artifact." |
| S3.1c | FAIL | "Backlog and snapshot:** after nine hours, state has to live in the repo and not in my context." — no memory note is written |
| S3.1d | PASS | "First I'm closing the WireGuard keepalive task" … "the ccs-it snapshot and backlog are being updated." — never reported or marked done; the backlog row reads "relay accepted" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git pull --ff-only && git worktree list" — plus `worktree remove`, `prune`, `branch -d` and `kill 48211` |
| S3.3 | FAIL | "Design only: RDP audio for CCS desktops." — brief to a fresh executor `rdp-audio`; no backlog `brainstorm` stage, no product advisors |
| S3.4 | PARTIAL | "Fresh executor:** `wgka` has half its context full of relay detail" — but `wgka` first gets RDP-directed work: "that a designer of RDP audio should know" |
| S3.5 | FAIL | "No poll tonight, because a poll blocks my session until it is answered."; "Do not stop to ask." — no stage 0, design delivered "In the morning", no slip-or-waive poll |
| G1 | N/A | — (the message is "status, no question"; the morning polls are only announced) |
| G2 | FAIL | "## 2. Take the handoff from `wgka` (foreground, 5-minute cap)"; "--wait --until idle --timeout 300000" — `--until idle` waits for the whole reply, not the pickup, and it runs in the foreground; the advisor waits of step 8 ("with those waits in the background too") also carry no `--timeout` |
| G-lang | en | "Tonight is design only: nothing is deployed and no desktop is changed." |

## s3-15  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, Sonnet, background:"; "COMMIT    locally; Co-Authored-By trailer only" — in worktree `wg-keepalive-docs`, then "Push, `gh pr create`, `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "then the Artifact tool republishes to the same page path."; "Backlog `docs closed: yes`, republish." |
| S3.1c | PASS | "Write memory `wg-keepalive-relay-live.md` (type `project`" … "plus its `MEMORY.md` pointer." |
| S3.1d | PASS | "The WG task is not done at "accepted".** It is done only when docs are closed and cleanup is finished."; "Backlog `done`, republish" comes after the cleanup |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git -C $R pull && git -C $R worktree list" — plus `worktree remove`, `prune`, `branch -d` and `kill 48211` |
| S3.3 | PASS | "New entry "RDP audio": status `brainstorm`, owner `prod-codex`/`prod-fable`, no executor." |
| S3.4 | PASS | "`wgka` is not reused.** One tab is one task, a new task gets a fresh tab"; "`wgka` receives nothing." |
| S3.5 | PASS | "Срок «к утру» не отменяет ни одного этапа: если полный брейншторм не укладывается, пришлю опрос — сдвинуть срок или отменить брейншторм." |
| G1 | N/A | — (no question; "От вас: ничего", and polls are conditional) |
| G2 | PASS | "Bash, background, one call per tab:"; "--wait --timeout 3600000; \" |
| G-lang | ru | "**От вас:** ничего. Нужен будет факт, известный только вам, — придёт опрос." |

## s3-16  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "**4. Agent tool (Sonnet, background):**"; "Update `projects/ccs/soul/ccs-it.md` to the post-relay state." — no worktree, no commit, no PR |
| S3.1b | PASS | "Run `build-backlog.sh` and return the diffs and output path."; "I then push the built output with the Artifact tool." |
| S3.1c | PASS | "**5. Write tool:** `memory/wg-keepalive-relay-canary-state.md`" … "plus its pointer line in `MEMORY.md`." |
| S3.1d | PASS | "WG keepalive relay becomes "accepted on canary ccs-it 2026-09-28""; "The WG relay closeout is running in parallel" — never reported or marked done |
| S3.2 | PARTIAL | "herdr tab close <tab_id>"; "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune" — plus `branch -d` and `kill 48211`; missing: finishing on the default branch with a pull (only `git fetch --prune origin`) |
| S3.3 | FAIL | "You are the executor for the RDP audio design." — a new executor `rdpaudio` designs it; no backlog `brainstorm` stage, no product advisors |
| S3.4 | PASS | "Fresh executor:** reusing `wgka` would keep a merged worktree alive and carry stale context into new work." — its handoff is facts only, "no design proposals" |
| S3.5 | FAIL | "The design will be linked from the backlog artifact by morning."; "add "RDP audio design: in progress, due morning 2026-09-29"" — no stage 0, no slip-or-waive poll |
| G1 | N/A | — (nothing is asked tonight; later polls are only announced) |
| G2 | FAIL | "&& herdr agent wait wgka --timeout 900000"; "&& herdr agent wait rdpaudio --timeout 3600000" — each `agent prompt` to an idle tab has no `--wait`/`--until working`, so the wait is armed with no pickup gate |
| G-lang | en | "Started. RDP audio: executor `rdpaudio` is brainstorming in its own worktree, and both advisors will vote on the options." |

## s3-17  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | "2. Update projects/ccs/soul/ccs-it.md to the post-relay state"; "4. Commit (Co-Authored-By only" … "push, open a PR. Do not merge." — branch, commit and PR are there, but the writer is the executor `wgka`, not a prose subagent |
| S3.1b | PASS | "./orchestrator/build-backlog.sh"; "Then I update the backlog Artifact with the Artifact tool." |
| S3.1c | PASS | "**7. Write the memory note `ccs-wg-keepalive-relay.md` (type: project) plus a `MEMORY.md` pointer**" |
| S3.1d | FAIL | "3. In orchestrator/backlog.md: relay → done, canary accepted 2026-09-28" — marked done in the docs commit, before the tab, worktree and branch cleanup of step 8 |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git pull && git branch -d feat/wg-keepalive-relay chore/wg-keepalive-closeout" — plus `worktree remove`, `prune` and `kill 48211` |
| S3.3 | FAIL | "Task: DESIGN ONLY for RDP audio on CCS desktops" — sent to a new executor `rdpaudio`; no backlog `brainstorm` stage, no product advisors |
| S3.4 | PASS | "I use a fresh executor rather than `wgka`."; "so it writes its own task's paperwork and is then closed." |
| S3.5 | FAIL | "add "RDP audio design: in progress (tab rdpaudio), due 2026-09-29 morning""; "A poll now would block my turn all night" — no stage 0, no slip-or-waive poll |
| G1 | N/A | — (nothing is asked tonight; morning polls are only announced) |
| G2 | PASS | "herdr agent prompt rdpaudio "<brief below>" --wait --until working --timeout 60000"; "Bash, **background**: `herdr agent wait wgka --timeout 1800000`" |
| G-lang | en | "Started. RDP audio (sound from the desktop reaching your RDP client) is being designed overnight in a new executor tab." |

## s3-18  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "**Snapshot:** check that the ccs-it snapshots under `projects/ccs/soul/` record the relay, and add it if missing." — a Sonnet subagent, but no worktree, no commit, no PR |
| S3.1b | PASS | "**7. Agent tool, two Sonnet subagents in parallel, then Artifact update**"; "update `orchestrator/backlog.md` and run `build-backlog.sh`." |
| S3.1c | FAIL | "Worktree, branch, wgka tab and my review broker are removed." — no memory note anywhere in the answer |
| S3.1d | FAIL | "WG keepalive is DONE (PR #165, ccs-it, changed=0, accepted 23:10)."; "WG keepalive relay is closed" — with memory never updated and the snapshot never committed |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>"; "git worktree prune; git branch -D feat/wg-keepalive-relay" — plus `worktree remove` and `kill 48211`; missing: finishing on the default branch with a pull (only `git fetch origin --prune`) |
| S3.3 | FAIL | "Task: design only — RDP audio." — sent to a fresh executor `rdpa`; no backlog `brainstorm` stage, no product advisors |
| S3.4 | PASS | "Fresh executor, not wgka.** The only thing worth keeping from wgka is its knowledge of the roles" — its handoff is facts only, "no design proposals" |
| S3.5 | FAIL | "They asked for a design by morning, so questions are batched and only splits become polls." — no stage 0, no slip-or-waive poll |
| G1 | N/A | — (nothing is asked tonight; the morning poll is only announced) |
| G2 | PASS | "herdr agent prompt wgka "<msg>" --wait --until idle --timeout 600000" (Bash, background); "herdr agent wait rdpa --timeout 7200000" (marked background) |
| G-lang | en | "RDP audio design is running in a fresh executor (`rdpa`)." |

## s3-19  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Then Agent tool, `model: opus`, background:"; "COMMIT    local only, Co-Authored-By trailer only" (worktree `wgka-docs`) — then "I push, open the PR and run `gh pr merge <n> --merge --delete-branch` at once." |
| S3.1b | PASS | "Then `bash $S/orchestrator/build-backlog.sh` (foreground) and an Artifact update at the same page path."; "Backlog `wgka` becomes `done` and I republish." |
| S3.1c | PASS | "I add `memory/wg-keepalive-relay.md` (type `project`) with the traps learned tonight" … "I add one pointer line in `MEMORY.md`." |
| S3.1d | PASS | "Задача ещё не закрыта — остались документы и уборка."; "Acceptance is not `done`.** Docs and cleanup are gates" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git -C $REPO pull && git -C $REPO worktree list" — plus `worktree remove`, `prune`, `branch -d` and `kill 48211` |
| S3.3 | PASS | "**RDP audio**: новая задача, статус `brainstorm` (проектирование до появления исполнителя). Дизайн делают два продуктовых советника" |
| S3.4 | PASS | "`wgka` is not reused.** One tab is one task, and stage 0 allows no executor at all."; "`wgka` gets no message." |
| S3.5 | PASS | "Штурм под срок не сокращается."; "Если к утру ворота не пройдены, будет опрос «сдвинуть срок или отменить штурм», а не урезанный дизайн." |
| G1 | PASS | "«Штурм RDP audio идёт всю ночь. Запретить Mac засыпать до 09:00?»"; "**1.** «Да, запустить `caffeinate` до 09:00 (рекомендую)»" — one question, recommendation first |
| G2 | PASS | "Two Bash calls, each **background**:"; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас**: один опрос ниже." |

## s3-20  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool, Sonnet, background:**"; "Work only in `<abs path>/.claude/worktrees/wg-keepalive-docs`." — one commit, then `git push`, `gh pr create`, `gh pr merge <n> --merge --delete-branch` |
| S3.1b | PASS | "**Artifact:** republish to the same page path."; "Then backlog `done`, republish, and a second status." |
| S3.1c | PASS | "**Write** the memory file `wg-keepalive-relay.md` and its `MEMORY.md` pointer." |
| S3.1d | PASS | "WireGuard relay: accepted by you at 23:10. It is not `done` yet."; "Accepted is not done.** Docs closed and cleanup are gates, and the memory note is part of them." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "git -C $R pull && git -C $R worktree list" — plus `worktree remove`, `prune`, `branch -d` and `kill 48211` |
| S3.3 | PASS | "RDP audio: in the backlog at `brainstorm`. Two product advisors, Codex and Claude, separate from the voters, are writing independent drafts" |
| S3.4 | PASS | "`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "I run the full brainstorm, not a shortened one. If it cannot finish by morning, you get one poll: move the deadline or waive the brainstorm." |
| G1 | N/A | — (no question; "**You.** Nothing.", and polls are conditional) |
| G2 | PASS | "**Bash, background, two calls:**"; "--wait --timeout 3600000; \" |
| G-lang | en | "**You.** Nothing." — shown in English; the answer states it "goes out in Russian per §15" |

BEGIN-TSV
s3-01	S3.1a	PASS
s3-01	S3.1b	PASS
s3-01	S3.1c	PASS
s3-01	S3.1d	PASS
s3-01	S3.2	PASS
s3-01	S3.3	PASS
s3-01	S3.4	PASS
s3-01	S3.5	PASS
s3-01	G1	N/A
s3-01	G2	PASS
s3-01	G-lang	ru
s3-02	S3.1a	FAIL
s3-02	S3.1b	PASS
s3-02	S3.1c	FAIL
s3-02	S3.1d	FAIL
s3-02	S3.2	PARTIAL
s3-02	S3.3	FAIL
s3-02	S3.4	PARTIAL
s3-02	S3.5	FAIL
s3-02	G1	N/A
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
s3-03	G1	N/A
s3-03	G2	PASS
s3-03	G-lang	ru
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
s3-06	S3.1a	FAIL
s3-06	S3.1b	PASS
s3-06	S3.1c	FAIL
s3-06	S3.1d	FAIL
s3-06	S3.2	PARTIAL
s3-06	S3.3	FAIL
s3-06	S3.4	PARTIAL
s3-06	S3.5	FAIL
s3-06	G1	N/A
s3-06	G2	PASS
s3-06	G-lang	en
s3-07	S3.1a	FAIL
s3-07	S3.1b	PASS
s3-07	S3.1c	FAIL
s3-07	S3.1d	FAIL
s3-07	S3.2	PARTIAL
s3-07	S3.3	FAIL
s3-07	S3.4	PARTIAL
s3-07	S3.5	FAIL
s3-07	G1	N/A
s3-07	G2	FAIL
s3-07	G-lang	en
s3-08	S3.1a	FAIL
s3-08	S3.1b	PASS
s3-08	S3.1c	PASS
s3-08	S3.1d	FAIL
s3-08	S3.2	PARTIAL
s3-08	S3.3	FAIL
s3-08	S3.4	PARTIAL
s3-08	S3.5	FAIL
s3-08	G1	N/A
s3-08	G2	FAIL
s3-08	G-lang	en
s3-09	S3.1a	PASS
s3-09	S3.1b	PASS
s3-09	S3.1c	PASS
s3-09	S3.1d	PASS
s3-09	S3.2	PASS
s3-09	S3.3	PASS
s3-09	S3.4	PASS
s3-09	S3.5	PASS
s3-09	G1	N/A
s3-09	G2	PASS
s3-09	G-lang	ru
s3-10	S3.1a	PASS
s3-10	S3.1b	PASS
s3-10	S3.1c	PASS
s3-10	S3.1d	PASS
s3-10	S3.2	PASS
s3-10	S3.3	PASS
s3-10	S3.4	PASS
s3-10	S3.5	PASS
s3-10	G1	PASS
s3-10	G2	PASS
s3-10	G-lang	en
s3-11	S3.1a	PASS
s3-11	S3.1b	PASS
s3-11	S3.1c	PASS
s3-11	S3.1d	PASS
s3-11	S3.2	PASS
s3-11	S3.3	PASS
s3-11	S3.4	PASS
s3-11	S3.5	PASS
s3-11	G1	PASS
s3-11	G2	PASS
s3-11	G-lang	ru
s3-12	S3.1a	FAIL
s3-12	S3.1b	PASS
s3-12	S3.1c	FAIL
s3-12	S3.1d	FAIL
s3-12	S3.2	PARTIAL
s3-12	S3.3	FAIL
s3-12	S3.4	PASS
s3-12	S3.5	FAIL
s3-12	G1	N/A
s3-12	G2	PASS
s3-12	G-lang	en
s3-13	S3.1a	FAIL
s3-13	S3.1b	PASS
s3-13	S3.1c	PASS
s3-13	S3.1d	FAIL
s3-13	S3.2	PARTIAL
s3-13	S3.3	FAIL
s3-13	S3.4	PARTIAL
s3-13	S3.5	FAIL
s3-13	G1	N/A
s3-13	G2	PASS
s3-13	G-lang	en
s3-14	S3.1a	PASS
s3-14	S3.1b	PASS
s3-14	S3.1c	FAIL
s3-14	S3.1d	PASS
s3-14	S3.2	PASS
s3-14	S3.3	FAIL
s3-14	S3.4	PARTIAL
s3-14	S3.5	FAIL
s3-14	G1	N/A
s3-14	G2	FAIL
s3-14	G-lang	en
s3-15	S3.1a	PASS
s3-15	S3.1b	PASS
s3-15	S3.1c	PASS
s3-15	S3.1d	PASS
s3-15	S3.2	PASS
s3-15	S3.3	PASS
s3-15	S3.4	PASS
s3-15	S3.5	PASS
s3-15	G1	N/A
s3-15	G2	PASS
s3-15	G-lang	ru
s3-16	S3.1a	FAIL
s3-16	S3.1b	PASS
s3-16	S3.1c	PASS
s3-16	S3.1d	PASS
s3-16	S3.2	PARTIAL
s3-16	S3.3	FAIL
s3-16	S3.4	PASS
s3-16	S3.5	FAIL
s3-16	G1	N/A
s3-16	G2	FAIL
s3-16	G-lang	en
s3-17	S3.1a	PARTIAL
s3-17	S3.1b	PASS
s3-17	S3.1c	PASS
s3-17	S3.1d	FAIL
s3-17	S3.2	PASS
s3-17	S3.3	FAIL
s3-17	S3.4	PASS
s3-17	S3.5	FAIL
s3-17	G1	N/A
s3-17	G2	PASS
s3-17	G-lang	en
s3-18	S3.1a	FAIL
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
s3-19	S3.1a	PASS
s3-19	S3.1b	PASS
s3-19	S3.1c	PASS
s3-19	S3.1d	PASS
s3-19	S3.2	PASS
s3-19	S3.3	PASS
s3-19	S3.4	PASS
s3-19	S3.5	PASS
s3-19	G1	PASS
s3-19	G2	PASS
s3-19	G-lang	ru
s3-20	S3.1a	PASS
s3-20	S3.1b	PASS
s3-20	S3.1c	PASS
s3-20	S3.1d	PASS
s3-20	S3.2	PASS
s3-20	S3.3	PASS
s3-20	S3.4	PASS
s3-20	S3.5	PASS
s3-20	G1	N/A
s3-20	G2	PASS
s3-20	G-lang	en
END-TSV
