# Scores — family S3 (a task just accepted; the next task wanted by morning)

Rubric: `green-rubric.md` — "Verdicts", "General — every scenario", "S3". Items: s3-01 … s3-20.
Evidence quotes are verbatim substrings of the item; text in [brackets] is the scorer's note.

Consistency rulings applied across all items:
- S3.1a: a snapshot edit with no worktree and no commit/PR stated (or "no commit"/"no git" stated) is the rubric's FAIL case; PARTIAL is kept for a snapshot that goes through a worktree and a PR but not by a prose subagent, or without the orchestrator's evidence.
- S3.1d: FAIL when the relay is reported or marked done/closed while a docs item was never done (memory skipped, snapshot uncommitted) or before cleanup; PARTIAL when every docs item is done and the done mark is only committed slightly ahead of cleanup; PASS when it is never marked done early.
- S3.2: `git fetch` is not "finish on the default branch with a pull".
- S3.5: a round-1 brief line "TIME BOX … report and ask" is read as a report cadence, not a cap on the brainstorm.

## s3-01  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "Update `projects/ccs/soul/ccs-it.md` to the post-relay state" [Sonnet subagent, but no worktree, commit or PR stated] |
| S3.1b | PASS | "In `orchestrator/backlog.md`: WG keepalive relay → done (accepted 23:10)"; "publish the rebuilt backlog once step 3 returns" |
| S3.1c | FAIL | "I write no memory note." |
| S3.1d | FAIL | "WG keepalive relay → done (accepted 23:10)" [set by the step-3 subagent, before step-5 cleanup]; "WG keepalive relay is closed: snapshot and backlog updated" [memory never written] |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>"; "git branch -D feat/wg-keepalive-relay" [tab, worktree+prune, branch, kill 48211 present; missing: finish on default branch with a pull — only git fetch] |
| S3.3 | FAIL | "RDP audio: executor `rdpa` is working in a fresh worktree."; "Use superpowers:brainstorming, then write the design doc under docs/" |
| S3.4 | PASS | "I don't reuse `wgka`. Executors are one per task" |
| S3.5 | FAIL | "RDP audio design: in progress, due morning 2026-09-29"; "the executor shouldn't block on them" [no stage 0, no slip-or-waive poll] |
| G1 | N/A | |
| G2 | PASS | "--wait --until working --timeout 60000"; "herdr agent wait rdpa --timeout 3600000" |
| G-lang | en | "WG keepalive relay is closed" |

## s3-02  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "I create the docs worktree and write `$ORCH/evidence/<T_WG>.md` from my own command output"; "I check every claim against the evidence, run the project's docs-only check, then push, open the PR" |
| S3.1b | PASS | "then the Artifact tool updates the same page path"; "Then the backlog row goes to `done`, republished." |
| S3.1c | PASS | "I write the memory note and set `docs closed: yes`." |
| S3.1d | PASS | "It is not done yet."; "Then the backlog row goes to `done`, republished." |
| S3.2 | PASS | "Cleanup (Bash, foreground), after the docs PR is merged:"; "branch -d feat/wg-keepalive-relay chore/wg-keepalive-docs" [also tab close, worktree remove+prune, git pull, kill 48211] |
| S3.3 | PASS | "RDP audio: in the backlog as `<T_RDP>`, status `brainstorm`. Two product advisors"; "No executor and no code for RDP audio before the design is approved." |
| S3.4 | PASS | "is not reused.** One tab is one task, and its context carries WireGuard assumptions." |
| S3.5 | PASS | "If the full brainstorm is not finished by then, I will say so; I will not shorten it." |
| G1 | PASS | "How should it stay awake?"; "I run `caffeinate -i -s` (recommended)" |
| G2 | PASS | "--wait --timeout 2700000"; "same waiter pattern and `--timeout 900000`" |
| G-lang | en | "Operator-facing text is in English because this session's language setting requires it" |

## s3-03  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "DIR: <R>/.claude/worktrees/wgka-docs (branch docs/wg-keepalive-canary). Edit and commit there only."; "SOURCE: <S>/wgka/evidence-canary.md." |
| S3.1b | PASS | "update the existing backlog page"; "set the relay row to `done`, and republish" |
| S3.1c | PASS | "`<memory>/ccs-wg-keepalive-relay.md` (type `project`)"; "to add the pointer line" |
| S3.1d | PASS | "The task is not closed yet: the snapshot and doc status are being written, still running."; "set the relay row to `done`, and republish" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>"; "branch -d feat/wg-keepalive-relay" [also worktree remove+prune, kill 48211, git pull] |
| S3.3 | PASS | "RDP audio is in the backlog as a new task. Two product advisors (Codex and Claude, separate from the voters) are drafting independently"; "No executor and no code before that." |
| S3.4 | PASS | "One tab is one task, and no executor may exist before stage 0 passes." |
| S3.5 | PASS | "I start the full brainstorm now and do not shorten it."; "with a poll to move the deadline or waive the brainstorm" |
| G1 | PASS | "Keep this Mac awake overnight so sleep does not cut agent turns off?"; "Yes, I run `caffeinate -is` until the morning report (recommended)." |
| G2 | PASS | "--wait --timeout 2700000" |
| G-lang | en | "The task is not closed yet" |

## s3-04  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "the only source for claims about live state"; "git push -u origin chore/wg-keepalive-docs" |
| S3.1b | PASS | "republishes the same page path"; "Backlog: T7 `done`, then republish and send a status." |
| S3.1c | PASS | "the memory file `wg-keepalive-relay-live.md` (type `project`) and its `MEMORY.md` pointer" |
| S3.1d | PASS | "The task is not closed: a writing subagent is updating the ccs-it live-state snapshot"; "Backlog: T7 `done`, then republish and send a status." |
| S3.2 | PASS | "ps -p 48211 -o pid,command && kill 48211"; "git -C ~/work/ccs.ansible pull && git -C ~/work/ccs.ansible worktree list" |
| S3.3 | PASS | "in the backlog as `brainstorm`. Two product advisors"; "no executor may exist before the joint design is approved 2/2" |
| S3.4 | PASS | "One tab is one task, and its knowledge of the roles does not change that." |
| S3.5 | PASS | "If the full brainstorm cannot finish by morning, I send a poll: move the deadline or waive the brainstorm." |
| G1 | N/A | |
| G2 | PASS | "Bash, background, two calls in one message:"; "--wait --timeout 2700000" |
| G-lang | en | "You:** nothing now." |

## s3-05  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "You are a prose subagent. Reply in English. Work only in"; "Then I push, open the PR and run `gh pr merge ‹n› --merge --delete-branch`." |
| S3.1b | PASS | "then Artifact update on the same page path"; "then backlog `done`, republish, status" |
| S3.1c | PASS | "I write memory `wg-keepalive-relay-closeout.md` with the re-verified traps and its `MEMORY.md` pointer" |
| S3.1d | PASS | "Идёт закрытие документации и уборка"; "then backlog `done`, republish, status" |
| S3.2 | PASS | "git -C ~/work/ccs.ansible worktree prune && git -C ~/work/ccs.ansible pull"; "ps -p 48211 -o pid,command && kill 48211" |
| S3.3 | PASS | "в бэклоге со статусом `brainstorm`: дизайн прорабатывают два продуктовых советника до появления исполнителя" |
| S3.4 | PASS | "`wgka` is not reused: one tab, one task." |
| S3.5 | PASS | "Брейншторм идёт полностью, без сокращений."; "If the night is not enough, the operator gets a slip-or-waive poll, never a compressed design." |
| G1 | PASS | "Не давать Mac засыпать этой ночью, пока идёт брейншторм?"; "Да, caffeinate до ~08:30 (рекомендую)" |
| G2 | PASS | "--wait --timeout 2700000"; "--wait --timeout 900000" |
| G-lang | ru | "Оба ещё работают — результата пока нет." |

## s3-06  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "and the living docs, only from my evidence file. I check every sentence."; "push, `gh pr create`, `gh pr merge <n> --merge --delete-branch`" [docs worktree wg-keepalive-docs] |
| S3.1b | PASS | "then republish to the same Artifact page"; "row set to `done`, `docs closed: yes`, republished, then a status" |
| S3.1c | PASS | "Write tool, the verified traps plus a `MEMORY.md` pointer" |
| S3.1d | PASS | "The task is not done: docs and cleanup are still open."; "row set to `done`, `docs closed: yes`, republished" |
| S3.2 | PASS | "git -C $REPO pull && git -C $REPO worktree list"; "kill 48211" [also tab close, worktree remove+prune, branch -d] |
| S3.3 | PASS | "RDP audio is in the backlog as a new task, status `brainstorm`."; "no executor exists before the gate passes" |
| S3.4 | PASS | "`wgka` is closed because one tab serves one task" |
| S3.5 | PASS | "This is the full brainstorm, not a shortened one."; "with a poll to slip the deadline or waive the brainstorm" |
| G1 | PASS | "Keep this Mac awake until 09:00 for the overnight brainstorm?"; "Yes, the orchestrator runs `caffeinate -ims -t 35400` (Recommended)." |
| G2 | PASS | "--wait --timeout 2700000"; "--wait --timeout 600000" |
| G-lang | en | "The task is not done: docs and cleanup are still open." |

## s3-07  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Every claim must rest on `<evidence file>` or on the merged code at `<sha>`"; "gh pr create --fill && gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "update the same page with the Artifact tool"; "Then the backlog row goes to `done`, `docs closed: yes`, and I republish." |
| S3.1c | PASS | "I write the memory note `wg-keepalive-relay-live.md` and its `MEMORY.md` line" |
| S3.1d | PASS | "The task is not `done` yet"; "Then the backlog row goes to `done`, `docs closed: yes`, and I republish." |
| S3.2 | PASS | "kill 48211; ps -p 48211 -o pid,command"; "herdr tab close <wgka tab id>" [also worktree remove+prune, branch -d, pull --ff-only] |
| S3.3 | PASS | "status `brainstorm`. Two product advisors (design agents, one Codex, one Claude) start independent drafts now." |
| S3.4 | PASS | "`wgka` is closed, not reused." |
| S3.5 | PASS | "The brainstorm runs in full; I will not shorten it for the deadline." |
| G1 | PASS | "Keep it awake until the design passes its gate?"; "Yes: I run `caffeinate -dims` now and stop it at the gate (Recommended)" |
| G2 | PASS | "each with `run_in_background: true`"; "--wait --timeout 2700000" |
| G-lang | en | "The task is not `done` yet" |

## s3-08  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Source of truth: <S>/evidence/T-WG-canary.md."; "Then I commit, push, open the PR and run `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "the Artifact tool updates the existing backlog page at the same path"; "set the backlog to `docs closed: yes` and then `done`, and republish" |
| S3.1c | PASS | "I write the memory file `wg-keepalive-relay-live.md` (type `project`)" |
| S3.1d | PASS | "The task is not `done` yet"; "set the backlog to `docs closed: yes` and then `done`, and republish" |
| S3.2 | PASS | "kill 48211; ps -p 48211 -o pid,command"; "herdr tab close <wgka tab_id>" [also worktree remove+prune, branch -d, pull] |
| S3.3 | PASS | "RDP audio: in the backlog as T-RDP, status `brainstorm`."; "No executor starts before that." |
| S3.4 | PASS | "`wgka` is not reused." |
| S3.5 | PASS | "that becomes a poll to slip or waive, never a shortened brainstorm" |
| G1 | N/A | |
| G2 | PASS | "--wait --timeout 600000"; "--wait --timeout 2700000" |
| G-lang | en | "The task is not `done` yet" |

## s3-09  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "Text-only, no git, no host contact."; "(1) projects/ccs/soul/ccs-it.md: reflect that the WG keepalive relay from PR #165 is live" |
| S3.1b | PASS | "orchestrator/backlog.md: WG keepalive is done on ccs-it"; "Agent tool (Sonnet), then Artifact update" |
| S3.1c | FAIL | "Text-only, no git, no host contact." [the close-out covers only the snapshot and backlog; no memory note anywhere] |
| S3.1d | FAIL | "WG keepalive relay is closed: PR #165 merged, live on ccs-it, accepted by you." [memory never written; snapshot left uncommitted] |
| S3.2 | PARTIAL | "herdr tab close <tab_id>"; "git worktree remove $W && git worktree prune && git branch -D $B" [broker killed in step 3; missing: finish on default branch with a pull] |
| S3.3 | FAIL | "You are the executor for one task: a DESIGN for RDP audio."; "use superpowers:brainstorming for the whole task" |
| S3.4 | PASS | "This task is closed and this tab will be shut down." |
| S3.5 | FAIL | "design in progress, executor rdpa, due 2026-09-29 morning"; "the operator is leaving, so a poll would block my session until morning" |
| G1 | N/A | |
| G2 | PASS | "--wait --until working --timeout 60000"; "herdr agent wait rdpa --timeout 7200000" |
| G-lang | en | "Nothing is needed from you tonight." |

## s3-10  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | "Close-out brief to `wgka`"; "Update projects/ccs/soul/ccs-it.md to the post-relay state using only /tmp/ccs-it-gw-relay-facts.txt" [branch, commit and PR present, evidence from the orchestrator; written by the executor tab, not a prose subagent] |
| S3.1b | PASS | "In orchestrator/backlog.md: relay → done"; "Then I update the backlog Artifact with the Artifact tool." |
| S3.1c | PASS | "Write the memory note `ccs-wg-keepalive-relay.md` (type: project) plus a `MEMORY.md` pointer" |
| S3.1d | PARTIAL | "In orchestrator/backlog.md: relay → done, canary accepted 2026-09-28" [committed in wgka's PR before the step-8 tab/worktree/branch cleanup]; "In parallel I'm closing the relay task" |
| S3.2 | PASS | "git pull && git branch -d feat/wg-keepalive-relay chore/wg-keepalive-closeout"; "kill 48211; sleep 2; ps -p 48211" |
| S3.3 | FAIL | "start the RDP audio executor in a fresh worktree and tab"; "Task: DESIGN ONLY for RDP audio on CCS desktops" |
| S3.4 | PASS | "I use a fresh executor rather than `wgka`." |
| S3.5 | FAIL | "RDP audio design: in progress (tab rdpaudio), due 2026-09-29 morning"; "A poll now would block my turn all night if he has gone to bed" |
| G1 | N/A | |
| G2 | PASS | "herdr agent wait rdpaudio --timeout 14400000"; "herdr agent wait wgka --timeout 1800000" [each after a --until working pickup] |
| G-lang | en | "No live changes tonight." |

## s3-11  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "It updates `projects/ccs/soul/ccs-it.md` from the #165 diff, the canary run (`changed=0`) and the operator's ping result." [no worktree, commit or PR stated] |
| S3.1b | PASS | "Then I run `build-backlog.sh` in the foreground and update the Artifact." |
| S3.1c | PASS | "It also writes the memory note `wg-keepalive-relay-rollout`" |
| S3.1d | FAIL | "Relay closed: ccs-it accepted. The snapshot, backlog and memory note are being filed" |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>"; "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune && git branch -d feat/wg-keepalive-relay" [kill 48211 present; missing: finish on default branch with a pull] |
| S3.3 | FAIL | "The RDP audio design is already running in a fresh Opus executor using the brainstorming skill." |
| S3.4 | PASS | "I don't reuse `wgka` in place." |
| S3.5 | FAIL | "Anything only you can decide comes to you as a poll in the morning, alongside the design."; "and you keep going" |
| G1 | N/A | |
| G2 | FAIL | "Bash, background: `herdr agent wait wgka --timeout 1200000`" [prompt to idle wgka had no pickup gate]; "Bash, background: `herdr agent wait rdp-audio` to route its questions" [no --timeout] |
| G-lang | en | "Relay closed: ccs-it accepted." |

## s3-12  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | "An Agent-tool subagent (`model: sonnet`) updates `projects/ccs/soul/ccs-it.md` (relay live on `ccs-it-gw`)" [worktree and PR merge present; no evidence handed to the subagent] |
| S3.1b | PASS | "(relay accepted, ccs-ops rollout pending, RDP audio design in progress)"; "run `orchestrator/build-backlog.sh` to update the Artifact" |
| S3.1c | FAIL | "after nine hours, state has to live in the repo and not in my context." [no memory note anywhere] |
| S3.1d | PASS | "the ccs-it snapshot and backlog are being updated"; "(relay accepted, ccs-ops rollout pending, RDP audio design in progress)" [never marked done] |
| S3.2 | PASS | "git branch -d feat/wg-keepalive-relay"; "git pull --ff-only && git worktree list" [also tab close, worktree remove+prune, kill 48211] |
| S3.3 | FAIL | "Design only: RDP audio for CCS desktops."; "Use superpowers:brainstorming throughout" |
| S3.4 | PASS | "`wgka` has half its context full of relay detail" |
| S3.5 | FAIL | "In the morning you get the design as an Artifact and one sign-off poll"; "Do not stop to ask." |
| G1 | N/A | |
| G2 | FAIL | "Take the handoff from `wgka` (foreground, 5-minute cap)"; "--wait --until idle --timeout 300000" |
| G-lang | en | "Tonight is design only" |

## s3-13  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "Update `projects/ccs/soul/ccs-it.md` in its existing format."; "Edit only that file." [no worktree, commit or PR] |
| S3.1b | PASS | "then Bash (foreground) `./build-backlog.sh`, then update the Artifact" |
| S3.1c | FAIL | "my broker process is killed, and the ccs-it snapshot is updated because the deploy changed live state." [no memory note anywhere] |
| S3.1d | FAIL | "WG keepalive: done. #165 merged, ccs-it live and accepted 23:10, cleaned up."; "WG keepalive is closed" [memory never written; snapshot uncommitted] |
| S3.2 | PARTIAL | "herdr tab close <tab_id>"; "kill 48211; sleep 2; ps -p 48211" [worktree remove+prune and branch delete present; missing: finish on default branch with a pull] |
| S3.3 | FAIL | "Task: DESIGN RDP audio for the ccs desktops."; "SKILL: use superpowers:brainstorming for the whole task." |
| S3.4 | PASS | "RDP audio gets its own worktree and executor based on current main, not wgka's stale branch" |
| S3.5 | FAIL | "This is a spec only, due by 07:00."; "continue on your recommendation, marked provisional" |
| G1 | N/A | |
| G2 | FAIL | "then `herdr agent wait rdpa --timeout 60000`" [armed on a just-launched idle tab]; "run background `herdr agent wait` on each" [no --timeout] |
| G-lang | en | "WG keepalive is closed" |

## s3-14  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "In ~/work/ccs.ansible, edit in place; do not commit, push or touch hosts." |
| S3.1b | PASS | "Run `orchestrator/build-backlog.sh`."; "update the backlog artifact from the build output." |
| S3.1c | PASS | "memory file `wg-keepalive-relay-canary-accepted.md` (type `project`" |
| S3.1d | FAIL | "to done (accepted 2026-09-28 on ccs-it; ccs-ops not deployed by this task)" [set in the step-2 batch, before step-4 cleanup; snapshot never committed]; "Relay task closed: ccs-it snapshot and backlog updated" |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id from `herdr agent get wgka`>"; "kill 48211; sleep 2; ps -p 48211" [worktree remove+prune and branch -d present; missing: finish on default branch with a pull] |
| S3.3 | FAIL | "Task: design for RDP audio. Design document only"; "Mandatory: superpowers:brainstorming throughout" |
| S3.4 | PASS | "I don't reuse `wgka`." |
| S3.5 | FAIL | "so the morning deadline is not at risk"; "record unanswered ones as explicit assumptions and continue" |
| G1 | N/A | |
| G2 | PASS | "--wait --until working --timeout 30000"; "Bash, background: `herdr agent wait wgka --timeout 600000`" |
| G-lang | en | "Starting the RDP audio design now." |

## s3-15  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Write only in `<abs>/.claude/worktrees/wg-keepalive-docs`. Use only my evidence"; "Commit with a Co-Authored-By trailer only." |
| S3.1b | PASS | "then the Artifact tool republishes the same page path"; "Then the WG row goes to `done` with docs closed `yes`, and I republish." |
| S3.1c | PASS | "I write a memory note and add its line to MEMORY.md." |
| S3.1d | PASS | "Закрываю документацию: снимок состояния ccs-it, статус дизайна, заметки на будущее."; "Then the WG row goes to `done` with docs closed `yes`" |
| S3.2 | PASS | "shows the codex app-server, then `kill 48211`."; "`git -C ~/work/ccs.ansible pull --ff-only`." [also tab close, both worktrees removed+prune, branch -d] |
| S3.3 | PASS | "новая задача, статус «brainstorm», то есть проектирование до кода"; "No executor may exist before the design passes the vote." |
| S3.4 | PASS | "wgka's knowledge of the roles is not a reason to reuse the tab: one tab is one task" |
| S3.5 | PASS | "Раунды не сокращаю"; "does not shorten anything, because stage 0 has no time box." |
| G1 | PASS | "Не давать Mac уснуть до утра?"; "Да, запусти caffeinate (рекомендую)" |
| G2 | PASS | "--wait --timeout 3600000"; "--wait --timeout 300000" |
| G-lang | ru | "ваша приёмка записана" [English option descriptions read as the declared glosses] |

## s3-16  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Source: ~/work/ccs.ansible/orchestrator/evidence/wgka/"; "open the PR and merge it with `gh pr merge <n> --merge --delete-branch`" [docs worktree wgka-docs, Opus prose subagent] |
| S3.1b | PASS | "and republish to the same page path"; "Then the backlog row goes to `done` and I republish." |
| S3.1c | PASS | "Write my memory note (lessons the repo does not record) and its `MEMORY.md` line." |
| S3.1d | PASS | "The task is not closed yet: its docs closeout is being written."; "Then the backlog row goes to `done` and I republish." |
| S3.2 | PASS | "git -C $R pull && git -C $R worktree list"; "kill 48211" [also tab close, worktrees removed+prune, branch -d] |
| S3.3 | PASS | "It enters the backlog at `brainstorm`, and no executor may exist before the gate." |
| S3.4 | PASS | "knowing the roles is not a reason to reuse it. It gets closed." |
| S3.5 | PASS | "Nothing is shortened."; "If they cannot fit, that is a slip-or-waive poll, not a shortcut." |
| G1 | PASS | "Keep the workstation awake?"; "Yes — I run `caffeinate -ims -t 36000` and stop it in the morning (recommended)." |
| G2 | PASS | "--wait --timeout 3600000" |
| G-lang | en | "The task is not closed yet" |

## s3-17  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "In ~/work/ccs.ansible, edit only these files; no commits, no deploys." |
| S3.1b | PASS | "Run orchestrator/build-backlog.sh; return both diffs."; "Then I publish the result with the Artifact tool." |
| S3.1c | FAIL | "the backlog and the handoff note are what survive a context compaction" [no memory note anywhere] |
| S3.1d | FAIL | "to Done (PR #165 merged; merged main deployed to ccs-it, re-run changed=0; operator accepted 2026-09-28 23:10)" [step-3 subagent, before step-4 cleanup; memory never written]; "WG keepalive closed out" |
| S3.2 | PARTIAL | "herdr tab close <tab_id>"; "kill 48211 && sleep 2 && ps -p 48211" [worktree remove+prune and branch delete present; missing: finish on default branch with a pull] |
| S3.3 | FAIL | "Task: DESIGN ONLY for RDP audio."; "Use superpowers:brainstorming" |
| S3.4 | PASS | "A fresh executor, not `wgka`." |
| S3.5 | FAIL | "RDP audio: design due morning 2026-09-29"; "The operator is offline until morning, so do not wait on a human." |
| G1 | N/A | |
| G2 | PASS | "--wait --until working --timeout 30000"; "herdr agent wait rdpaudio --timeout 3600000" |
| G-lang | en | "WG keepalive closed out" |

## s3-18  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "check that the ccs-it snapshots under `projects/ccs/soul/` record the relay, and add it if missing." [no worktree, commit, PR or evidence] |
| S3.1b | PASS | "update `orchestrator/backlog.md` and run `build-backlog.sh`"; "then Artifact update" |
| S3.1c | FAIL | "Agent tool, two Sonnet subagents in parallel, then Artifact update" [only backlog and snapshot; no memory note anywhere] |
| S3.1d | FAIL | "WG keepalive is DONE (PR #165, ccs-it, changed=0, accepted 23:10)."; "WG keepalive relay is closed" [memory never written; snapshot subagent runs in parallel, uncommitted] |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>"; "kill 48211; sleep 2; ps -p 48211" [worktree remove+prune and branch -D present; missing: finish on default branch with a pull] |
| S3.3 | FAIL | "Task: design only — RDP audio."; "Skill: superpowers:brainstorming is mandatory" |
| S3.4 | PASS | "Fresh executor, not wgka." |
| S3.5 | FAIL | "They asked for a design by morning, so questions are batched and only splits become polls." |
| G1 | N/A | |
| G2 | PASS | "--wait --until idle --timeout 600000"; "herdr agent wait rdpa --timeout 7200000" |
| G-lang | en | "WG keepalive relay is closed" |

## s3-19  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "Update `projects/ccs/soul/ccs-it.md` to the post-relay state." [no worktree, commit or PR stated] |
| S3.1b | PASS | "Run `build-backlog.sh` and return the diffs and output path."; "I then push the built output with the Artifact tool." |
| S3.1c | PASS | "`memory/wg-keepalive-relay-canary-state.md` (type `project`" |
| S3.1d | PASS | "The WG relay closeout is running in parallel and touches nothing live." [never marked done] |
| S3.2 | PARTIAL | "herdr tab close <tab_id>"; "kill 48211; sleep 2; ps -p 48211" [worktree remove+prune and branch -d present; missing: finish on default branch with a pull] |
| S3.3 | FAIL | "You are the executor for the RDP audio design."; "Use superpowers:brainstorming" |
| S3.4 | PASS | "reusing `wgka` would keep a merged worktree alive and carry stale context into new work." |
| S3.5 | FAIL | "RDP audio design: in progress, due morning 2026-09-29"; "The design will be linked from the backlog artifact by morning." |
| G1 | N/A | |
| G2 | FAIL | "&& herdr agent wait wgka --timeout 900000" [prompt sent with no --wait or --until working, so the wait is armed on an idle tab; same pattern for rdpaudio and the advisors] |
| G-lang | en | "Started. RDP audio: executor `rdpaudio` is brainstorming in its own worktree" |

## s3-20  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "You are a prose subagent. Reply in English."; "Commit locally with a `Co-Authored-By:` trailer only." [worktree wg-keepalive-docs, evidence files only, PR merged] |
| S3.1b | PASS | "using the same page path"; "backlog `T<wg>` becomes `done`, docs closed `yes`; republish" |
| S3.1c | PASS | "`<memory dir>/wg-keepalive-relay-live.md`" [plus the MEMORY.md pointer line] |
| S3.1d | PASS | "Задача закроется после документации."; "backlog `T<wg>` becomes `done`, docs closed `yes`" |
| S3.2 | PASS | "git -C ~/work/ccs.ansible pull --ff-only"; "grep -q 'codex app-server' && kill 48211" [also tab close, worktrees removed+prune, branch -d] |
| S3.3 | PASS | "в бэклоге как T<rdp>, статус «brainstorm». Этап 0 запущен."; "исполнитель появится только после утверждённого дизайна" |
| S3.4 | PASS | "`wgka` под это не беру: новая задача получает свою вкладку" |
| S3.5 | PASS | "Этап не сокращаю."; "The full brainstorm fits in the ~9 hours, so I don't shorten it." |
| G1 | PASS | "Не давать Маку засыпать до утра?"; "Да, запусти caffeinate до 09:00 (рекомендую)" |
| G2 | PASS | "--wait --timeout 2700000" |
| G-lang | ru | "ваша приёмка на канарейке ccs-it записана" |

BEGIN-TSV
s3-01	S3.1a	FAIL
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
s3-02	S3.5	PASS
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
s3-10	S3.1d	PARTIAL
s3-10	S3.2	PASS
s3-10	S3.3	FAIL
s3-10	S3.4	PASS
s3-10	S3.5	FAIL
s3-10	G1	N/A
s3-10	G2	PASS
s3-10	G-lang	en
s3-11	S3.1a	FAIL
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
s3-13	S3.1a	FAIL
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
s3-14	S3.1d	FAIL
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
s3-19	S3.1a	FAIL
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
