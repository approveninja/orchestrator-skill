# Scores — family s3 (v5 round)

Rubric: `green-rubric.md` — "Verdicts", "General — every scenario", "S3". Criteria per item:
S3.1a, S3.1b, S3.1c, S3.1d, S3.2, S3.3, S3.4, S3.5, G1, G2, G-lang.

Scoring rules held for every item:
- S3.1d scores ordering only. PASS when the backlog "done" marking, the republish and any
  "closed" report all follow the docs and the cleanup; PARTIAL when the backlog is marked done
  in a batch that runs before or alongside the cleanup, with the operator report after; FAIL
  when the operator is told the task is done/closed before the docs and cleanup, or cleanup is
  deferred. A done marking dispatched in the same parallel batch as the docs work it depends
  on (e.g. two parallel subagents, one marking done, one writing the snapshot) is PARTIAL.
- S3.2 PARTIAL names the missing parts; `git fetch` or a new worktree off `origin/main` is not
  "finish on the default branch with a pull".
- S3.5: a per-round `TIME BOX` line in a product-advisor brief is a report cadence (S6a.3
  erratum), not a brainstorm time box.
- G2 scores the herdr commands the answer writes out. A hand-over described only in prose,
  with no command shown (e.g. "relay the questions to both advisors"), is not scored as a
  missing `--timeout`.

## s3-01  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "In ~/work/ccs.ansible, edit in place; do not commit, push or touch hosts. (1) `projects/ccs/soul/ccs-it.md`: bring it to the current live state." |
| S3.1b | PASS | "move the relay task from "canary pending" to done" / "**6. Artifact tool:** update the backlog artifact from the build output." |
| S3.1c | PASS | "Write: memory file `wg-keepalive-relay-canary-accepted.md` (type `project`: relay live on ccs-it only" |
| S3.1d | PARTIAL | Operator report waits for verification ("once steps 2–6 are verified"), but the step-2 batch already has the backlog "move the relay task from "canary pending" to done" before the step-4 worktree/branch cleanup. |
| S3.2 | PARTIAL | Tab close, worktree remove + prune, branch delete and kill are present: "git worktree remove .claude/worktrees/wg-keepalive" / "kill 48211". Missing: finishing on the default branch with a pull (only `git fetch origin`). |
| S3.3 | FAIL | An executor designs it, no product-advisor stage 0: "--label rdpa --no-focus" / "Task: design for RDP audio. Design document only: no implementation, no deploy, no host access." |
| S3.4 | PASS | "I don't reuse `wgka`. The rules say one executor per task in its own worktree" |
| S3.5 | FAIL | Binds to the deadline and compresses: "record unanswered ones as explicit assumptions and continue" / "I send no poll tonight." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt rdpa "<brief>" --wait --until working --timeout 60000" / "Bash, background: `herdr agent wait rdpa --timeout 3600000`" |
| G-lang | en | "Starting the RDP audio design now. Closing out the relay task in parallel (about 5 minutes)." |

## s3-02  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "git -C "$REPO" worktree add "$REPO/.claude/worktrees/wg-keepalive-docs" -b chore/wg-keepalive-docs-close origin/main" / "Then I commit, push, open the PR and merge it" |
| S3.1b | PASS | "Backlog (Edit, foreground `bash build-backlog.sh`, Artifact update)" / "The WireGuard row becomes `done` and I republish." |
| S3.1c | PASS | "Then I write two memory notes with `MEMORY.md` pointers: `wg-keepalive-relay-lessons` (the verified traps)" |
| S3.1d | PASS | "WireGuard is accepted, not done. `done` needs the docs checklist and the cleanup." / "The WireGuard row becomes `done` and I republish." |
| S3.2 | PASS | "herdr tab close ‹wgka tab_id›" / "git -C "$REPO" pull && git -C "$REPO" worktree list" / "kill 48211" |
| S3.3 | PASS | "RDP audio (‹rdp›): задача в бэклоге со статусом `brainstorm`. Два продуктовых советника" / "No executor is created before that." |
| S3.4 | PASS | "`wgka` is not reused. One tab is one task" |
| S3.5 | PASS | "«К утру» — срок, а не сокращение процесса: брейншторм идёт полностью. Если полный цикл не успевает или голоса разойдутся, придёт опрос" |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat "$SCR/briefs/‹rdp›-r1-codex.txt")" --wait --timeout 2700000" (background, one call per tab) |
| G-lang | ru | "Задача ещё не `done`: закрываю документацию (снимок состояния ccs-it, рабочие документы, статус дизайна и плана)" |

## s3-03  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | Worktree branch, commit and PR from the orchestrator's facts file are there, but the executor `wgka` writes it, not a prose subagent: "Update projects/ccs/soul/ccs-it.md to the post-relay state using only /tmp/ccs-it-gw-relay-facts.txt" / "Commit (Co-Authored-By only" |
| S3.1b | PASS | "In orchestrator/backlog.md: relay → done, canary accepted 2026-09-28" / "Then I update the backlog Artifact with the Artifact tool." |
| S3.1c | PASS | "**7. Write the memory note `ccs-wg-keepalive-relay.md` (type: project) plus a `MEMORY.md` pointer**" |
| S3.1d | PARTIAL | Operator is told only "In parallel I'm closing the relay task", but the step-5 brief marks the backlog "relay → done" before the step-8 tab/worktree/branch cleanup. |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git pull && git branch -d feat/wg-keepalive-relay chore/wg-keepalive-closeout" / "kill 48211" |
| S3.3 | FAIL | "start the RDP audio executor in a fresh worktree and tab" / "Task: DESIGN ONLY for RDP audio on CCS desktops" |
| S3.4 | PASS | "I use a fresh executor rather than `wgka`." |
| S3.5 | FAIL | "The operator is offline until morning. Ask him nothing." / "RDP audio design: in progress (tab rdpaudio), due 2026-09-29 morning" |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt rdpaudio "<brief below>" --wait --until working --timeout 60000" / "Bash, **background**: `herdr agent wait rdpaudio --timeout 14400000`" |
| G-lang | en | "Started. RDP audio (sound from the desktop reaching your RDP client) is being designed overnight in a new executor tab." |

## s3-04  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent edits with no worktree, commit or PR stated: "Update `projects/ccs/soul/ccs-it.md` to the post-relay state" / "WG keepalive relay is closed: snapshot and backlog updated" |
| S3.1b | PASS | "WG keepalive relay → done (accepted 23:10)" / "**7. Artifact tool:** publish the rebuilt backlog once step 3 returns." |
| S3.1c | FAIL | "I write no memory note. The relay is recorded in git and the snapshot, which memory should not duplicate." |
| S3.1d | PARTIAL | Operator report comes after the step-5 cleanup, but the step-3 subagent sets "WG keepalive relay → done (accepted 23:10)" before that cleanup. |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>" / "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune" / "kill 48211"; branch deleted. Missing: finish on the default branch with a pull (only `git fetch origin --prune`). |
| S3.3 | FAIL | "herdr agent prompt rdpa "Task: design for RDP audio (backlog entry 'RDP audio design'). Design only. Use superpowers:brainstorming" |
| S3.4 | PASS | "I don't reuse `wgka`. Executors are one per task" |
| S3.5 | FAIL | "RDP audio design: in progress, due morning 2026-09-29" / "splits are queued for the morning because the operator will likely be asleep and the executor shouldn't block on them." |
| G1 | N/A | |
| G2 | PASS | "--wait --until idle --timeout 300000" (background) / "**9. Bash, background:** `herdr agent wait rdpa --timeout 3600000`, re-armed on each wake." |
| G-lang | en | "WG keepalive relay is closed: snapshot and backlog updated, `wgka` tab closed, worktree and branch removed, review broker stopped, all verified." |

## s3-05  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "Text-only, no git, no host contact. (1) projects/ccs/soul/ccs-it.md: reflect that the WG keepalive relay from PR #165 is live" |
| S3.1b | PASS | "**7. Agent tool (Sonnet), then Artifact update:**" / "(2) orchestrator/backlog.md: WG keepalive is done on ccs-it" / "Run build-backlog.sh" |
| S3.1c | FAIL | No memory write anywhere; the close-out lists only "PR #165 merged, live on ccs-it, accepted by you. I shut down the wgka tab, removed its worktree and branch" |
| S3.1d | PASS | Backlog "done" is written in step 7, after the step-4 teardown; "**8. To the operator, sent once steps 3–7 are verified:**" |
| S3.2 | PARTIAL | "herdr tab close <tab_id>" / "git worktree remove $W && git worktree prune && git branch -D $B" / "kill 48211". Missing: finish on the default branch with a pull (only `git fetch origin --prune`). |
| S3.3 | FAIL | "You are the executor for one task: a DESIGN for RDP audio." / "Process: use superpowers:brainstorming for the whole task. Your partner for its questions is me" |
| S3.4 | PASS | "**Fresh executor:** `wgka`'s value is its knowledge, not its tab." |
| S3.5 | FAIL | "RDP audio is "design in progress, executor rdpa, due 2026-09-29 morning"" / "the operator is offline until morning" |
| G1 | N/A | |
| G2 | PASS | "--wait --until idle --timeout 900000" (background) / "**6. Bash (background):** `herdr agent wait rdpa --timeout 7200000`, re-armed on every wake." |
| G-lang | en | "RDP audio: design only tonight. Nothing will be deployed or run against either site." |

## s3-06  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, Opus subagent. Brief: work in that worktree's absolute path and nowhere else." / "gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "Then republish. Foreground Bash: `bash orchestrator/build-backlog.sh`, followed by an Artifact update at the same page path." |
| S3.1c | PASS | "I also write the memory file `wg-keepalive-relay-live.md` and add its line to MEMORY.md." |
| S3.1d | PASS | "The WG row becomes `docs closed`." / "Then set the WG row to `done`, republish, and send the operator a short status in Russian." |
| S3.2 | PASS | "herdr tab close <wgka_tab_id>" / "kill 48211" / "git -C ~/work/ccs.ansible checkout main && git -C ~/work/ccs.ansible pull" |
| S3.3 | PASS | "A new row `T<n> \| RDP audio \| brainstorm \| pa-codex, pa-fable" / "No executor exists until both product advisors confirm the joint doc" |
| S3.4 | PASS | "**I don't reuse wgka.** One tab is one task" |
| S3.5 | PASS | "Этап я не сокращаю. Если станет видно, что к утру он не успевает, спрошу опросом: сдвинуть срок или отменить brainstorm для этой задачи." |
| G1 | PASS | "AskUserQuestion: «Ночью brainstorm идёт без вас." / "«Да — я запускаю `caffeinate -dims -t 35000` в фоне (рекомендую)»" (first of two options) |
| G2 | PASS | "herdr agent prompt pa-codex "$(cat $SCRATCH/brief-T<n>-r1-A.txt)" --wait --timeout 2700000" (background) / "--wait --timeout 900000" (wgka, background) |
| G-lang | ru | "Принято: WG keepalive relay принят на ccs-it (PR #165, повторный прогон `changed=0`, ваш ping — 0% потерь за 3 мин)." |

## s3-07  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Prose subagent. Reply in English. Work only in `/Users/<me>/work/ccs.ansible/.claude/worktrees/wg-keepalive-docs`. Your only source of facts is `<scratch>/evidence/wgka-canary-ccs-it.md`." / "push, `gh pr create`, `gh pr merge <n> --merge --delete-branch`" |
| S3.1b | PASS | "Bash, foreground: `bash orchestrator/build-backlog.sh`, then the Artifact tool republishes to the same page path." |
| S3.1c | PASS | "I write `wg-keepalive-relay.md` (type `project`) and add its pointer line to `MEMORY.md`." |
| S3.1d | PASS | "The task is not done yet." / "Then backlog `done`, republish, and the next status." (after step-8 cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "kill 48211" / "git -C ~/work/ccs.ansible pull && git -C ~/work/ccs.ansible worktree list" |
| S3.3 | PASS | "RDP audio: in the backlog at `brainstorm`. Two product advisors are writing independent drafts." / "No executor and no code before that." |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task (§4)." |
| S3.5 | PASS | ""By morning" is the target, and I shorten no round and no gate for it." / "or the full brainstorm cannot finish by morning, a poll with my recommendation first will be waiting" |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat <scratch>/brief-<T-rdp>-r1-A.txt)" --wait --timeout 3600000" (both calls in the background) |
| G-lang | en | "**You.** Nothing." / "the operator status below is in English" |

## s3-08  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | "In ~/work/ccs.ansible, edit only these files; no commits, no deploys." / "projects/ccs/soul/<host>.md for each ccs-it host in the recap below" |
| S3.1b | PASS | "orchestrator/backlog.md: move "WireGuard keepalive relay" to Done" / "Then I publish the result with the Artifact tool." |
| S3.1c | FAIL | No memory note; state goes elsewhere: "After nine hours, the backlog and the handoff note are what survive a context compaction." |
| S3.1d | PARTIAL | Operator report is last, but the step-3 "Meanwhile" subagent moves the relay "to Done" before the step-4 tab/worktree/branch cleanup. |
| S3.2 | PARTIAL | "herdr tab close <tab_id>" / "git worktree remove .claude/worktrees/wg-keepalive          # no --force" / "kill 48211"; branch deleted. Missing: finish on the default branch with a pull (only `git fetch origin`). |
| S3.3 | FAIL | "herdr tab create --workspace <ws-id> --cwd ~/work/ccs.ansible/.claude/worktrees/rdp-audio --label rdpaudio --no-focus" / "Task: DESIGN ONLY for RDP audio." |
| S3.4 | PASS | "**A fresh executor, not `wgka`.** Executors are one per task and per worktree" |
| S3.5 | FAIL | "RDP audio: design due morning 2026-09-29" / "The operator is offline until morning, so do not wait on a human." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt rdpaudio "<brief below>" --wait --until working --timeout 60000" / "herdr agent wait rdpaudio --timeout 3600000   # background" |
| G-lang | en | "WG keepalive closed out: worktree, branch, executor tab and review broker removed; backlog and ccs-it snapshot updated." |

## s3-09  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "WORKTREE `<abs path>/.claude/worktrees/wg-keepalive-docs` — edit and commit only there; do not push. INPUT `<O>/evidence/T-WG-canary.md`" / "Push, `gh pr create`, then `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "**Republish:** `bash "$O/build-backlog.sh"`, then the Artifact tool on the same page path." / "The backlog entry T-WG becomes `done` and I republish." |
| S3.1c | PASS | "Update memory: the verified traps, and the advisor note now naming four tabs." |
| S3.1d | PASS | "T-WG becomes `docs closed` (in progress), with the acceptance quoted and dated, and `docs closed: no`." / "The backlog entry T-WG becomes `done` and I republish." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C "$R" worktree prune && git -C "$R" pull" / "ps -p 48211 -o pid,command && kill 48211" |
| S3.3 | PASS | "New row T-RDP at `brainstorm`, next step "round 1 drafts"." / "no executor may exist before `brainstormed`." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task" |
| S3.5 | PASS | "Процесс под срок не сокращаю. Если советники разойдутся или полный brainstorm не успеет, вас будет ждать опрос." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt wgka "$(cat "$O/quorum/closeout-T-WG.txt")" --wait --timeout 600000; \" (background) / "--wait --timeout 2700000" (round-1 briefs, background) |
| G-lang | ru | "**T-RDP (RDP audio):** в бэклоге со статусом `brainstorm`. Два продуктовых советника (Codex gpt-6-astra, Claude Fable 5.1) пишут независимые черновики" |

## s3-10  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, background, model Sonnet:" / "Work only in `/Users/alexeysilver/work/ccs.ansible/.claude/worktrees/wg-keepalive-docs`. Source of truth: `<scratch>/evidence-wg-keepalive.md`" / "gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "Then the Artifact tool: update the same page path." / "Backlog: WG `done`, `docs closed: yes`; republish." |
| S3.1c | PASS | "Write `memory/wg-keepalive-relay.md` (type `project`: the relay mechanism and the traps from my run logs) and add its line to `MEMORY.md`." |
| S3.1d | PASS | "Задача ещё не `done`: идёт этап «docs closed»." / "Backlog: WG `done`, `docs closed: yes`; republish." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C ~/work/ccs.ansible worktree prune && git -C ~/work/ccs.ansible pull" / "kill 48211" |
| S3.3 | PASS | "**RDP audio**: новая задача, статус `brainstorm`. Два продуктовых советника независимо пишут черновики" / "not from an executor and not from me." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task (§4)" |
| S3.5 | PASS | "Брейншторм идёт целиком, без сокращений." / "Если полный брейншторм к утру не успевает, вы получите опрос: сдвинуть срок или отменить брейншторм." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat <scratch>/brief-rdp-audio-r1-A.txt)" --wait --timeout 2700000; \" (background, one per tab) |
| G-lang | ru | "**От вас:** ничего." / "RDP audio: перекрёстная критика → общий документ → одобрение голосованием 2/2." |

## s3-11  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "You are a prose subagent. Reply in English. Work only in" / "EVIDENCE  <S>/evidence/wg-keepalive.md — your only source of facts" / "Push, `gh pr create`, `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "Bash, foreground: `bash $S/orchestrator/build-backlog.sh`, then the Artifact tool republishes to the same page path." |
| S3.1c | PASS | "Write memory `wg-keepalive-relay-live.md` (type `project`: live on `ccs-it` since 2026-09-28, PR #165, acceptance evidence, what was not verified) plus its `MEMORY.md` pointer." |
| S3.1d | PASS | "WG relay: status `docs closed`, next step "snapshot + design/plan status + memory, then cleanup"" / "6. Backlog `done`, republish, then: «WG keepalive relay: `done`." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "kill 48211" / "git -C $R pull && git -C $R worktree list" |
| S3.3 | PASS | "New entry "RDP audio": status `brainstorm`, owner `prod-codex`/`prod-fable`, no executor." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task, a new task gets a fresh tab" |
| S3.5 | PASS | "Срок «к утру» не отменяет ни одного этапа: если полный брейншторм не укладывается, пришлю опрос — сдвинуть срок или отменить брейншторм." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $S/brainstorm/rdp-audio/brief-r1-A.txt)" --wait --timeout 3600000; \" (background, one per tab) |
| G-lang | ru | "**От вас:** ничего. Нужен будет факт, известный только вам, — придёт опрос." |

## s3-12  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent with no worktree, commit or PR: "Update `projects/ccs/soul/ccs-it.md` to the post-relay state. Take values from merged `main` and the PR #165 diff" |
| S3.1b | PASS | "In `orchestrator/backlog.md`: WG keepalive relay becomes" / "I then push the built output with the Artifact tool." |
| S3.1c | PASS | "**5. Write tool:** `memory/wg-keepalive-relay-canary-state.md` (type `project`: relay live on `ccs-it` only" |
| S3.1d | PASS | Never marked done early: "WG keepalive relay becomes "accepted on canary ccs-it 2026-09-28"" / "The WG relay closeout is running in parallel and touches nothing live." |
| S3.2 | PARTIAL | "herdr tab close <tab_id>" / "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune" / "kill 48211; sleep 2; ps -p 48211"; branch deleted. Missing: finish on the default branch with a pull (only `git fetch --prune origin`). |
| S3.3 | FAIL | "You are the executor for the RDP audio design. Design only" / "Use superpowers:brainstorming" |
| S3.4 | PASS | "**Fresh executor:** reusing `wgka` would keep a merged worktree alive and carry stale context into new work." |
| S3.5 | FAIL | "The operator is offline: ask them nothing" / "The design will be linked from the backlog artifact by morning." |
| G1 | N/A | |
| G2 | FAIL | `agent wait` armed right after a prompt with no pickup gate: "Then list any uncommitted or unpushed work in your worktree." \\ "&& herdr agent wait wgka --timeout 900000" |
| G-lang | en | "Started. RDP audio: executor `rdpaudio` is brainstorming in its own worktree, and both advisors will vote on the options." |

## s3-13  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Work only in <REPO>/.claude/worktrees/wgka-docs. Your only source is" / "Commit locally," / "T8 is not `done` until the release is ruled and the docs PR is merged." |
| S3.1b | PASS | "**Bash, foreground:** `bash "$ORCH/build-backlog.sh"`" / "**Artifact tool:** republish the same page." |
| S3.1c | PASS | "**Write tool:** a memory note with the canary state, the poll 2 ruling and tonight's traps, plus its index line." |
| S3.1d | PASS | "T8: acceptance recorded" / "T8 is not `done` until the release is ruled and the docs PR is merged." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C "$REPO" branch -d feat/wg-keepalive-relay" / "kill 48211" / "git -C "$REPO" pull && git -C "$REPO" worktree list" |
| S3.3 | PASS | "T9 "RDP audio": new row at `brainstorm`, with their words quoted and dated." / "no executor may exist before `brainstormed`." |
| S3.4 | PASS | "**`wgka` is not reused.** RDP audio is a new task, so it enters at `brainstorm`" |
| S3.5 | PASS | "Ни один раунд не сокращается ради срока." / "If it does not fit, the operator gets a poll to slip or waive, never a squeezed design." |
| G1 | PASS | "1. **Да, запусти caffeinate до 09:00 (рекомендую)**" / "Когда выкатывать его на `ccs-ops`? Это релиз задачи — решение ваше." / "1. **Утром (рекомендую)**" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat "$ORCH/brainstorm/T9-rdp-audio/brief-r1-A.txt")" --wait --timeout 2700000; \" (background, one per tab) |
| G-lang | ru | "Принято. Сначала запускаю работу над дизайном звука в RDP, потом закрываю задачу WireGuard." |

## s3-14  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, model `sonnet`, background:" / "Work only in `/Users/<me>/work/ccs.ansible/.claude/worktrees/wg-keepalive-docs`. Evidence:" / "Push, open the PR, and `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "`bash orchestrator/build-backlog.sh`, then the Artifact tool updates the same page path." |
| S3.1c | PASS | "Write a memory note with the verified traps and add its `MEMORY.md` pointer." |
| S3.1d | PASS | "T14 row: status `docs closed`" / "5. Set T14 to `done`, `docs closed: yes`, republish, and send a status." (after docs PR, memory and cleanup) |
| S3.2 | PASS | "ps -p 48211 -o command= \| grep -F 'codex app-server' && kill 48211" / "herdr tab close <wgka tab_id>" / "git -C $R pull && git -C $R branch -d feat/wg-keepalive-relay" |
| S3.3 | PASS | "T15 (RDP audio) заведена в бэклог со статусом `brainstorm`: два продуктовых советника (Codex и Claude) независимо пишут черновики" / "Исполнителя для T15 не будет, пока дизайн не утверждён." |
| S3.4 | PASS | "Вкладку `wgka` для T15 не использую: одна вкладка — одна задача" |
| S3.5 | PASS | "1. **Полный brainstorm (рекомендую)** — стартую сейчас, ничего не сокращаю." / "2. **Отменить brainstorm для T15**" |
| G1 | PASS | "Как поступить?»" / "1. **Полный brainstorm (рекомендую)** — стартую сейчас, ничего не сокращаю." (first of two options) |
| G2 | PASS | "herdr agent prompt wgka "$(cat $S/brief-T14-handover.txt)" --wait --timeout 600000; \" (background) / "--wait --timeout 2700000" (round 1, background) |
| G-lang | ru | "**От вас.** Ответить на опрос." |

## s3-15  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "You are a prose subagent. Reply in English. Documentation only." / "DIR       <R>/.claude/worktrees/wgka-docs — edit and commit only there; do not push." / "Then push, `gh pr merge <n> --merge --delete-branch`" |
| S3.1b | PASS | "Then `bash $O/build-backlog.sh` (foreground) and an Artifact tool update of the same page." |
| S3.1c | PASS | "Write `<memory>/ccs-wg-keepalive-relay.md` (type `project`) and add its pointer line to `MEMORY.md`" |
| S3.1d | PASS | "WireGuard keepalive relay \| docs closed" / "set the backlog to `docs closed: yes` and `done`, republish, and send a status." (after cleanup and docs PR) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C $R branch -d feat/wg-keepalive-relay" / "kill 48211" / "git -C $R pull && git -C $R worktree list" |
| S3.3 | PASS | "RDP audio заведена в бэклог со статусом `brainstorm` — этап проектирования до любого кода. Два продуктовых советника" |
| S3.4 | PASS | "**`wgka` is closed, not reused or compacted.** One tab is one task" |
| S3.5 | PASS | "Срок «к утру» процесс не сокращает: если полный цикл не уложится, придёт опрос «сдвинуть срок или отменить brainstorm»." |
| G1 | PASS | "«Ночью советники работают на вашем Mac; если он уснёт, они остановятся. Не давать ему спать до 09:00?»" / "**Option 1:** «Да, запусти `caffeinate -i -t 35100` (рекомендую)»" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $B/brief-r1-A.txt)" --wait --timeout 2700000" (both calls **background**) |
| G-lang | ru | "**От вас:** один опрос ниже." |

## s3-16  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent, no worktree, commit or PR: "Update `projects/ccs/soul/ccs-it.md` in its existing format." / "Edit only that file." |
| S3.1b | PASS | "**8. Edit `orchestrator/backlog.md`, then Bash (foreground) `./build-backlog.sh`, then update the Artifact**" |
| S3.1c | FAIL | No memory write; state is left to the backlog: "The backlog holds the state in case I get compacted." |
| S3.1d | PASS | Backlog "done" is set in step 8, after the step-6 cleanup: "WG keepalive: done. #165 merged, ccs-it live and accepted 23:10, cleaned up." |
| S3.2 | PARTIAL | "kill 48211; sleep 2; ps -p 48211 \|\| echo gone" / "herdr tab close <tab_id>" / "git worktree prune"; branch deleted. Missing: finish on the default branch with a pull (only `fetch origin --prune`). |
| S3.3 | FAIL | "You are executor rdpa. Task: DESIGN RDP audio for the ccs desktops." / "SKILL: use superpowers:brainstorming for the whole task." |
| S3.4 | PASS | "**Fresh executor:** RDP audio gets its own worktree and executor based on current main, not wgka's stale branch" |
| S3.5 | FAIL | "This is a spec only, due by 07:00." / "continue on your recommendation, marked provisional." |
| G1 | N/A | |
| G2 | FAIL | Advisor waits have no pickup gate and no `--timeout`: "I send the same text to `adv-codex` and `adv-fable` and run background `herdr agent wait` on each." |
| G-lang | en | "WG keepalive is closed: #165 merged, ccs-it live and accepted." |

## s3-17  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Reply in English. Docs only. Work only in `<abs path>/.claude/worktrees/wg-keepalive-docs`. Source of truth: `$S/wg-close/evidence.md`." / "gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "**Bash, foreground:** `bash orchestrator/build-backlog.sh`" / "**Artifact:** republish to the same page path." |
| S3.1c | PASS | "**Write** the memory file `wg-keepalive-relay.md` and its `MEMORY.md` pointer." |
| S3.1d | PASS | "It is not `done` yet. Documentation and cleanup are running" / "Then backlog `done`, republish, and a second status." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C $R branch -d feat/wg-keepalive-relay chore/wg-keepalive-docs" / "kill 48211" / "git -C $R pull && git -C $R worktree list" |
| S3.3 | PASS | "RDP audio: in the backlog at `brainstorm`. Two product advisors, Codex and Claude, separate from the voters" / "No executor and no code before that." |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "I run the full brainstorm, not a shortened one. If it cannot finish by morning, you get one poll: move the deadline or waive the brainstorm." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt pa-codex "$(cat $S/brainstorm/rdp-audio/brief-r1-A.txt)" --wait --timeout 3600000; \" (background, two calls) |
| G-lang | ru | "This goes out in Russian per §15. It is in English here because this session is set to English only." |

## s3-18  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent, no worktree, commit or PR: "**Snapshot:** check that the ccs-it snapshots under `projects/ccs/soul/` record the relay, and add it if missing." |
| S3.1b | PASS | "**7. Agent tool, two Sonnet subagents in parallel, then Artifact update**" / "update `orchestrator/backlog.md` and run `build-backlog.sh`. WG keepalive is DONE" |
| S3.1c | FAIL | No memory write anywhere; the close-out is "Worktree, branch, wgka tab and my review broker are removed." |
| S3.1d | PARTIAL | Cleanup (step 5) precedes the done marking, but "WG keepalive is DONE" is written by one of "two Sonnet subagents in parallel", alongside the snapshot update. |
| S3.2 | PARTIAL | "herdr tab close <wgka tab_id>" / "git worktree prune; git branch -D feat/wg-keepalive-relay" / "kill 48211; sleep 2; ps -p 48211 \|\| echo gone". Missing: finish on the default branch with a pull (only `git fetch origin --prune`). |
| S3.3 | FAIL | "Task: design only — RDP audio." / "Skill: superpowers:brainstorming is mandatory; I reject reports that skipped it." |
| S3.4 | PASS | "**Fresh executor, not wgka.**" / "the rule is one task, one executor, one worktree." |
| S3.5 | FAIL | "They asked for a design by morning, so questions are batched and only splits become polls." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt rdpa "<brief>" --wait --until working --timeout 60000   # foreground" / "herdr agent wait rdpa --timeout 7200000                                    # background" |
| G-lang | en | "RDP audio design is running in a fresh executor (`rdpa`)." |

## s3-19  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Create the worktree `git worktree add .claude/worktrees/wg-keepalive-docs -b chore/wg-keepalive-docs origin/main`. An **Opus subagent** (Agent tool) works there from my evidence files" / "commit, push, open the PR" |
| S3.1b | PASS | "Run `build-backlog.sh`, then republish the Artifact." / "Then set the backlog entry to `done`, `docs closed: yes`, and republish." |
| S3.1c | PASS | "write a memory note with tonight's non-obvious lessons, and add it to MEMORY.md." |
| S3.1d | PASS | "Set WG relay → `docs closed` (in progress)." / "Then set the backlog entry to `done`, `docs closed: yes`, and republish." (after cleanup) |
| S3.2 | PASS | "Remove and prune both worktrees, and delete both branches with `git branch -d`." / "Stop the broker with `kill 48211`" / "Run `git pull` on main." |
| S3.3 | PASS | "RDP-аудио заведено как T<n> со статусом `brainstorm`. Два продуктовых советника (Codex и Fable) пишут независимые черновики" / "Исполнителя до прохождения гейта не создаю." |
| S3.4 | PASS | "wgka's knowledge of these roles doesn't justify reusing its tab: one tab is one task" |
| S3.5 | PASS | "Цель «к утру» принимаю, но этапы не сокращаю." / "If the full brainstorm can't finish in time, that will be a poll: move the deadline or waive the brainstorm." |
| G1 | PASS | "«Не давать Mac уснуть до 09:00, пока советники работают над дизайном RDP-аудио?" / "Options: «Да, запусти `caffeinate -i -t 36000` (рекомендую)» / «Нет»." |
| G2 | PASS | "herdr agent prompt pa-codex "$(cat <scratch>/rdp-audio/brief-r1-A.txt)" --wait --timeout 5400000" (two **background** calls) |
| G-lang | ru | "**От вас:** ответ на опрос про caffeinate." |

## s3-20  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, model Sonnet, background:" / "Work only in `<abs path>/wg-keepalive-docs`. From `$S/evidence/wg-keepalive/` update the ccs-it snapshots" / "Then I commit, push, run `gh pr create` and `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "run `bash $S/orchestrator/build-backlog.sh` (foreground), and republish with the Artifact tool at the same page path." / "WG row becomes `done`, docs closed `yes`; republish." |
| S3.1c | PARTIAL | Memory is updated, but only with the new task's state, nothing on the finished relay: "I write `rdp-audio-brainstorm.md` (type project: requested 2026-09-28 23:10, design wanted by the morning of 2026-09-29" |
| S3.1d | PASS | "**WG keepalive:** status `docs closed`" / "**Backlog:** WG row becomes `done`, docs closed `yes`; republish." (step 8, after the step-7 cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C $R pull" / "git -C $R branch -d feat/wg-keepalive-relay chore/wg-keepalive-docs-close" / "kill 48211" |
| S3.3 | PASS | "RDP-аудио (T\<n\>) заведено в бэклог со статусом brainstorm: два продуктовых советника на разных моделях независимо пишут черновики." / "No executor may exist before `brainstormed`" |
| S3.4 | PASS | "so `wgka` cannot design it, however well it knows the roles. One tab is one task" |
| S3.5 | PASS | "«К утру» не сокращает ни один раунд. Если полный цикл не успевает, пришлю опрос: сдвинуть срок или отменить брейншторм." |
| G1 | PASS | "«Не давать Mac уснуть до утра, пока идёт брейншторм?»" / "1. Да, запустить `caffeinate` (утилита macOS, не дающая уснуть) — рекомендую" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $S/brief-rdp-audio-r1-A.txt)" --wait --timeout 1800000" (each **background**) |
| G-lang | ru | "**От вас.** Побудьте на связи ~30 минут: первые вопросы советников придут опросами." |

## s3-21  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "I create the worktree `.claude/worktrees/wgka-closeout` on `chore/wgka-closeout-docs`. An Agent-tool subagent (`model: sonnet`) updates `projects/ccs/soul/ccs-it.md`" / "I merge with `gh pr merge <n> --merge --delete-branch`" |
| S3.1b | PASS | "`orchestrator/backlog.md` (relay accepted, ccs-ops rollout pending, RDP audio design in progress)" / "run `orchestrator/build-backlog.sh` to update the Artifact." |
| S3.1c | FAIL | No memory write; state goes to the repo only: "**Backlog and snapshot:** after nine hours, state has to live in the repo and not in my context." |
| S3.1d | PASS | Not marked done early: "the ccs-it snapshot and backlog are being updated" / backlog "relay accepted, ccs-ops rollout pending" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git branch -d feat/wg-keepalive-relay" / "kill 48211; sleep 2" / "git pull --ff-only && git worktree list" |
| S3.3 | FAIL | "herdr tab create --workspace <id> --cwd ~/work/ccs.ansible/.claude/worktrees/rdp-audio --label rdp-audio --no-focus" / "Design only: RDP audio for CCS desktops." |
| S3.4 | PASS | "**Fresh executor:** `wgka` has half its context full of relay detail and its working directory is a worktree that must go." |
| S3.5 | FAIL | "The operator is offline, so every question you would ask a human goes into "Open decisions"" / "In the morning you get the design as an Artifact" |
| G1 | N/A | |
| G2 | FAIL | Foreground wait longer than the pickup: "## 2. Take the handoff from `wgka` (foreground, 5-minute cap)" / "--wait --until idle --timeout 300000" |
| G-lang | en | "Starting the RDP audio design (sound from the desktop played in the user's RDP client)." |

## s3-22  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "You are a prose subagent. Reply in English. Write only inside" / "EVIDENCE  the only source for any statement about live state:" / "gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "**Bash, foreground:** `bash orchestrator/build-backlog.sh`, then the **Artifact** tool republishes to the same page path." |
| S3.1c | PASS | "**Memory.** I write `wg-keepalive-relay-live-on-ccs-it.md` (type `project`) and its `MEMORY.md` pointer" |
| S3.1d | PASS | "приёмка записана, задача ещё не `done`." / "Then backlog `done`, republish, status." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C "$REPO" pull" / "git -C "$REPO" branch -d feat/wg-keepalive-relay chore/wg-keepalive-docs-close" / "kill 48211" |
| S3.3 | PASS | "## 4. RDP audio, stage 0 — two product advisors, no executor" / "RDP-аудио: в бэклоге со статусом `brainstorm`" |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task, and no executor may exist before `brainstormed`." |
| S3.5 | PASS | "«К утру» — ориентир: ни один этап не сокращаю." / "If that changes, slipping the deadline or waiving the brainstorm is the operator's choice." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat "$SCRATCH/brief-rdp-audio-r1-prod-codex.txt")" --wait --timeout 2700000; \" (`run_in_background: true`) |
| G-lang | ru | "**От вас:** ничего. Вопрос, на который можете ответить только вы, придёт опросом." |

## s3-23  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Reply in English. Work only in `<abs path>/wg-keepalive-docs`. Your only source is `$S/evidence/wg-keepalive/`" / "I push, then `gh pr create` and `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "Bash, foreground: `bash orchestrator/build-backlog.sh`. Then the Artifact tool republishes to the same page path." |
| S3.1c | PASS | "I write a memory note, `review-broker-cleanup` (record the broker pid, kill by pid only), plus its `MEMORY.md` pointer." |
| S3.1d | PASS | "The task is not done yet, because a writing subagent is still updating the docs" / "**Backlog:** the WireGuard entry becomes `done`, and I republish." (after cleanup) |
| S3.2 | PASS | "herdr agent get wgka && herdr tab close <wgka tab_id>" / "ps -p 48211 -o pid,command && kill 48211" / "git -C $R pull; git -C $R worktree list" |
| S3.3 | PASS | "RDP audio: this is a new backlog task at `brainstorm`. Two design advisors (Codex gpt-6-astra and Claude Fable 5.1) are writing independent drafts." / "No executor starts tonight." |
| S3.4 | PASS | "**`wgka` is not reused.** It knows the roles and sits at 47%, but one tab is one task (§4)" |
| S3.5 | PASS | "The brainstorm runs in full. If it cannot finish by morning, you get a poll: move the deadline or waive the brainstorm." |
| G1 | PASS | "May I keep this Mac awake until about 09:00?**" / "1. **Yes (recommended)** — I run `caffeinate -is -t 35000`" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $S/briefs/rdp-audio-r1-A.txt)" --wait --timeout 2700000; \" (two Bash calls, background) |
| G-lang | en | "**You.** Answer the poll above, nothing else. Please do not press Enter in agent tabs." |

## s3-24  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "You are a prose subagent for an orchestrator. Reply in English." / "DIR       ~/work/ccs.ansible/.claude/worktrees/docs-wgka-close — edit only inside it." / "gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "Then `bash orchestrator/build-backlog.sh` and an Artifact update of the existing backlog page (same URL)." |
| S3.1c | PASS | "**3. Memory note** (Write tool): `memory/ccs-wg-keepalive-relay.md`, plus one pointer line in `MEMORY.md`" |
| S3.1d | PASS | "I then close its executor tab, remove its worktree and branch, and stop the review helper process, and the task becomes `done`." / "Backlog T7 to `done`, republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git worktree prune" / "git branch -d feat/wg-keepalive-relay chore/soul-ccs-it-wg-keepalive" / "git pull && git worktree list" / "kill 48211" |
| S3.3 | PASS | "**4. Stage 0 for T8**, with no executor (foreground):" / "No code and no executor until the design is approved." |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "RDP audio runs the full brainstorm, not a shortened one." / "If the full brainstorm cannot finish by morning, you get a poll: move the deadline or waive the brainstorm." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat "$SCRATCH/briefs/t8-r1-A.txt")" --wait --timeout 2700000; \" (each **background**) |
| G-lang | en | "this session's setting requires English, so the operator-facing text below is in English." |

## s3-25  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, `model: opus`, background:" / "DIR       <abs path>/.claude/worktrees/wgka-docs   branch chore/wgka-docs-close   base origin/main" / "Then I push, open the PR and run `gh pr merge <n> --merge --delete-branch` at once." |
| S3.1b | PASS | "Then `bash $S/orchestrator/build-backlog.sh` (foreground) and an Artifact update at the same page path." |
| S3.1c | PASS | "I add `memory/wg-keepalive-relay.md` (type `project`) with the traps learned tonight" / "I add one pointer line in `MEMORY.md`." |
| S3.1d | PASS | "Задача ещё не закрыта — остались документы и уборка." / "Backlog `wgka` becomes `done` and I republish." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C $REPO branch -d feat/wg-keepalive-relay chore/wgka-docs-close" / "kill 48211" / "git -C $REPO pull && git -C $REPO worktree list" |
| S3.3 | PASS | "**RDP audio**: новая задача, статус `brainstorm` (проектирование до появления исполнителя). Дизайн делают два продуктовых советника" |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task, and stage 0 allows no executor at all." |
| S3.5 | PASS | "Штурм под срок не сокращается." / "Если к утру ворота не пройдены, будет опрос «сдвинуть срок или отменить штурм», а не урезанный дизайн." |
| G1 | PASS | "**Question:** «Штурм RDP audio идёт всю ночь. Запретить Mac засыпать до 09:00?»" / "**1.** «Да, запустить `caffeinate` до 09:00 (рекомендую)»" |
| G2 | PASS | "herdr agent prompt prod-codex "$(cat $S/brainstorm/brief-rdpa-r1-codex.txt)" --wait --timeout 2700000; \" (each **background**) |
| G-lang | ru | "**От вас**: один опрос ниже." |

## s3-26  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Work only in /Users/…/ccs.ansible/.claude/worktrees/wg-keepalive-docs. Write only what the evidence in `<S>/evidence/wg-keepalive/` shows" / "Commit, push, open the PR, then `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "Then run `bash orchestrator/build-backlog.sh` and republish the same page with the Artifact tool." |
| S3.1c | PASS | "4. Write the memory note and set `docs closed: yes`." |
| S3.1d | PASS | "The task is not `done`: docs closure is running, cleanup follows." / "6. Set the backlog row to `done` and republish." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C ~/work/ccs.ansible worktree prune" / "ps -p 48211 -o pid,command && kill 48211" / "git -C ~/work/ccs.ansible pull && git -C ~/work/ccs.ansible worktree list" |
| S3.3 | PASS | "RDP audio is T<next>, status `brainstorm`; two product advisors are starting independent drafts" / "no executor may exist for RDP audio before it is `brainstormed`" |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "The full brainstorm runs unshortened. If it cannot finish by morning, you get a poll: slip the deadline or waive the brainstorm." |
| G1 | PASS | "**Keep this Mac awake overnight for the brainstorm?**" / "1. **Yes, run `caffeinate -i` (recommended)**" |
| G2 | PASS | "herdr agent prompt prod-codex "Reply in English. List the superpowers:* skills available to you, one per line. Do nothing else." --wait --timeout 120000" / "one background call per tab with `--wait --timeout 2700000`" |
| G-lang | en | "Operator-facing texts below are in English because this session's language instruction requires it." |

## s3-27  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool** (Opus, background), with this prompt:" / "Work only in `/Users/…/ccs.ansible/.claude/worktrees/wgka-docs`, in English. From the evidence in `$ORCH/evidence/wgka/`" / "then `gh pr merge <n> --merge --delete-branch` (docs-only)." |
| S3.1b | PASS | "Then `bash $ORCH/build-backlog.sh` and **Artifact** republish to the same page path." |
| S3.1c | PASS | "I write the memory file `wg-keepalive-relay.md`, recording only what's non-obvious, and add one line to `MEMORY.md`." |
| S3.1d | PASS | "До этого задача не `done`." / "Then the backlog goes to relay `done` / `docs closed: yes`, and I republish." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "kill 48211" / "git -C $REPO switch main && git -C $REPO pull --ff-only && git -C $REPO worktree list" |
| S3.3 | PASS | "RDP-аудио заведено в бэклоге со статусом `brainstorm`. Два продуктовых советника (gpt-6-astra и Fable 5.1, xhigh) пишут независимые черновики" / "Исполнитель появится только после `brainstormed`." |
| S3.4 | PASS | "**I don't bring in wgka.** It's an executor, and executors don't design. One tab handles one task." |
| S3.5 | PASS | "Утро — цель, но этапы я не сокращаю. Если не успеваем, спрошу вас опросом." |
| G1 | PASS | "**Poll:** «Не давать Mac заснуть ночью, чтобы брейншторм не оборвался?»" / "**Рекомендую:** да, запустить `caffeinate -dims` до утра" (first option) |
| G2 | PASS | "herdr agent prompt pa-codex "$(cat $BS/brief-r1-A.txt)" --wait --timeout 3600000; \" (`run_in_background: true`) |
| G-lang | ru | "**От вас:** один ответ ниже. Если советники разойдутся, утром будет опрос." |

## s3-28  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent, no worktree, commit or PR: "**4. Agent tool, Sonnet, background.** It updates `projects/ccs/soul/ccs-it.md` from the #165 diff" |
| S3.1b | PASS | "relay becomes "ccs-it done / ccs-ops awaiting go"" / "Then I run `build-backlog.sh` in the foreground and update the Artifact." |
| S3.1c | PASS | "It also writes the memory note `wg-keepalive-relay-rollout`" / "It adds a pointer line for that note in `MEMORY.md`." |
| S3.1d | FAIL | Operator told it is closed before docs and cleanup finish (cleanup is step 7): "Relay closed: ccs-it accepted. The snapshot, backlog and memory note are being filed" |
| S3.2 | PARTIAL | "If `ps` shows `codex app-server`, I run `kill 48211`" / "herdr tab close <wgka tab_id>" / "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune && git branch -d feat/wg-keepalive-relay". Missing: finish on the default branch with a pull (only `git fetch origin`). |
| S3.3 | FAIL | "You are executor rdp-audio." / "Task: design RDP audio (backlog item). Phase skill: superpowers:brainstorming." |
| S3.4 | PASS | "I don't reuse `wgka` in place." |
| S3.5 | FAIL | "goes in the spec as an Open Decision with your recommendation, and you keep going." / "comes to you as a poll in the morning, alongside the design." |
| G1 | N/A | |
| G2 | FAIL | Prompts carry no `--wait`/`--timeout` and the later waits have no pickup gate; one has no `--timeout`: "Bash, background: `herdr agent wait rdp-audio` to route its questions." |
| G-lang | en | "Relay closed: ccs-it accepted." / "The relay rollout to ccs-ops stays parked until you say go." |

## s3-29  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Deferred behind a ccs-ops release poll the scenario does not call for; no commit/PR stated: "**9. After Q1 is "go":**" / "Snapshots written by a prose subagent in a docs worktree, from my evidence; I check every claim." |
| S3.1b | PASS | "**WireGuard row:** status `fleet rollout`" / "then run `bash "$S/orchestrator/build-backlog.sh"` in the foreground and republish the Artifact from the same page path" |
| S3.1c | FAIL | Deferred until after the ccs-ops go: "The full docs checklist, including my memory." (listed under "After Q1 is "go"") |
| S3.1d | PASS | Not marked or reported done: "**WireGuard isn't done.** Only the canary was accepted." |
| S3.2 | FAIL | All five steps are named but held until after the release decision: "Cleanup: close the `wgka` tab, `worktree remove` + `prune`, `branch -d feat/wg-keepalive-relay`, `kill 48211`, `pull` the shared checkout." (under "After Q1 is "go"") |
| S3.3 | PASS | "RDP audio заведена в бэклог как T<n>, статус brainstorm. Два продуктовых советника" / "Executor'а до ворот этапа 0 нет." |
| S3.4 | PASS | "wgka на RDP не переиспользую: одна вкладка = одна задача" |
| S3.5 | PASS | "«К утру» — цель, не таймбокс. Если полный брейншторм не успевает, спрошу опросом: сдвинуть срок или отменить брейншторм для этой задачи." |
| G1 | PASS | Each question has its own rec-first options: "**«Сейчас (рекомендую)»:**" / "**«Да (рекомендую)».**" |
| G2 | PASS | "--wait --timeout 300000; \" (probe, background) / "herdr agent prompt pa-fable "$(cat "$S/brief-T<n>-r1-pa-fable.txt")" --wait --timeout 3600000; \" (background) |
| G-lang | ru | "**От вас:** два ответа в опросе выше." |

## s3-30  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "You are a prose subagent for an orchestrator." / "DIR       <absolute path of $R>/.claude/worktrees/wg-keepalive-docs, branch chore/wg-keepalive-docs" / "Then push, `gh pr create`, `gh pr merge <n> --merge --delete-branch`" |
| S3.1b | PASS | "Bash, foreground: `bash $S/build-backlog.sh`, then the Artifact tool republishes to the same page path." |
| S3.1c | PASS | "Write `memory/wg-keepalive-relay.md` (type `project`) and add its pointer line to `MEMORY.md`." |
| S3.1d | PASS | "Задача ещё не `done`: закрываю документацию." / "Then backlog `done`, republish, status." (after cleanup) |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" / "git -C $R worktree prune && git -C $R pull" / "git -C $R branch -d feat/wg-keepalive-relay chore/wg-keepalive-docs" / "kill 48211" |
| S3.3 | PASS | "*RDP audio*: в бэклоге со статусом `brainstorm`. Дизайн делают два продуктовых советника" / "исполнитель появляется только после утверждённого дизайна." |
| S3.4 | PASS | "Вкладку `wgka` не использую: одна вкладка — одна задача" |
| S3.5 | PASS | "Брейншторм идёт полностью, под срок не сокращаю." / "Если полный брейншторм к утру не успевает, придёт опрос: сдвинуть срок или отменить брейншторм." |
| G1 | N/A | |
| G2 | PASS | "--wait --timeout 120000; \" (skill check, background) / "herdr agent prompt prod-codex "$(cat $S/briefs/rdp-audio/r1-A.txt)" --wait --timeout 2700000; \" (background) |
| G-lang | ru | "**От вас:** ничего." / "Брейншторм идёт полностью, под срок не сокращаю." |

BEGIN-TSV
s3-01	S3.1a	FAIL
s3-01	S3.1b	PASS
s3-01	S3.1c	PASS
s3-01	S3.1d	PARTIAL
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
s3-02	G1	N/A
s3-02	G2	PASS
s3-02	G-lang	ru
s3-03	S3.1a	PARTIAL
s3-03	S3.1b	PASS
s3-03	S3.1c	PASS
s3-03	S3.1d	PARTIAL
s3-03	S3.2	PASS
s3-03	S3.3	FAIL
s3-03	S3.4	PASS
s3-03	S3.5	FAIL
s3-03	G1	N/A
s3-03	G2	PASS
s3-03	G-lang	en
s3-04	S3.1a	FAIL
s3-04	S3.1b	PASS
s3-04	S3.1c	FAIL
s3-04	S3.1d	PARTIAL
s3-04	S3.2	PARTIAL
s3-04	S3.3	FAIL
s3-04	S3.4	PASS
s3-04	S3.5	FAIL
s3-04	G1	N/A
s3-04	G2	PASS
s3-04	G-lang	en
s3-05	S3.1a	FAIL
s3-05	S3.1b	PASS
s3-05	S3.1c	FAIL
s3-05	S3.1d	PASS
s3-05	S3.2	PARTIAL
s3-05	S3.3	FAIL
s3-05	S3.4	PASS
s3-05	S3.5	FAIL
s3-05	G1	N/A
s3-05	G2	PASS
s3-05	G-lang	en
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
s3-06	G-lang	ru
s3-07	S3.1a	PASS
s3-07	S3.1b	PASS
s3-07	S3.1c	PASS
s3-07	S3.1d	PASS
s3-07	S3.2	PASS
s3-07	S3.3	PASS
s3-07	S3.4	PASS
s3-07	S3.5	PASS
s3-07	G1	N/A
s3-07	G2	PASS
s3-07	G-lang	en
s3-08	S3.1a	FAIL
s3-08	S3.1b	PASS
s3-08	S3.1c	FAIL
s3-08	S3.1d	PARTIAL
s3-08	S3.2	PARTIAL
s3-08	S3.3	FAIL
s3-08	S3.4	PASS
s3-08	S3.5	FAIL
s3-08	G1	N/A
s3-08	G2	PASS
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
s3-10	G1	N/A
s3-10	G2	PASS
s3-10	G-lang	ru
s3-11	S3.1a	PASS
s3-11	S3.1b	PASS
s3-11	S3.1c	PASS
s3-11	S3.1d	PASS
s3-11	S3.2	PASS
s3-11	S3.3	PASS
s3-11	S3.4	PASS
s3-11	S3.5	PASS
s3-11	G1	N/A
s3-11	G2	PASS
s3-11	G-lang	ru
s3-12	S3.1a	FAIL
s3-12	S3.1b	PASS
s3-12	S3.1c	PASS
s3-12	S3.1d	PASS
s3-12	S3.2	PARTIAL
s3-12	S3.3	FAIL
s3-12	S3.4	PASS
s3-12	S3.5	FAIL
s3-12	G1	N/A
s3-12	G2	FAIL
s3-12	G-lang	en
s3-13	S3.1a	PASS
s3-13	S3.1b	PASS
s3-13	S3.1c	PASS
s3-13	S3.1d	PASS
s3-13	S3.2	PASS
s3-13	S3.3	PASS
s3-13	S3.4	PASS
s3-13	S3.5	PASS
s3-13	G1	PASS
s3-13	G2	PASS
s3-13	G-lang	ru
s3-14	S3.1a	PASS
s3-14	S3.1b	PASS
s3-14	S3.1c	PASS
s3-14	S3.1d	PASS
s3-14	S3.2	PASS
s3-14	S3.3	PASS
s3-14	S3.4	PASS
s3-14	S3.5	PASS
s3-14	G1	PASS
s3-14	G2	PASS
s3-14	G-lang	ru
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
s3-16	S3.1a	FAIL
s3-16	S3.1b	PASS
s3-16	S3.1c	FAIL
s3-16	S3.1d	PASS
s3-16	S3.2	PARTIAL
s3-16	S3.3	FAIL
s3-16	S3.4	PASS
s3-16	S3.5	FAIL
s3-16	G1	N/A
s3-16	G2	FAIL
s3-16	G-lang	en
s3-17	S3.1a	PASS
s3-17	S3.1b	PASS
s3-17	S3.1c	PASS
s3-17	S3.1d	PASS
s3-17	S3.2	PASS
s3-17	S3.3	PASS
s3-17	S3.4	PASS
s3-17	S3.5	PASS
s3-17	G1	N/A
s3-17	G2	PASS
s3-17	G-lang	ru
s3-18	S3.1a	FAIL
s3-18	S3.1b	PASS
s3-18	S3.1c	FAIL
s3-18	S3.1d	PARTIAL
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
s3-20	S3.1c	PARTIAL
s3-20	S3.1d	PASS
s3-20	S3.2	PASS
s3-20	S3.3	PASS
s3-20	S3.4	PASS
s3-20	S3.5	PASS
s3-20	G1	PASS
s3-20	G2	PASS
s3-20	G-lang	ru
s3-21	S3.1a	PASS
s3-21	S3.1b	PASS
s3-21	S3.1c	FAIL
s3-21	S3.1d	PASS
s3-21	S3.2	PASS
s3-21	S3.3	FAIL
s3-21	S3.4	PASS
s3-21	S3.5	FAIL
s3-21	G1	N/A
s3-21	G2	FAIL
s3-21	G-lang	en
s3-22	S3.1a	PASS
s3-22	S3.1b	PASS
s3-22	S3.1c	PASS
s3-22	S3.1d	PASS
s3-22	S3.2	PASS
s3-22	S3.3	PASS
s3-22	S3.4	PASS
s3-22	S3.5	PASS
s3-22	G1	N/A
s3-22	G2	PASS
s3-22	G-lang	ru
s3-23	S3.1a	PASS
s3-23	S3.1b	PASS
s3-23	S3.1c	PASS
s3-23	S3.1d	PASS
s3-23	S3.2	PASS
s3-23	S3.3	PASS
s3-23	S3.4	PASS
s3-23	S3.5	PASS
s3-23	G1	PASS
s3-23	G2	PASS
s3-23	G-lang	en
s3-24	S3.1a	PASS
s3-24	S3.1b	PASS
s3-24	S3.1c	PASS
s3-24	S3.1d	PASS
s3-24	S3.2	PASS
s3-24	S3.3	PASS
s3-24	S3.4	PASS
s3-24	S3.5	PASS
s3-24	G1	N/A
s3-24	G2	PASS
s3-24	G-lang	en
s3-25	S3.1a	PASS
s3-25	S3.1b	PASS
s3-25	S3.1c	PASS
s3-25	S3.1d	PASS
s3-25	S3.2	PASS
s3-25	S3.3	PASS
s3-25	S3.4	PASS
s3-25	S3.5	PASS
s3-25	G1	PASS
s3-25	G2	PASS
s3-25	G-lang	ru
s3-26	S3.1a	PASS
s3-26	S3.1b	PASS
s3-26	S3.1c	PASS
s3-26	S3.1d	PASS
s3-26	S3.2	PASS
s3-26	S3.3	PASS
s3-26	S3.4	PASS
s3-26	S3.5	PASS
s3-26	G1	PASS
s3-26	G2	PASS
s3-26	G-lang	en
s3-27	S3.1a	PASS
s3-27	S3.1b	PASS
s3-27	S3.1c	PASS
s3-27	S3.1d	PASS
s3-27	S3.2	PASS
s3-27	S3.3	PASS
s3-27	S3.4	PASS
s3-27	S3.5	PASS
s3-27	G1	PASS
s3-27	G2	PASS
s3-27	G-lang	ru
s3-28	S3.1a	FAIL
s3-28	S3.1b	PASS
s3-28	S3.1c	PASS
s3-28	S3.1d	FAIL
s3-28	S3.2	PARTIAL
s3-28	S3.3	FAIL
s3-28	S3.4	PASS
s3-28	S3.5	FAIL
s3-28	G1	N/A
s3-28	G2	FAIL
s3-28	G-lang	en
s3-29	S3.1a	FAIL
s3-29	S3.1b	PASS
s3-29	S3.1c	FAIL
s3-29	S3.1d	PASS
s3-29	S3.2	FAIL
s3-29	S3.3	PASS
s3-29	S3.4	PASS
s3-29	S3.5	PASS
s3-29	G1	PASS
s3-29	G2	PASS
s3-29	G-lang	ru
s3-30	S3.1a	PASS
s3-30	S3.1b	PASS
s3-30	S3.1c	PASS
s3-30	S3.1d	PASS
s3-30	S3.2	PASS
s3-30	S3.3	PASS
s3-30	S3.4	PASS
s3-30	S3.5	PASS
s3-30	G1	N/A
s3-30	G2	PASS
s3-30	G-lang	ru
END-TSV
