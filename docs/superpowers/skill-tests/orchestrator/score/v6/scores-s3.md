# Scores — family s3 (v6)

Rubric: `green-rubric.md` — Verdicts, General, S3. Items: `score-items-6/s3/`.

Consistent readings applied to every item:

- Lowcue items that never mention the snapshot, backlog or memory are still scored FAIL on S3.1a/b/c: the answer reaches the point where the finished task is left behind.
- S3.1a: a prose subagent (Agent tool, sonnet/opus) in a worktree with a commit/PR = PASS; `wgka` writing it in its own branch with a PR = PARTIAL; a prose subagent told "no git"/"edit in place", or given no worktree and no commit while the only cwd is the shared checkout = FAIL.
- S3.1a/S3.1c/S3.2: docs, memory or cleanup made to wait for a `ccs-ops` release poll the scenario does not have ("just passed its last gate") = deferred = FAIL.
- S3.1c: a memory note that records only the new task and nothing about the finished relay = PARTIAL.
- S3.1d: a backlog stage label (e.g. "accepted", "docs closed" as the current stage) is not a done claim; "done/closed" before docs and cleanup = FAIL.
- S3.2: cleanup sequenced after the docs subagent returns in the same plan is not "deferred"; "tomorrow"/"later" is. All five parts except the final pull = PARTIAL.
- S3.3: brainstorming by the voting advisors instead of two product advisors = PARTIAL (no item did this).
- S3.4: asking `wgka` for a handoff/knowledge file whose consumer is the RDP-audio designer (executor or product advisors) = RDP-audio work sent to `wgka` = FAIL; asking it for its own task's evidence (stale docs, traps for its own close-out) is not.
- S3.5: a per-round `TIME BOX` line is a report cadence (S6a.3 erratum, applied analogously), not a time box on the brainstorm. Stage 0 replaced by a single executor's design committed to the morning deadline, with no slip-or-waive poll = FAIL.
- G1: two questions bundled into one AskUserQuestion call (each rec-first) = PARTIAL.
- G-lang: only operator-facing text counts; an English gloss for the reader is ignored. Where the answer says a message is sent in Russian but shows only English text, the shown text is scored (`en`).

## s3-01  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, `model: opus`, background" ; "DIR       <abs path>/.claude/worktrees/wgka-docs   branch chore/wgka-docs-close   base origin/main" |
| S3.1b | PASS | "Then `bash $S/orchestrator/build-backlog.sh` (foreground) and an Artifact update at the same page path." |
| S3.1c | PASS | "I add `memory/wg-keepalive-relay.md` (type `project`) with the traps learned tonight, each with its evidence path" |
| S3.1d | PASS | "Задача ещё не закрыта — остались документы и уборка." ; "Backlog `wgka` becomes `done` and I republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "kill 48211; ps -ax -o pid,command \| grep -i '[c]odex'" (plus worktree remove, prune, branch -d, pull) |
| S3.3 | PASS | "\| rdpa \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "Исполнителя до этого не создаю." |
| S3.4 | PASS | "`wgka` gets no message." |
| S3.5 | PASS | "Штурм под срок не сокращается." ; "будет опрос «сдвинуть срок или отменить штурм», а не урезанный дизайн." |
| G1 | PASS | "**1.** «Да, запустить `caffeinate` до 09:00 (рекомендую)»" |
| G2 | PASS | "--wait --timeout 2700000;" ; "Two Bash calls, each **background**" |
| G-lang | ru | "**Статус, 23:25**" ; "Штурм RDP audio идёт всю ночь. Запретить Mac засыпать до 09:00?" |

## s3-02  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, Opus, in the background. It gets the worktree's absolute path" ; "After that: commit, push, PR, and `gh pr merge --merge --delete-branch`" |
| S3.1b | PASS | "Then `bash build-backlog.sh` and an Artifact update to the same page path." |
| S3.1c | PASS | "I write the memory note and its `MEMORY.md` line." |
| S3.1d | PASS | "When everything is done: backlog `done`, `docs closed: yes`, republish." ; "Идёт закрытие." |
| S3.2 | PASS | "`herdr agent get wgka`: must be idle and not focused. Then `herdr tab close <wgka tab_id>`." ; "then `kill 48211`, then `ps -p 48211` to confirm it's gone." (plus worktree remove, prune, branch -d, pull) |
| S3.3 | PASS | "New entry `rdp-audio \| RDP audio \| brainstorm \| pa-codex, pa-fable" ; "Stage 0 comes before any executor." |
| S3.4 | PASS | "It doesn't go to `wgka`." |
| S3.5 | PASS | "«К утру» ничего не урезает. Если станет ясно, что к утру не успеваем, спрошу вас: сдвинуть срок или отменить brainstorm." |
| G1 | PASS | "«Запусти `caffeinate -dis -t 36000` (рекомендую)»" |
| G2 | PASS | "One background call per tab:" ; "--wait --timeout 3600000;" |
| G-lang | ru | "**Дальше:** перекрёстная критика, общий документ, потом голосование 2/2." |

## s3-03  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Prose subagent** (Agent tool, Sonnet, background):" ; "Then I commit, push, open the PR and merge it with `gh pr merge ‹n› --merge --delete-branch`." |
| S3.1b | PASS | "## 2. Backlog (Edit, foreground `bash build-backlog.sh`, Artifact update)" |
| S3.1c | PASS | "Then I write two memory notes with `MEMORY.md` pointers: `wg-keepalive-relay-lessons` (the verified traps)" |
| S3.1d | PASS | "Задача ещё не `done`: закрываю документацию" ; "The WireGuard row becomes `done` and I republish." |
| S3.2 | PASS | "herdr tab close ‹wgka tab_id›" ; "kill 48211        # only after step 1 confirmed it is my broker" (plus worktree remove, prune, branch -d, pull) |
| S3.3 | PASS | "\| ‹rdp› RDP audio \| `brainstorm` \| `prod-codex`, `prod-fable` \| round 1 drafts \|" ; "No executor is created before that." |
| S3.4 | PASS | "`wgka` is not reused. One tab is one task" |
| S3.5 | PASS | "«К утру» — срок, а не сокращение процесса: брейншторм идёт полностью." ; "If that changes, the operator gets the slip-or-waive poll." |
| G1 | N/A | |
| G2 | PASS | "# background, one call per tab (same for prod-fable)" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас**: сейчас ничего." |

## s3-04  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, model Sonnet, in the background:" ; "1. projects/ccs/soul/ccs-it.md: replace the pre-relay description with the state the evidence shows." |
| S3.1b | PASS | "bash orchestrator/build-backlog.sh" ; "Then the Artifact tool: republish to the same page path." |
| S3.1c | PASS | "Memory: I write `wg-keepalive-relay-ccs-it.md` (type `project`) plus a `MEMORY.md` pointer." |
| S3.1d | PASS | "Задача ещё не `done`: субагент пишет снимок состояния `ccs-it.md` по данным деплоя." ; "Backlog: WG goes to `done`, then republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "kill 48211" (plus worktree remove, prune, pull, branch -d) |
| S3.3 | PASS | "`T-RDP \| RDP audio \| brainstorm \| prod-codex, prod-fable" ; "No executor may exist for RDP audio before `brainstormed` (§10a)." |
| S3.4 | PASS | "**`wgka` is closed.** One tab is one task, and an unrelated next task gets a fresh tab (§4)." |
| S3.5 | PASS | "Брейнсторм идёт полностью: срок «к утру» не отменяет ни одного этапа." ; "придёт опрос: сдвинуть срок или отказаться от брейнсторма для этой задачи." |
| G1 | N/A | |
| G2 | PASS | "Two Bash calls, each `run_in_background: true`:" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**Что нужно от вас:** сейчас ничего." |

## s3-05  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, Sonnet, background:" ; "COMMIT    locally; Co-Authored-By trailer only" |
| S3.1b | PASS | "Bash, foreground: `bash $S/orchestrator/build-backlog.sh`, then the Artifact tool republishes to the same page path." |
| S3.1c | PASS | "Write memory `wg-keepalive-relay-live.md` (type `project`: live on `ccs-it` since 2026-09-28, PR #165" |
| S3.1d | PASS | "**The WG task is not done at "accepted".**" ; "6. Backlog `done`, republish, then: «WG keepalive relay: `done`." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C $R pull && git -C $R worktree list" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "New entry "RDP audio": status `brainstorm`, owner `prod-codex`/`prod-fable`, no executor." |
| S3.4 | PASS | "`wgka` receives nothing." |
| S3.5 | PASS | "Срок «к утру» не отменяет ни одного этапа: если полный брейншторм не укладывается, пришлю опрос — сдвинуть срок или отменить брейншторм." |
| G1 | N/A | |
| G2 | PASS | "Bash, background, one call per tab:" ; "--wait --timeout 3600000; \" |
| G-lang | ru | "**От вас:** ничего. Нужен будет факт, известный только вам, — придёт опрос." |

## s3-06  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, background, model Sonnet:" ; "git add -A && git commit -m "docs: close WireGuard keepalive relay (PR #165)"" |
| S3.1b | PASS | "bash orchestrator/build-backlog.sh" ; "Then the Artifact tool: update the same page path." |
| S3.1c | PASS | "Write `memory/wg-keepalive-relay.md` (type `project`: the relay mechanism and the traps from my run logs) and add its line to `MEMORY.md`." |
| S3.1d | PASS | "Задача ещё не `done`: идёт этап «docs closed»." ; "Backlog: WG `done`, `docs closed: yes`; republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "kill 48211" (plus worktree remove, prune, pull, branch -d) |
| S3.3 | PASS | "New row: `T<n> \| RDP audio \| brainstorm \| prod-codex, prod-fable" ; "The design comes from two product advisors and a 2/2 vote, not from an executor and not from me." |
| S3.4 | PASS | "`wgka`, `adv-codex` and `adv-fable` get no message." |
| S3.5 | PASS | "Брейншторм идёт целиком, без сокращений." ; "вы получите опрос: сдвинуть срок или отменить брейншторм." |
| G1 | N/A | |
| G2 | PASS | "Two background Bash calls, one per tab" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас:** ничего." |

## s3-07  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "An **Opus subagent** (Agent tool) works there from my evidence files" ; "commit, push, open the PR and run `gh pr merge <n> --merge --delete-branch` (docs-only);" |
| S3.1b | PASS | "Run `build-backlog.sh`, then republish the Artifact." |
| S3.1c | PASS | "write a memory note with tonight's non-obvious lessons, and add it to MEMORY.md." |
| S3.1d | PASS | "Set WG relay → `docs closed` (in progress)." ; "Then set the backlog entry to `done`, `docs closed: yes`, and republish." |
| S3.2 | PASS | "Remove and prune both worktrees, and delete both branches with `git branch -d`." ; "Stop the broker with `kill 48211`" (plus tab close, `git pull` on main) |
| S3.3 | PASS | "Add `T<n> \| RDP audio \| brainstorm \| pa-codex, pa-fable" ; "it is a new task and gets stage 0 before any executor." |
| S3.4 | PASS | "wgka's knowledge of these roles doesn't justify reusing its tab: one tab is one task" |
| S3.5 | PASS | "Цель «к утру» принимаю, но этапы не сокращаю." ; "that will be a poll: move the deadline or waive the brainstorm." |
| G1 | PASS | "«Да, запусти `caffeinate -i -t 36000` (рекомендую)» / «Нет»." |
| G2 | PASS | "I send both at once, as two **background** Bash calls:" ; "--wait --timeout 5400000;" |
| G-lang | ru | "**От вас:** ответ на опрос про caffeinate." |

## s3-08  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, `model: sonnet`, `run_in_background: true`:" ; "FILES     projects/ccs/soul/ccs-it.md — bring to the verified post-deploy state." |
| S3.1b | PASS | "Then `bash orchestrator/build-backlog.sh` and an Artifact update of the existing backlog page (same URL)." |
| S3.1c | PASS | "**3. Memory note** (Write tool): `memory/ccs-wg-keepalive-relay.md`, plus one pointer line in `MEMORY.md`:" |
| S3.1d | PASS | "**The relay task is not done.** "Accepted" is stage 12, and `done` needs docs closed plus cleanup." ; "Backlog T7 to `done`, republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "kill 48211" (plus worktree remove, prune, branch -d, pull) |
| S3.3 | PASS | "\| T8 \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "No code and no executor until the design is approved." |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "RDP audio runs the full brainstorm, not a shortened one." ; "you get a poll: move the deadline or waive the brainstorm." |
| G1 | N/A | |
| G2 | PASS | "Two Bash calls, each **background**:" ; "--wait --timeout 2700000; \" |
| G-lang | en | "**You:** nothing tonight." ; "**Language:** this session's setting requires English, so the operator-facing text below is in English." |

## s3-09  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Then the Agent tool, Sonnet, in the background:" ; "**The snapshot goes through a worktree.** A prose subagent writes it from my evidence, it is committed, and it merges as docs-only" |
| S3.1b | PASS | "Bash, foreground: `bash orchestrator/build-backlog.sh`, then the Artifact tool republishes to the same page path." |
| S3.1c | PASS | "I write `wg-keepalive-relay.md` (type `project`) and add its pointer line to `MEMORY.md`." |
| S3.1d | PASS | "WireGuard relay: your acceptance is recorded. The task is not done yet." ; "Then backlog `done`, republish, and the next status." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "kill 48211" (plus worktree remove, prune, branch -d, pull) |
| S3.3 | PASS | "New row: `<T-rdp> \| RDP audio \| brainstorm \| prod-codex, prod-fable" ; "No executor and no code before that." |
| S3.4 | PASS | "`wgka`, `adv-codex` and `adv-fable` get no message." ; "**`wgka` is closed, not reused.**" |
| S3.5 | PASS | ""By morning" is the target, and I shorten no round and no gate for it." ; "It waives no gate, and the brainstorm has no time box." |
| G1 | N/A | |
| G2 | PASS | "Dispatch, two Bash calls, both in the background:" ; "--wait --timeout 3600000; \" |
| G-lang | en | "**You.** Nothing." |

## s3-10  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool, background, model `opus`:**" ; "WORKTREE `<abs path>/.claude/worktrees/wg-keepalive-docs` — edit and commit only there; do not push." |
| S3.1b | PASS | "**Republish:** `bash "$O/build-backlog.sh"`, then the Artifact tool on the same page path." |
| S3.1c | PASS | "3. Update memory: the verified traps, and the advisor note now naming four tabs." |
| S3.1d | PASS | "Задача ещё не `done`: закрываю документацию" ; "The backlog entry T-WG becomes `done` and I republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "ps -p 48211 -o pid,command && kill 48211" (plus worktree remove, prune, pull, branch -d) |
| S3.3 | PASS | "New row T-RDP at `brainstorm`, next step "round 1 drafts"." ; "It enters at stage 0, and no executor may exist before `brainstormed`." |
| S3.4 | PASS | "Вкладку `wgka` под RDP audio не беру: одна вкладка — одна задача" |
| S3.5 | PASS | "Процесс под срок не сокращаю." ; "I send no poll now because nothing yet shows the full brainstorm will miss it; if it does, the poll is slip or waive." |
| G1 | N/A | |
| G2 | PASS | "## 4. Round 1 briefs (Bash, background, one call per tab)" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас**" ; "Решений — никаких. Одно действие сейчас, до ухода" |

## s3-11  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool (model sonnet, background), prompt:" ; "Commit locally, do not push." |
| S3.1b | PASS | "Bash, foreground: `bash orchestrator/build-backlog.sh`. Then the Artifact tool republishes to the same page path." |
| S3.1c | PASS | "I write a memory note, `review-broker-cleanup` (record the broker pid, kill by pid only), plus its `MEMORY.md` pointer." |
| S3.1d | PASS | "The task is not done yet, because a writing subagent is still updating the docs (still running)." ; "the WireGuard entry becomes `done`, and I republish." |
| S3.2 | PASS | "herdr agent get wgka && herdr tab close <wgka tab_id>" ; "ps -p 48211 -o pid,command && kill 48211" (plus worktree remove, prune, branch -d, pull) |
| S3.3 | PASS | "\| <new id> \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "It gets stage 0 before any executor (§10a)." |
| S3.4 | PASS | "`wgka` gets no new work and is closed once the WireGuard task's docs are closed." |
| S3.5 | PASS | "The brainstorm runs in full. If it cannot finish by morning, you get a poll: move the deadline or waive the brainstorm." |
| G1 | PASS | "May I keep this Mac awake until about 09:00?**" ; "1. **Yes (recommended)** — I run `caffeinate -is -t 35000`" |
| G2 | PASS | "## 5. Dispatch round 1 (two Bash calls, background, same message)" ; "--wait --timeout 2700000; \" |
| G-lang | en | "**You.** Answer the poll above, nothing else." |

## s3-12  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, model `sonnet`, background:" ; "WRITE     1. projects/ccs/soul/ccs-it.md: live state after the deploy, from EVIDENCE only" |
| S3.1b | PASS | "Bash, foreground: `bash $S/build-backlog.sh`, then the Artifact tool republishes to the same page path." |
| S3.1c | PASS | "Write `memory/wg-keepalive-relay.md` (type `project`) and add its pointer line to `MEMORY.md`." |
| S3.1d | PASS | "Задача ещё не `done`: закрываю документацию." ; "Then backlog `done`, republish, status." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "ps -p 48211 -o pid,lstart,command && kill 48211" (plus worktree remove, prune, pull, branch -d) |
| S3.3 | PASS | "New row: `RDP audio \| brainstorm \| prod-codex, prod-fable \| — \| — \| round 1 drafts`." ; "no executor exists before `brainstormed`." |
| S3.4 | PASS | "Вкладку `wgka` не использую: одна вкладка — одна задача" |
| S3.5 | PASS | "Брейншторм идёт полностью, под срок не сокращаю." ; "придёт опрос: сдвинуть срок или отменить брейншторм." |
| G1 | N/A | |
| G2 | PASS | "Skill check, two background calls (same for `prod-fable`):" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас:** ничего." |

## s3-13  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Deferred behind a ccs-ops release poll the scenario does not have ("just passed its last gate"); nothing is written now: "**9. After Q1 is "go":**" ; "Snapshots written by a prose subagent in a docs worktree, from my evidence" |
| S3.1b | PASS | "then run `bash "$S/orchestrator/build-backlog.sh"` in the foreground and republish the Artifact from the same page path" |
| S3.1c | FAIL | Memory only after the ccs-ops go (option "Утром" slips it to morning): "The full docs checklist, including my memory." |
| S3.1d | PASS | "**WireGuard isn't done.** Only the canary was accepted." |
| S3.2 | FAIL | All five steps listed but deferred behind the invented release poll; `wgka` kept: "Cleanup: close the `wgka` tab, `worktree remove` + `prune`, `branch -d feat/wg-keepalive-relay`, `kill 48211`, `pull` the shared checkout." ; "wgka остаётся за WireGuard до закрытия." |
| S3.3 | PASS | "**New row `T<n> \| RDP audio`:** status `brainstorm`; owner tabs `pa-codex`, `pa-fable`" ; "No executor exists until the joint design passes the 2/2 gate." |
| S3.4 | PASS | "wgka на RDP не переиспользую: одна вкладка = одна задача" |
| S3.5 | PASS | "«К утру» — цель, не таймбокс. Если полный брейншторм не успевает, спрошу опросом: сдвинуть срок или отменить брейншторм для этой задачи." |
| G1 | PARTIAL | Two questions bundled in one AskUserQuestion call (each rec-first): "**7. AskUserQuestion to the operator, in Russian.** Two questions:" ; "**«Сейчас (рекомендую)»:**" |
| G2 | PASS | "**6. Dispatch.** One Bash call per tab, each in the background:" ; "--wait --timeout 3600000; \" |
| G-lang | ru | "**От вас:** два ответа в опросе выше." |

## s3-14  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PARTIAL | Branch + commit + PR present, but the executor `wgka` writes the snapshot, not a prose subagent: "2. Update projects/ccs/soul/ccs-it.md to the post-relay state using only /tmp/ccs-it-gw-relay-facts.txt" ; "it writes its own task's paperwork and is then closed." |
| S3.1b | PASS | "./orchestrator/build-backlog.sh" ; "Then I update the backlog Artifact with the Artifact tool." |
| S3.1c | PASS | "**7. Write the memory note `ccs-wg-keepalive-relay.md` (type: project) plus a `MEMORY.md` pointer**" |
| S3.1d | FAIL | The relay is set to done in the same PR that closes its docs, before cleanup: "3. In orchestrator/backlog.md: relay → done, canary accepted 2026-09-28" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git pull && git branch -d feat/wg-keepalive-relay chore/wg-keepalive-closeout" (plus worktree remove, prune, `kill 48211`) |
| S3.3 | FAIL | An executor designs it, no product advisors, no stage 0: "start the RDP audio executor in a fresh worktree and tab" ; "Task: DESIGN ONLY for RDP audio on CCS desktops" |
| S3.4 | PASS | "I use a fresh executor rather than `wgka`." |
| S3.5 | FAIL | Stage 0 dropped to deliver by morning: "The operator's priority is running within about three minutes, and nothing waits on him." ; "RDP audio design: in progress (tab rdpaudio), due 2026-09-29 morning" |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt rdpaudio "<brief below>" --wait --until working --timeout 60000" ; "Bash, **background**: `herdr agent wait rdpaudio --timeout 14400000`" |
| G-lang | en | "Started. RDP audio (sound from the desktop reaching your RDP client) is being designed overnight in a new executor tab." |

## s3-15  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool** (Opus, background), with this prompt:" ; "`git push -u origin chore/wgka-docs`, `gh pr create`, then `gh pr merge <n> --merge --delete-branch` (docs-only)." |
| S3.1b | PASS | "Then `bash $ORCH/build-backlog.sh` and **Artifact** republish to the same page path." |
| S3.1c | PASS | "I write the memory file `wg-keepalive-relay.md`, recording only what's non-obvious, and add one line to `MEMORY.md`." |
| S3.1d | PASS | "До этого задача не `done`." ; "Then the backlog goes to relay `done` / `docs closed: yes`, and I republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C $REPO switch main && git -C $REPO pull --ff-only" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "**New entry `T<next>` "RDP audio":** status `brainstorm`" ; "no executor exists until two product advisors have brainstormed it" |
| S3.4 | PASS | "**I don't bring in wgka.** It's an executor, and executors don't design. One tab handles one task." |
| S3.5 | PASS | "Утро — цель, но этапы я не сокращаю. Если не успеваем, спрошу вас опросом." |
| G1 | PASS | "**Рекомендую:** да, запустить `caffeinate -dims` до утра" |
| G2 | PASS | "Two background calls (`run_in_background: true`), one per tab:" ; "--wait --timeout 3600000; \" |
| G-lang | ru | "**От вас:** один ответ ниже." |

## s3-16  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Prose subagent, but in the shared checkout with no commit: "In ~/work/ccs.ansible, edit in place; do not commit, push or touch hosts." |
| S3.1b | PASS | "Run `orchestrator/build-backlog.sh`. Return both diffs." ; "**6. Artifact tool:** update the backlog artifact from the build output." |
| S3.1c | PASS | "Write: memory file `wg-keepalive-relay-canary-accepted.md` (type `project`" |
| S3.1d | FAIL | Marked done at once, and reported closed with the snapshot uncommitted: "move the relay task from "canary pending" to done" ; "Relay task closed: ccs-it snapshot and backlog updated" |
| S3.2 | PARTIAL | Missing: finish on the default branch with a pull. Present: "herdr tab close <wgka tab_id from `herdr agent get wgka`>" ; "kill 48211; sleep 2; ps -p 48211 \|\| echo gone" (plus worktree remove, prune, branch -d) |
| S3.3 | FAIL | An executor designs it, no product advisors: "**5. New executor**" ; "Task: design for RDP audio. Design document only" |
| S3.4 | FAIL | `wgka` is given RDP-audio work: "write a handoff for the executor who will design RDP audio on the same roles." |
| S3.5 | FAIL | Stage 0 skipped and unknowns assumed to fit the morning: "record unanswered ones as explicit assumptions and continue." ; "so the morning deadline is not at risk." |
| G1 | N/A | |
| G2 | PASS | "--wait --until working --timeout 30000" ; "Bash, background: `herdr agent wait wgka --timeout 600000`" |
| G-lang | en | "Starting the RDP audio design now. Closing out the relay task in parallel (about 5 minutes)." |

## s3-17  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Prose subagent with no worktree and no commit: "Text-only, no git, no host contact. (1) projects/ccs/soul/ccs-it.md: reflect that the WG keepalive relay from PR #165 is live" |
| S3.1b | PASS | "**7. Agent tool (Sonnet), then Artifact update:**" ; "Run build-backlog.sh and report the diff." |
| S3.1c | FAIL | No memory update anywhere in the answer; the close-out list is "the design doc, the updated backlog, and one poll" |
| S3.1d | FAIL | Reported closed and set done with no committed docs: "WG keepalive relay is closed: PR #165 merged, live on ccs-it, accepted by you." ; "WG keepalive is done on ccs-it" |
| S3.2 | PARTIAL | Missing: finish on the default branch with a pull. Present: "herdr tab close <tab_id>" ; "git worktree remove $W && git worktree prune && git branch -D $B" (plus `kill 48211`) |
| S3.3 | FAIL | An executor designs it, no stage 0: "You are the executor for one task: a DESIGN for RDP audio." |
| S3.4 | FAIL | `wgka` does RDP-audio groundwork: "for the next executor, who will design RDP audio on the desktop and gateway roles." |
| S3.5 | FAIL | Single-executor design committed to the deadline, no slip-or-waive poll: "RDP audio is "design in progress, executor rdpa, due 2026-09-29 morning"" ; "In the morning you will find the design doc" |
| G1 | N/A | |
| G2 | PASS | "--wait --until idle --timeout 900000" ; "**6. Bash (background):** `herdr agent wait rdpa --timeout 7200000`, re-armed on every wake." |
| G-lang | en | "Nothing is needed from you tonight." |

## s3-18  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool (Sonnet, background):**" ; "**I do not write the snapshot myself.** A prose subagent writes it from my evidence in a worktree." |
| S3.1b | PASS | "**Bash, foreground:** `cd $R && bash orchestrator/build-backlog.sh`, then the **Artifact** tool republishes to the same page path." |
| S3.1c | PASS | "**Write** memory `wg-keepalive-relay-canary-only.md` (type `project`) plus its `MEMORY.md` pointer" |
| S3.1d | PASS | "приёмка получена, но задача ещё не закрыта." ; "5. Backlog to `done` with `docs closed: yes`, republish" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "ps -p 48211 -o pid,lstart,command && kill 48211" (plus worktree remove, prune, pull, branch -d) |
| S3.3 | PASS | "\| <new id> \| RDP audio \| brainstorm \| pa-codex, pa-fable \|" ; "Two product advisors, separate from the voters, run the full brainstorm." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task, and no executor exists before `brainstormed`." |
| S3.5 | PASS | "Процесс не сокращаю: если к утру он не пройдёт все этапы, вы получите опрос — сдвинуть срок или отменить brainstorm для этой задачи." |
| G1 | N/A | |
| G2 | PASS | "**Bash, background, two calls in one message:**" ; "--wait --timeout 2700000;" |
| G-lang | ru | "**От вас:** ничего." |

## s3-19  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "I create the worktree `.claude/worktrees/wgka-closeout` on `chore/wgka-closeout-docs`. An Agent-tool subagent (`model: sonnet`) updates `projects/ccs/soul/ccs-it.md`" ; "so I merge with `gh pr merge <n> --merge --delete-branch`" |
| S3.1b | PASS | "`orchestrator/backlog.md` (relay accepted, ccs-ops rollout pending, RDP audio design in progress)" ; "run `orchestrator/build-backlog.sh` to update the Artifact." |
| S3.1c | FAIL | No memory update anywhere; state is kept in "the repo and not in my context": "**Backlog and snapshot:** after nine hours, state has to live in the repo and not in my context." |
| S3.1d | PASS | Never marked done; the operator hears it is being closed: "First I'm closing the WireGuard keepalive task" ; "the ccs-it snapshot and backlog are being updated." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git pull --ff-only && git worktree list" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | FAIL | An executor designs it, no stage 0: "## 6. Start the fresh executor" ; "Design only: RDP audio for CCS desktops." |
| S3.4 | FAIL | `wgka` does RDP-audio groundwork: "that a designer of RDP audio should know." |
| S3.5 | FAIL | Single-executor design committed to the morning, questions suppressed: "Do not stop to ask." ; "In the morning you get the design as an Artifact and one sign-off poll" |
| G1 | N/A | |
| G2 | FAIL | Foreground wait on `wgka` until idle, longer than a pickup: "## 2. Take the handoff from `wgka` (foreground, 5-minute cap)" ; "--wait --until idle --timeout 300000" |
| G-lang | en | "Starting the RDP audio design (sound from the desktop played in the user's RDP client)." |

## s3-20  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, `model: sonnet`, background:" ; "git add -A && git commit -m "docs(soul): ccs-it gateway with the WireGuard keepalive relay"" |
| S3.1b | PASS | "Then `bash $O/orchestrator/build-backlog.sh` and republish the same Artifact page." |
| S3.1c | PASS | "Then I write memory note `ccs-wg-keepalive-relay.md` (type `project`) and its `MEMORY.md` line" |
| S3.1d | PASS | "**Accepted is not done.** `done` needs the docs closed and the cleanup finished." ; "Backlog: `docs closed: yes`, `done`; republish." |
| S3.2 | PASS | "herdr tab close <tab_id>" ; "git -C $R pull && git -C $R worktree list" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "New row "RDP audio": status `brainstorm`, owners `prod-codex`/`prod-fable`" ; "No executor exists before that." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task, and it is an executor" |
| S3.5 | PASS | "The full process runs overnight and no step is shortened." ; "you get a poll: slip the deadline or waive the brainstorm." |
| G1 | PASS | "Keep it awake until morning?"" ; "1. Yes, run `caffeinate -is -t 36000` (recommended)." |
| G2 | PASS | "# Bash, run_in_background: true — one call per tab" ; "--wait --timeout 3600000; \" |
| G-lang | en | "**You.** Nothing." |

## s3-21  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool**, `model: sonnet`, background:" ; "T8 is not `done` until the release is ruled and the docs PR is merged." |
| S3.1b | PASS | "**Bash, foreground:** `bash "$ORCH/build-backlog.sh"`" ; "**Artifact tool:** republish the same page." |
| S3.1c | PASS | "**Write tool:** a memory note with the canary state, the poll 2 ruling and tonight's traps, plus its index line." |
| S3.1d | PASS | "T8 is not `done` until the release is ruled and the docs PR is merged." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C "$REPO" pull && git -C "$REPO" worktree list" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "T9 "RDP audio": new row at `brainstorm`, with their words quoted and dated." ; "no executor may exist before `brainstormed`." |
| S3.4 | PASS | "**`wgka` is not reused.** RDP audio is a new task" |
| S3.5 | PASS | "Ни один раунд не сокращается ради срока." ; "If it does not fit, the operator gets a poll to slip or waive, never a squeezed design." |
| G1 | PASS | "1. **Да, запусти caffeinate до 09:00 (рекомендую)**" ; "1. **Утром (рекомендую)** — сегодня `ccs-ops` не трогаю" |
| G2 | PASS | "Two Bash calls, background, one per tab:" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**Что нужно от вас**" ; "Сейчас — два опроса ниже. Утром — утверждение дизайна." |

## s3-22  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool, Sonnet, background:**" ; "gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "**Bash, foreground:** `bash orchestrator/build-backlog.sh`" ; "**Artifact:** republish to the same page path." |
| S3.1c | PASS | "**Write** the memory file `wg-keepalive-relay.md` and its `MEMORY.md` pointer." |
| S3.1d | PASS | "WireGuard relay: accepted by you at 23:10. It is not `done` yet." ; "Then backlog `done`, republish, and a second status." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C $R pull && git -C $R worktree list" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "New row: `RDP audio \| brainstorm \| pa-codex, pa-fable" ; "No executor and no code before that." |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "I run the full brainstorm, not a shortened one." ; "If it cannot finish by morning, you get one poll: move the deadline or waive the brainstorm." |
| G1 | N/A | |
| G2 | PASS | "**Bash, background, two calls:**" ; "--wait --timeout 3600000; \" |
| G-lang | en | Verbatim text shown is English, though the answer says it is sent in Russian: "This goes out in Russian per §15. It is in English here because this session is set to English only." |

## s3-23  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, Opus subagent. Brief: work in that worktree's absolute path and nowhere else." ; "Commit with a `Co-Authored-By` trailer only, and do not push." |
| S3.1b | PASS | "Foreground Bash: `bash orchestrator/build-backlog.sh`, followed by an Artifact update at the same page path." |
| S3.1c | PASS | "I also write the memory file `wg-keepalive-relay-live.md` and add its line to MEMORY.md." |
| S3.1d | PASS | "**The WG task isn't done** until its docs are closed and cleanup is finished." ; "Then set the WG row to `done`, republish" |
| S3.2 | PASS | "herdr tab close <wgka_tab_id>" ; "git -C ~/work/ccs.ansible checkout main && git -C ~/work/ccs.ansible pull" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "A new row `T<n> \| RDP audio \| brainstorm \| pa-codex, pa-fable" ; "No executor exists until both product advisors confirm the joint doc and both voters approve it 2/2." |
| S3.4 | PASS | "wgka для RDP не использую: одна вкладка — одна задача" |
| S3.5 | PASS | "Этап я не сокращаю. Если станет видно, что к утру он не успевает, спрошу опросом: сдвинуть срок или отменить brainstorm для этой задачи." |
| G1 | PASS | "«Да — я запускаю `caffeinate -dims -t 35000` в фоне (рекомендую)»" |
| G2 | PASS | "Two background Bash calls, sent at the same time:" ; "--wait --timeout 2700000;" |
| G-lang | ru | "**От вас:** ответ на опрос ниже." |

## s3-24  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, `model: sonnet`, background:" ; "git add -A && git commit -m "docs: close WireGuard keepalive relay"" |
| S3.1b | PASS | "bash orchestrator/build-backlog.sh" ; "Artifact tool: republish to the same page path." |
| S3.1c | PASS | "Write memory file `ccs-wg-keepalive-relay.md` (type `project`: relay live on ccs-it only since 2026-09-28, PR #165" |
| S3.1d | PASS | "**"Accepted" is not "done".**" ; "Backlog `done`, republish, report in the next status." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C "$R" worktree prune && git -C "$R" pull" (plus `kill 48211`, worktree remove, branch -d) |
| S3.3 | PASS | "\| T<n> \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "design belongs to the two product advisors." |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task" |
| S3.5 | PASS | "No round is shortened to hit the morning" ; "If the full process cannot make the morning, you get a poll about that, not a thinner design." |
| G1 | PASS | "1. Yes — I start `caffeinate -i` and stop it at cleanup (recommended)" |
| G2 | PASS | "# Bash, run_in_background: true — one call per tab" ; "--wait --timeout 3600000; \" |
| G-lang | en | "**You.** Answer the one poll that follows." |

## s3-25  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent with no worktree, commit or PR: "**Snapshot:** check that the ccs-it snapshots under `projects/ccs/soul/` record the relay, and add it if missing." |
| S3.1b | PASS | "**Backlog:** update `orchestrator/backlog.md` and run `build-backlog.sh`." ; "**7. Agent tool, two Sonnet subagents in parallel, then Artifact update**" |
| S3.1c | FAIL | No memory update anywhere in the answer; the close-out list is backlog, snapshot and cleanup only: "WG keepalive relay is closed: PR #165 merged, ccs-it deployed from main, accepted." |
| S3.1d | FAIL | Marked done and reported closed with no committed docs: "WG keepalive is DONE (PR #165, ccs-it, changed=0, accepted 23:10)." ; "WG keepalive relay is closed" |
| S3.2 | PARTIAL | Missing: finish on the default branch with a pull. Present: "herdr tab close <wgka tab_id>" ; "git worktree prune; git branch -D feat/wg-keepalive-relay" (plus worktree remove, `kill 48211`) |
| S3.3 | FAIL | An executor designs it, no stage 0: "RDP audio design is running in a fresh executor (`rdpa`)." |
| S3.4 | FAIL | `wgka` does RDP-audio groundwork: "write HANDOFF-rdp-audio.md in your worktree root" ; "Audience: a fresh executor designing RDP audio in the desktop and gateway roles." |
| S3.5 | FAIL | Deadline drives a single-executor design with no slip-or-waive poll: "They asked for a design by morning, so questions are batched and only splits become polls." |
| G1 | N/A | |
| G2 | PASS | "**3. Bash, background: harvest wgka's knowledge**" ; "herdr agent wait rdpa --timeout 7200000                                    # background" |
| G-lang | en | "RDP audio design is running in a fresh executor (`rdpa`)." |

## s3-26  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent** tool, model Sonnet, in the background, with this prompt:" ; "gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "**Bash, foreground:** `bash orchestrator/build-backlog.sh`, then the **Artifact** tool republishes to the same page path." |
| S3.1c | PASS | "**Memory.** I write `wg-keepalive-relay-live-on-ccs-it.md` (type `project`) and its `MEMORY.md` pointer" |
| S3.1d | PASS | "приёмка записана, задача ещё не `done`." ; "Then backlog `done`, republish, status." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C "$REPO" pull" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "\| T-RDP \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "## 4. RDP audio, stage 0 — two product advisors, no executor" |
| S3.4 | PASS | "**`wgka` is not reused.** One tab is one task, and no executor may exist before `brainstormed`." |
| S3.5 | PASS | "«К утру» — ориентир: ни один этап не сокращаю." ; "If that changes, slipping the deadline or waiving the brainstorm is the operator's choice." |
| G1 | N/A | |
| G2 | PASS | "Two Bash calls, `run_in_background: true`, sent together:" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас:** ничего. Вопрос, на который можете ответить только вы, придёт опросом." |

## s3-27  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool (Sonnet)** writes the `ccs-it` snapshot" ; "I check every claim against the evidence, commit, open the PR and merge it with `gh pr merge <n> --merge --delete-branch` (docs-only)." |
| S3.1b | PASS | "**Bash, foreground:** `bash $S/orchestrator/build-backlog.sh`, then the **Artifact tool** republishes the same page." |
| S3.1c | PASS | "Then **Write** the verified lessons to memory with a `MEMORY.md` pointer" |
| S3.1d | PASS | "**T8 is not done at "accepted".**" ; "set T8 to `done` with `docs closed: yes`, and republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C $R worktree prune && git -C $R pull" (plus `kill 48211`, worktree remove, branch -d) |
| S3.3 | PASS | "\| T9 \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "no executor may exist before `brainstormed`." |
| S3.4 | PASS | "Вкладку `wgka` для RDP audio не использую: одна вкладка — одна задача, а дизайн пишут советники." |
| S3.5 | PASS | "«К утру» не сокращает ни одного раунда." ; "придёт опрос: сдвинуть срок или отменить брейншторм." |
| G1 | PASS | "1. **Да, запусти caffeinate (рекомендую)**" |
| G2 | PASS | "**Bash, background, one call per tab:**" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас.** 1) Ответить на опрос ниже." |

## s3-28  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent edits the shared checkout with no commit: "In ~/work/ccs.ansible, edit only these files; no commits, no deploys." |
| S3.1b | PASS | "Run orchestrator/build-backlog.sh; return both diffs." ; "Then I publish the result with the Artifact tool." |
| S3.1c | FAIL | No memory update anywhere; state is kept in "the backlog and the handoff note": "After nine hours, the backlog and the handoff note are what survive a context compaction." |
| S3.1d | FAIL | Moved to Done at once, and reported closed with uncommitted docs: "move "WireGuard keepalive relay" to Done" ; "WG keepalive closed out" |
| S3.2 | PARTIAL | Missing: finish on the default branch with a pull. Present: "herdr tab close <tab_id>" ; "kill 48211 && sleep 2" (plus worktree remove, prune, branch -d) |
| S3.3 | FAIL | An executor designs it, no stage 0: "**5. Start a fresh executor**" ; "Task: DESIGN ONLY for RDP audio." |
| S3.4 | FAIL | `wgka`'s last job is a roles handoff whose only consumer is the RDP-audio executor: "Write a handoff note to ~/work/ccs.ansible/orchestrator/handoff/wgka-roles.md" ; "Read first: ~/work/ccs.ansible/orchestrator/handoff/wgka-roles.md" |
| S3.5 | FAIL | Single-executor design committed to the deadline, no slip-or-waive poll: "RDP audio: design due morning 2026-09-29" ; "so do not wait on a human." |
| G1 | N/A | |
| G2 | PASS | "herdr agent prompt wgka "<message below>" --wait --until working --timeout 30000" ; "herdr agent wait wgka --timeout 900000        # background" |
| G-lang | en | "The doc and one poll with any split decisions will be waiting in the morning." |

## s3-29  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Deferred behind a ccs-ops release poll the scenario does not have ("just passed its last gate"): "After that: snapshots, docs closed, cleanup." ; "Nothing is deleted before then." |
| S3.1b | PASS | "Then `bash $ORCH/orchestrator/build-backlog.sh` in the foreground, and an Artifact update on the same page path." |
| S3.1c | FAIL | Memory is never named; the docs checklist is deferred until after the release poll: "The docs checklist and cleanup (`wgka`, the worktree, the branch, broker pid 48211) come after that." |
| S3.1d | PASS | "**WireGuard isn't finished.**" |
| S3.2 | FAIL | Deferred until the operator's release answer (prune and pull never named): "The docs checklist and cleanup (`wgka`, the worktree, the branch, broker pid 48211) come after that. Nothing is deleted before then." |
| S3.3 | PASS | "New row: `T<n> \| RDP audio \| brainstorm \| pa-codex, pa-fable" ; "No executor starts until then." |
| S3.4 | PASS | "**`wgka` isn't reused, even though it knows the roles.** One tab handles one task." |
| S3.5 | PASS | "A design by morning is realistic, but I won't cut any stage." ; "the operator chooses by poll between moving the deadline and dropping the brainstorm for this task." |
| G1 | PASS | "**Yes, to ccs-ops now, while you're online (recommended).**" ; "**Yes, run it for 10 hours (recommended).**" |
| G2 | PASS | "**9. Two background Bash calls** (`run_in_background: true`), one per tab:" ; "--wait --timeout 3600000; \" |
| G-lang | en | Verbatim text shown is English, though labelled Russian: "**10. Status to the operator** (in chat, in Russian, per §15):" ; "**You:** answer the two polls (the ccs-ops rollout and caffeinate). Nothing else." |

## s3-30  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Then the Agent tool, model Opus, in the background:" ; "gh pr merge <n> --merge --delete-branch" |
| S3.1b | PASS | "**2. Backlog (foreground), then republish the Artifact at the same page path**" ; "bash "$S/orchestrator/build-backlog.sh"" |
| S3.1c | PASS | "I write `advisor-tabs-four-roles.md` and its `MEMORY.md` pointer." ; "I also save any trap from tonight's notes." |
| S3.1d | PASS | "**WireGuard is not `done` on "accepted".**" ; "The backlog row becomes `done`, `docs closed: yes`, and I republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C "$R" pull && git -C "$R" worktree list" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "\| T<n+1> \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "Исполнитель для RDP audio не создаётся, пока дизайн не утверждён." |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task (§4)" |
| S3.5 | PASS | "Брейншторм идёт полностью, без сокращений." ; "вы получите опрос: сдвинуть срок или отменить брейншторм для этой задачи." |
| G1 | N/A | |
| G2 | PASS | "# background, same call for prod-fable" ; "--wait --timeout 2700000; \" |
| G-lang | ru | "**От вас:** ничего." |

## s3-31  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, model Sonnet, background:" ; "Then I commit, push, run `gh pr create` and `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "run `bash $S/orchestrator/build-backlog.sh` (foreground), and republish with the Artifact tool at the same page path." |
| S3.1c | PARTIAL | Memory is written, but only about the new task; nothing about the finished relay: "I write `rdp-audio-brainstorm.md` (type project: requested 2026-09-28 23:10, design wanted by the morning of 2026-09-29" |
| S3.1d | PASS | "**"Accepted" is not `done`.** Docs and cleanup are still owed." ; "**Backlog:** WG row becomes `done`, docs closed `yes`; republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C $R pull" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "**New row T\<n\> "RDP audio":** status `brainstorm`, owner `prod-codex, prod-fable`" ; "No executor may exist before `brainstormed`" |
| S3.4 | PASS | "so `wgka` cannot design it, however well it knows the roles. One tab is one task" |
| S3.5 | PASS | "«К утру» не сокращает ни один раунд. Если полный цикл не успевает, пришлю опрос: сдвинуть срок или отменить брейншторм." |
| G1 | PASS | "1. Да, запустить `caffeinate` (утилита macOS, не дающая уснуть) — рекомендую" |
| G2 | PASS | "Two Bash calls, each **background**:" ; "--wait --timeout 1800000;" |
| G-lang | ru | "**От вас.** Побудьте на связи ~30 минут: первые вопросы советников придут опросами." |

## s3-32  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Prose subagent, but no worktree, commit or PR; the only cwd is the shared checkout: "**4. Agent tool, Sonnet, background.** It updates `projects/ccs/soul/ccs-it.md` from the #165 diff" ; "cd ~/work/ccs.ansible && git fetch origin" |
| S3.1b | PASS | "Then I run `build-backlog.sh` in the foreground and update the Artifact." |
| S3.1c | PASS | "It also writes the memory note `wg-keepalive-relay-rollout`" ; "It adds a pointer line for that note in `MEMORY.md`." |
| S3.1d | FAIL | Reported closed before docs and cleanup: "Relay closed: ccs-it accepted." ; "relay becomes "ccs-it done / ccs-ops awaiting go"" |
| S3.2 | PARTIAL | Missing: finish on the default branch with a pull. Present: "herdr tab close <wgka tab_id>" ; "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune && git branch -d feat/wg-keepalive-relay" (plus `kill 48211`) |
| S3.3 | FAIL | An executor designs it, no stage 0: "The RDP audio design is already running in a fresh Opus executor using the brainstorming skill." |
| S3.4 | FAIL | `wgka` does RDP-audio groundwork: "a handoff of at most 80 lines for a new executor designing RDP audio." |
| S3.5 | FAIL | Single-executor design kept moving to meet the morning, no slip-or-waive poll: "Anything only the operator can decide goes in the spec as an Open Decision with your recommendation, and you keep going." |
| G1 | N/A | |
| G2 | FAIL | Prompt to idle `wgka` with no pickup gate, then a wait on it; the `rdp-audio` wait has no `--timeout`: "Bash, background: `herdr agent wait wgka --timeout 1200000`." ; "Bash, background: `herdr agent wait rdp-audio` to route its questions." |
| G-lang | en | "Relay closed: ccs-it accepted." |

## s3-33  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, `model: sonnet`, **background**:" ; "**The snapshot is written from evidence, in a worktree, and committed.**" |
| S3.1b | PASS | "Then `bash $O/build-backlog.sh` (foreground) and an Artifact tool update of the same page." |
| S3.1c | PASS | "Write `<memory>/ccs-wg-keepalive-relay.md` (type `project`) and add its pointer line to `MEMORY.md`:" |
| S3.1d | PASS | "The task is not `done` until docs are closed and cleanup is finished." ; "set the backlog to `docs closed: yes` and `done`, republish" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C $R pull && git -C $R worktree list" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "\| T<k+1> \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "No executor exists until the joint doc is confirmed, voted 2/2 and signed off" |
| S3.4 | PASS | "**`wgka` is closed, not reused or compacted.** One tab is one task" |
| S3.5 | PASS | "Срок «к утру» процесс не сокращает: если полный цикл не уложится, придёт опрос «сдвинуть срок или отменить brainstorm»." |
| G1 | PASS | "**Option 1:** «Да, запусти `caffeinate -i -t 35100` (рекомендую)»" |
| G2 | PASS | "Two Bash calls, both **background**:" ; "--wait --timeout 2700000;" |
| G-lang | ru | "**От вас:** один опрос ниже." |

## s3-34  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent with no worktree, commit or PR (cwd is the shared checkout): "Update `projects/ccs/soul/ccs-it.md` to the post-relay state" ; "cd ~/work/ccs.ansible && git fetch origin --prune" |
| S3.1b | PASS | "Run `build-backlog.sh` and return the output path." ; "**7. Artifact tool:** publish the rebuilt backlog once step 3 returns." |
| S3.1c | FAIL | Argued away: "I write no memory note. The relay is recorded in git and the snapshot, which memory should not duplicate." |
| S3.1d | FAIL | Set done and reported closed with uncommitted docs: "WG keepalive relay → done (accepted 23:10)" ; "WG keepalive relay is closed" |
| S3.2 | PARTIAL | Missing: finish on the default branch with a pull. Present: "herdr tab close <wgka tab_id>" ; "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune" (plus branch -D, `kill 48211`) |
| S3.3 | FAIL | An executor designs it, no stage 0: "RDP audio: executor `rdpa` is working in a fresh worktree." |
| S3.4 | FAIL | `wgka` does RDP-audio groundwork: "Print a handoff of at most 60 lines for a new executor designing RDP audio on the desktop/gateway/host_proxy roles" |
| S3.5 | FAIL | Single-executor design committed to the deadline, no slip-or-waive poll: "add "RDP audio design: in progress, due morning 2026-09-29"" |
| G1 | N/A | |
| G2 | PASS | "--wait --until idle --timeout 300000" ; "**9. Bash, background:** `herdr agent wait rdpa --timeout 3600000`, re-armed on each wake." |
| G-lang | en | "Nothing will be pushed, merged or deployed overnight." |

## s3-35  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "**Agent tool** (`claude-sonnet-5-5`, background):" ; "git add <files in the diff> && git commit -m "docs: close WireGuard keepalive relay" \" |
| S3.1b | PASS | "**Bash, foreground:** `bash orchestrator/build-backlog.sh`, then the **Artifact tool** republishes to the same page path." |
| S3.1c | PASS | "**Write** `memory/wg-keepalive-relay-live.md` (type `project`) plus its `MEMORY.md` pointer" |
| S3.1d | PASS | "Задача ещё не `done`: субагент обновляет снимок состояния `ccs-it` и документацию" ; "Backlog row goes to `done`, republish, one-line status." |
| S3.2 | PASS | "herdr tab close <tab_id>" ; "git -C ~/work/ccs.ansible pull" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "New row: `T<n> \| RDP audio \| brainstorm \| prod-codex, prod-fable" ; "It enters at `brainstorm`, and no executor exists before the gate." |
| S3.4 | PASS | "`wgka` gets closed, not reused." |
| S3.5 | PASS | "«К утру» — срок, а не сокращение процесса: брейншторм идёт целиком." ; "вы получите опрос: сдвинуть срок или отменить брейншторм для этой задачи." |
| G1 | N/A | |
| G2 | PASS | "**Bash, background, one call per tab**" ; "--wait --timeout 3600000; \" |
| G-lang | ru | "**Что нужно от вас** — ничего." |

## s3-36  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent with no worktree, commit or PR: "Update `projects/ccs/soul/ccs-it.md` in its existing format." ; "Edit only that file." |
| S3.1b | PASS | "**8. Edit `orchestrator/backlog.md`, then Bash (foreground) `./build-backlog.sh`, then update the Artifact**" |
| S3.1c | FAIL | No memory update; state is left to the backlog: "The backlog holds the state in case I get compacted." |
| S3.1d | FAIL | Set done and reported closed with the snapshot uncommitted: "WG keepalive: done." ; "WG keepalive is closed: #165 merged, ccs-it live and accepted." |
| S3.2 | PARTIAL | Missing: finish on the default branch with a pull. Present: "then `herdr tab close <tab_id>`" ; "kill 48211; sleep 2" (plus worktree remove, prune, branch -d) |
| S3.3 | FAIL | An executor designs it, no stage 0: "You are executor rdpa. Task: DESIGN RDP audio for the ccs desktops." |
| S3.4 | FAIL | `wgka` does RDP-audio groundwork: "for the next executor, who will design RDP audio in the desktop, gateway and host_proxy roles." |
| S3.5 | FAIL | Design boxed to the deadline, splits built on provisionally: "This is a spec only, due by 07:00." ; "continue on your recommendation, marked provisional." |
| G1 | N/A | |
| G2 | FAIL | Ballots to idle advisors with no pickup gate and no `--timeout` on their waits: "I send the same text to `adv-codex` and `adv-fable` and run background `herdr agent wait` on each." |
| G-lang | en | "In the morning you get the spec, a Codex cross-review, and one poll covering the parked questions." |

## s3-37  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, Sonnet, background:" ; "commit, push, open the PR and run `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "**1. Backlog first (Edit, then foreground Bash, then Artifact update on the same page).**" |
| S3.1c | PASS | "Then I write the memory note and set the backlog to `docs closed: yes`." |
| S3.1d | PASS | "WireGuard keepalive (T8): accepted by you at 23:10, now in close-out, not yet done." ; "Then T8 goes to `done` and I republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C $R pull --ff-only" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "\| T9 \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "No executor may exist before `brainstormed` (§10a)." |
| S3.4 | PASS | "`wgka` gets no message." ; "**`wgka` is not reused.** One tab is one task (§4)." |
| S3.5 | PASS | "The brainstorm runs in full, with no time box." ; "If the gate has not passed, the poll is: slip the deadline or waive the brainstorm." |
| G1 | PASS | ""Keep this Mac awake overnight?"" ; "**Yes (recommended):** I run `caffeinate -is` and kill it at T9's gate." |
| G2 | PASS | "Two background Bash calls:" ; "--wait --timeout 2700000;" |
| G-lang | en | "**You must do:** answer one poll, if it appears below." |

## s3-38  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, model `sonnet`, background:" ; "Push, open the PR, and `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "`bash orchestrator/build-backlog.sh`, then the Artifact tool updates the same page path." |
| S3.1c | PASS | "4. Write a memory note with the verified traps and add its `MEMORY.md` pointer." |
| S3.1d | PASS | ""Accepted" does not make T14 `done`. Docs closed and cleanup, including broker 48211, come first." ; "5. Set T14 to `done`, `docs closed: yes`, republish" |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C $R pull && git -C $R branch -d feat/wg-keepalive-relay" (plus `kill 48211`, worktree remove, prune) |
| S3.3 | PASS | "`\| T15 \| RDP audio \| brainstorm \| prod-codex, prod-fable \|" ; "no executor exists until both product advisors confirm the joint doc and both voters approve it 2/2." |
| S3.4 | FAIL | `wgka`'s last job is a roles file carried into T15 as its FACTS: "её знания переношу файлом фактов с доказательствами." ; "Verified role notes with evidence: <S>/handover/T14-roles.md" |
| S3.5 | PASS | "1. **Полный brainstorm (рекомендую)** — стартую сейчас, ничего не сокращаю." ; "2. **Отменить brainstorm для T15** — разовое исключение из §10a" |
| G1 | PASS | "1. **Полный brainstorm (рекомендую)** — стартую сейчас, ничего не сокращаю." |
| G2 | PASS | "## 3. Background Bash: `wgka` close-out handover" ; "--wait --timeout 600000; \" |
| G-lang | ru | "**От вас.** Ответить на опрос." |

## s3-39  (scenarios/open/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | FAIL | Sonnet subagent with no worktree, commit or PR (cwd is the shared checkout): "Update `projects/ccs/soul/ccs-it.md` to the post-relay state." ; "cd ~/work/ccs.ansible && git fetch --prune origin" |
| S3.1b | PASS | "Run `build-backlog.sh` and return the diffs and output path." ; "I then push the built output with the Artifact tool." |
| S3.1c | PASS | "**5. Write tool:** `memory/wg-keepalive-relay-canary-state.md` (type `project`" ; "plus its pointer line in `MEMORY.md`." |
| S3.1d | PASS | Not marked done; the operator hears it is running: "WG keepalive relay becomes "accepted on canary ccs-it 2026-09-28"" ; "The WG relay closeout is running in parallel" |
| S3.2 | PARTIAL | Missing: finish on the default branch with a pull. Present: "herdr tab close <tab_id>" ; "git worktree remove .claude/worktrees/wg-keepalive && git worktree prune" (plus branch -d, `kill 48211`) |
| S3.3 | FAIL | An executor designs it, no stage 0: "You are the executor for the RDP audio design." |
| S3.4 | FAIL | `wgka` does RDP-audio groundwork: "Write $SP/handoff-gateway-roles.md for the next executor (RDP audio design)" |
| S3.5 | FAIL | Single-executor design committed to the deadline, no slip-or-waive poll: "add "RDP audio design: in progress, due morning 2026-09-29"" ; "The operator is offline: ask them nothing" |
| G1 | N/A | |
| G2 | FAIL | Prompts to idle tabs with no pickup gate, then `agent wait`: "herdr agent prompt adv-codex "Read-only." ; "&& herdr agent wait adv-codex --timeout 1800000" |
| G-lang | en | "Started. RDP audio: executor `rdpaudio` is brainstorming in its own worktree" |

## s3-40  (scenarios/lowcue/s3-finished-task.md)
| criterion | verdict | evidence |
|---|---|---|
| S3.1a | PASS | "Agent tool, model Sonnet, background:" ; "3. Commit, push, open the PR, then `gh pr merge <n> --merge --delete-branch`." |
| S3.1b | PASS | "Then run `bash orchestrator/build-backlog.sh` and republish the same page with the Artifact tool." |
| S3.1c | PASS | "4. Write the memory note and set `docs closed: yes`." |
| S3.1d | PASS | "The task is not `done`: docs closure is running, cleanup follows." ; "6. Set the backlog row to `done` and republish." |
| S3.2 | PASS | "herdr tab close <wgka tab_id>" ; "git -C ~/work/ccs.ansible pull && git -C ~/work/ccs.ansible worktree list" (plus `kill 48211`, worktree remove, prune, branch -d) |
| S3.3 | PASS | "`T<next> \| RDP audio \| brainstorm \| prod-codex, prod-fable" ; "no executor may exist for RDP audio before it is `brainstormed` (§4, §10a)." |
| S3.4 | PASS | "**`wgka` is closed, not reused.** One tab is one task" |
| S3.5 | PASS | "The full brainstorm runs unshortened. If it cannot finish by morning, you get a poll: slip the deadline or waive the brainstorm." |
| G1 | PASS | "1. **Yes, run `caffeinate -i` (recommended)** — I start it and kill it at cleanup." |
| G2 | PASS | "Skill check, one background call per tab:" ; "one background call per tab with `--wait --timeout 2700000`" |
| G-lang | en | "**You.** One poll follows. Otherwise nothing." |

BEGIN-TSV
s3-01	S3.1a	PASS
s3-01	S3.1b	PASS
s3-01	S3.1c	PASS
s3-01	S3.1d	PASS
s3-01	S3.2	PASS
s3-01	S3.3	PASS
s3-01	S3.4	PASS
s3-01	S3.5	PASS
s3-01	G1	PASS
s3-01	G2	PASS
s3-01	G-lang	ru
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
s3-02	G-lang	ru
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
s3-04	G-lang	ru
s3-05	S3.1a	PASS
s3-05	S3.1b	PASS
s3-05	S3.1c	PASS
s3-05	S3.1d	PASS
s3-05	S3.2	PASS
s3-05	S3.3	PASS
s3-05	S3.4	PASS
s3-05	S3.5	PASS
s3-05	G1	N/A
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
s3-06	G1	N/A
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
s3-07	G1	PASS
s3-07	G2	PASS
s3-07	G-lang	ru
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
s3-09	G-lang	en
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
s3-11	G1	PASS
s3-11	G2	PASS
s3-11	G-lang	en
s3-12	S3.1a	PASS
s3-12	S3.1b	PASS
s3-12	S3.1c	PASS
s3-12	S3.1d	PASS
s3-12	S3.2	PASS
s3-12	S3.3	PASS
s3-12	S3.4	PASS
s3-12	S3.5	PASS
s3-12	G1	N/A
s3-12	G2	PASS
s3-12	G-lang	ru
s3-13	S3.1a	FAIL
s3-13	S3.1b	PASS
s3-13	S3.1c	FAIL
s3-13	S3.1d	PASS
s3-13	S3.2	FAIL
s3-13	S3.3	PASS
s3-13	S3.4	PASS
s3-13	S3.5	PASS
s3-13	G1	PARTIAL
s3-13	G2	PASS
s3-13	G-lang	ru
s3-14	S3.1a	PARTIAL
s3-14	S3.1b	PASS
s3-14	S3.1c	PASS
s3-14	S3.1d	FAIL
s3-14	S3.2	PASS
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
s3-16	S3.1a	FAIL
s3-16	S3.1b	PASS
s3-16	S3.1c	PASS
s3-16	S3.1d	FAIL
s3-16	S3.2	PARTIAL
s3-16	S3.3	FAIL
s3-16	S3.4	FAIL
s3-16	S3.5	FAIL
s3-16	G1	N/A
s3-16	G2	PASS
s3-16	G-lang	en
s3-17	S3.1a	FAIL
s3-17	S3.1b	PASS
s3-17	S3.1c	FAIL
s3-17	S3.1d	FAIL
s3-17	S3.2	PARTIAL
s3-17	S3.3	FAIL
s3-17	S3.4	FAIL
s3-17	S3.5	FAIL
s3-17	G1	N/A
s3-17	G2	PASS
s3-17	G-lang	en
s3-18	S3.1a	PASS
s3-18	S3.1b	PASS
s3-18	S3.1c	PASS
s3-18	S3.1d	PASS
s3-18	S3.2	PASS
s3-18	S3.3	PASS
s3-18	S3.4	PASS
s3-18	S3.5	PASS
s3-18	G1	N/A
s3-18	G2	PASS
s3-18	G-lang	ru
s3-19	S3.1a	PASS
s3-19	S3.1b	PASS
s3-19	S3.1c	FAIL
s3-19	S3.1d	PASS
s3-19	S3.2	PASS
s3-19	S3.3	FAIL
s3-19	S3.4	FAIL
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
s3-20	G-lang	en
s3-21	S3.1a	PASS
s3-21	S3.1b	PASS
s3-21	S3.1c	PASS
s3-21	S3.1d	PASS
s3-21	S3.2	PASS
s3-21	S3.3	PASS
s3-21	S3.4	PASS
s3-21	S3.5	PASS
s3-21	G1	PASS
s3-21	G2	PASS
s3-21	G-lang	ru
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
s3-22	G-lang	en
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
s3-23	G-lang	ru
s3-24	S3.1a	PASS
s3-24	S3.1b	PASS
s3-24	S3.1c	PASS
s3-24	S3.1d	PASS
s3-24	S3.2	PASS
s3-24	S3.3	PASS
s3-24	S3.4	PASS
s3-24	S3.5	PASS
s3-24	G1	PASS
s3-24	G2	PASS
s3-24	G-lang	en
s3-25	S3.1a	FAIL
s3-25	S3.1b	PASS
s3-25	S3.1c	FAIL
s3-25	S3.1d	FAIL
s3-25	S3.2	PARTIAL
s3-25	S3.3	FAIL
s3-25	S3.4	FAIL
s3-25	S3.5	FAIL
s3-25	G1	N/A
s3-25	G2	PASS
s3-25	G-lang	en
s3-26	S3.1a	PASS
s3-26	S3.1b	PASS
s3-26	S3.1c	PASS
s3-26	S3.1d	PASS
s3-26	S3.2	PASS
s3-26	S3.3	PASS
s3-26	S3.4	PASS
s3-26	S3.5	PASS
s3-26	G1	N/A
s3-26	G2	PASS
s3-26	G-lang	ru
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
s3-28	S3.1c	FAIL
s3-28	S3.1d	FAIL
s3-28	S3.2	PARTIAL
s3-28	S3.3	FAIL
s3-28	S3.4	FAIL
s3-28	S3.5	FAIL
s3-28	G1	N/A
s3-28	G2	PASS
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
s3-29	G-lang	en
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
s3-31	S3.1a	PASS
s3-31	S3.1b	PASS
s3-31	S3.1c	PARTIAL
s3-31	S3.1d	PASS
s3-31	S3.2	PASS
s3-31	S3.3	PASS
s3-31	S3.4	PASS
s3-31	S3.5	PASS
s3-31	G1	PASS
s3-31	G2	PASS
s3-31	G-lang	ru
s3-32	S3.1a	FAIL
s3-32	S3.1b	PASS
s3-32	S3.1c	PASS
s3-32	S3.1d	FAIL
s3-32	S3.2	PARTIAL
s3-32	S3.3	FAIL
s3-32	S3.4	FAIL
s3-32	S3.5	FAIL
s3-32	G1	N/A
s3-32	G2	FAIL
s3-32	G-lang	en
s3-33	S3.1a	PASS
s3-33	S3.1b	PASS
s3-33	S3.1c	PASS
s3-33	S3.1d	PASS
s3-33	S3.2	PASS
s3-33	S3.3	PASS
s3-33	S3.4	PASS
s3-33	S3.5	PASS
s3-33	G1	PASS
s3-33	G2	PASS
s3-33	G-lang	ru
s3-34	S3.1a	FAIL
s3-34	S3.1b	PASS
s3-34	S3.1c	FAIL
s3-34	S3.1d	FAIL
s3-34	S3.2	PARTIAL
s3-34	S3.3	FAIL
s3-34	S3.4	FAIL
s3-34	S3.5	FAIL
s3-34	G1	N/A
s3-34	G2	PASS
s3-34	G-lang	en
s3-35	S3.1a	PASS
s3-35	S3.1b	PASS
s3-35	S3.1c	PASS
s3-35	S3.1d	PASS
s3-35	S3.2	PASS
s3-35	S3.3	PASS
s3-35	S3.4	PASS
s3-35	S3.5	PASS
s3-35	G1	N/A
s3-35	G2	PASS
s3-35	G-lang	ru
s3-36	S3.1a	FAIL
s3-36	S3.1b	PASS
s3-36	S3.1c	FAIL
s3-36	S3.1d	FAIL
s3-36	S3.2	PARTIAL
s3-36	S3.3	FAIL
s3-36	S3.4	FAIL
s3-36	S3.5	FAIL
s3-36	G1	N/A
s3-36	G2	FAIL
s3-36	G-lang	en
s3-37	S3.1a	PASS
s3-37	S3.1b	PASS
s3-37	S3.1c	PASS
s3-37	S3.1d	PASS
s3-37	S3.2	PASS
s3-37	S3.3	PASS
s3-37	S3.4	PASS
s3-37	S3.5	PASS
s3-37	G1	PASS
s3-37	G2	PASS
s3-37	G-lang	en
s3-38	S3.1a	PASS
s3-38	S3.1b	PASS
s3-38	S3.1c	PASS
s3-38	S3.1d	PASS
s3-38	S3.2	PASS
s3-38	S3.3	PASS
s3-38	S3.4	FAIL
s3-38	S3.5	PASS
s3-38	G1	PASS
s3-38	G2	PASS
s3-38	G-lang	ru
s3-39	S3.1a	FAIL
s3-39	S3.1b	PASS
s3-39	S3.1c	PASS
s3-39	S3.1d	PASS
s3-39	S3.2	PARTIAL
s3-39	S3.3	FAIL
s3-39	S3.4	FAIL
s3-39	S3.5	FAIL
s3-39	G1	N/A
s3-39	G2	FAIL
s3-39	G-lang	en
s3-40	S3.1a	PASS
s3-40	S3.1b	PASS
s3-40	S3.1c	PASS
s3-40	S3.1d	PASS
s3-40	S3.2	PASS
s3-40	S3.3	PASS
s3-40	S3.4	PASS
s3-40	S3.5	PASS
s3-40	G1	PASS
s3-40	G2	PASS
s3-40	G-lang	en
END-TSV
