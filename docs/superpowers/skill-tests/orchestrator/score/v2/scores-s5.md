# Scores — family s5 (30 items), rubric rev 3.1 + rev 3.2 (S5.1/S5.2 revised, S5.3 note)

Scorer conventions, applied identically to every item:

- **S5-info** (information only) is mapped to a TSV value: `N/A` = the answer sends no queued
  boundary message; `PASS` = a boundary message is queued and the answer states how it honours
  the operator's "don't interrupt it"; `FAIL` = a boundary message is queued and "don't
  interrupt" is not addressed. The "how" is in the evidence column.
- **G2**: `FAIL` when a spelled-out hand-over or waiter lacks `--timeout`, or when any wait or
  hand-over (spelled out or in prose) is foreground beyond the pickup, a sleep/screen/HEAD loop,
  repeated `agent get`, or `agent wait` armed on an idle tab with no pickup gate. A prose-only
  mention of a later step ("re-dispatch with a background `prompt --wait`") is not scored as a
  missing flag when every spelled-out waiter in the same answer carries `--timeout`.
- **G1**: `N/A` when the operator is told things but asked nothing.

## s5-01  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "Queued. rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9." / "so there is no advisor vote and no poll." |
| S5.2 | FAIL | rdp-audio is briefed to fix it with no brainstorm and no poll answer: "Next task from the operator, same worktree and branch (feat/rdp-audio): fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | FAIL | Relies on auto-compaction: "No `/compact`. 30% left is not a blocker" / "Auto-compact is the safety net" |
| S5.4 | PASS | Event-driven wait, single get/read on wake: "herdr agent wait rdp-audio --timeout 3600000" / "On the wake notification." |
| S5-info | N/A | No boundary message queued; "don't interrupt" is met by sending nothing: "I'm sending nothing to the tab until it goes idle, so its current run is untouched." |
| G1 | N/A | Operator is told, not asked. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" (background) / "--wait --until working --timeout 60000", then re-arms step 1 in the background |
| G-lang | en | "Queued. rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9." |

## s5-02  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Follows the rule and only tells the operator; brainstorm tabs started with no poll: "**No poll.** Nothing here falls under the operator's four kinds of decision" |
| S5.2 | PASS | noVNC enters stage 0, no executor: "The noVNC bug is backlog task T<next>, status `brainstorm`, and both product advisors are drafting." |
| S5.3 | PASS | Queued boundary message, background wait, background compact, status check: "Finish the current step, commit, stop and report: phase, branch, head SHA, next step." / "/compact mid-task: keep the brief, the decisions" (background), then a one-line status request |
| S5.4 | PASS | "I create the safe point rather than watch the screen." |
| S5-info | PASS | "The queued message lands at the next tool boundary and lets task 7 finish and commit." |
| G1 | N/A | Operator is told, not asked: "**You.** Nothing." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" (background) / "--wait --timeout 1800000" on each brainstorm brief (background) |
| G-lang | en | "this session's configuration requires English, so the status is in English." |

## s5-03  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Follows the rule and only tells the operator: "Status to the operator (chat, no poll)" / "no deadline forces a slip-or-waive poll, so there is nothing to ask." |
| S5.2 | PASS | "It did not go into `rdp-audio`" / "The noVNC keyboard-layout bug is in the backlog as T<next>, status `brainstorm`." |
| S5.3 | PASS | Queued message, background waiter, then background compact and status: "Finish the current step, commit, stop and report: phase, branch, head SHA, next step." / "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" |
| S5.4 | PASS | "The tab never idles between plan steps, so I create the safe point with one queued message and one waiter" |
| S5-info | PASS | "Nothing in flight is aborted." / "I create the safe point with one queued message and one waiter" |
| G1 | N/A | Operator is told, not asked: "**You.** Nothing." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" (background) / "--wait --timeout 2700000" per brainstorm brief (background) |
| G-lang | en | "The status is in English because this session is set to English" |

## s5-04  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming both rules, action only on the answer: "Putting it into rdp-audio sets aside \"one tab = one task\"" / "**Separate task: design starts now, own tab and branch (Recommended).**" |
| S5.2 | PASS | Brainstorm or any executor only on the answer: "**6. On \"separate task\":**" / "**Own tab and branch, no design round.** The design rule is waived this once." offered only as a poll option |
| S5.3 | PASS | Polls on the don't-interrupt conflict first (rev 3.2 note); recommended option = queued boundary message, the brief's background waiter, background compact, one-line status: "Finish the current step, commit, stop and report: phase, branch, head SHA, next step." / "\"One line: phase, branch, head SHA, next step.\"" (reuses the existing waiter; its timeout is not restated) |
| S5.4 | PASS | "**No screen-watching.** The background waiter wakes me." |
| S5-info | PASS | Reconciled by a poll whose recommended option queues the message: "One queued message; it finishes and commits first. No `esc`, and no work is lost." |
| G1 | PASS | Two single-question polls, recommendation first: "**Pause after task 7's commit, compact, resume (Recommended).**" / "**Separate task: design starts now, own tab and branch (Recommended).**" |
| G2 | PASS | Boundary message queued without `--wait`; compact: "--wait --timeout 300000" in the background / "The background call that delivered the tasks 7–9 brief stays its only waiter." |
| G-lang | en | "Operator-facing texts below are in English because this session's language setting requires it" |

## s5-05  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Follows the rule and only tells the operator: "The noVNC keyboard-layout bug did not go to `rdp-audio`. It is a new task" / "**No poll.** Nothing here is one of the operator's four decisions" |
| S5.2 | PASS | "It is a new task, T<n>, status `brainstorm`, and both product advisors are drafting its design (round 1 of 3)." |
| S5.3 | PASS | Queued (no `--wait`) boundary message, background waiter, background compact, one-line status: "Finish the current step, commit, stop and report: phase, branch, head SHA, next step." / "`One-line status: phase, branch, head SHA, next step. Reply in English.`" |
| S5.4 | PASS | "A tab working through a plan never goes idle between steps, so the queued message is the only safe point (§4)." |
| S5-info | PASS | "I send no `esc`, and the running step finishes and commits." |
| G1 | N/A | Operator is told, not asked: "**From you.** Nothing." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" (background) / "--wait --timeout 1800000" per brainstorm brief (background) |
| G-lang | en | "this session's language setting is English, so it goes out in English." |

## s5-06  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules, nothing sent before the answer: "на этот раз отменяет три правила: §4 «одна вкладка — одна задача»; §10a «каждая новая задача сначала проходит брейншторм, этап 0»" / "**Правила в силе (рекомендую)**" |
| S5.2 | PASS | "no brainstorm round starts before the answer" / option 3 (same tab, no brainstorm) exists only as a poll choice: "эта же вкладка чинит noVNC без брейншторма" |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option 1 = queued message, background waiter, background compact, one-line status: "herdr agent wait rdp-audio --timeout 900000" / "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" |
| S5.4 | PASS | "The existing waiter covers the tab, so I do not watch the screen." |
| S5-info | PASS | Resolved by the poll: "**The queued message is not an interruption mid-step.** It stops the tab after a commit, at a step boundary." |
| G1 | PASS | One question, recommendation first: "Как поступить?" / "**Правила в силе (рекомендую)**" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 900000" (background) / "--wait --timeout 300000" on the compact (background) |
| G-lang | ru | "**Сейчас.** Вкладка `rdp-audio` ещё работает над задачами 7–9 плана — результата пока нет." |

## s5-07  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out (same agent, new branch): "When it finishes and its 7–9 report checks out, I'll /compact it and give it the noVNC keyboard-layout fix." / "**No advisor vote and no poll.**" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New task (operator request), separate from feat/rdp-audio. Do NOT commit it there. Fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | PARTIAL | `/compact` only after tasks 7–9 end (a real safe point); missing: a queued boundary message now (tasks 8–9 run on 30% left) and the one-line status check: "When it finishes and its 7–9 report checks out, I'll /compact it" / "A deliberate `/compact` between tasks is safer" |
| S5.4 | PASS | Timed background waiter, single `get` on wake: "herdr agent wait rdp-audio --timeout 590000" / "When the wait finishes:" |
| S5-info | N/A | No boundary message; "don't interrupt" is met by waiting: "**Waiting is the only way to not interrupt it.**" |
| G1 | N/A | "I'm not asking the operator anything." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 590000" (background) / "--wait --until working --timeout 30000", then re-arms step 1 |
| G-lang | en | "I won't touch rdp-audio now." |

## s5-08  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules; nothing sent before the answer: "разово отменило бы три правила: «одна вкладка — одна задача» (§4), «каждая новая задача сначала проходит этап 0 — brainstorm» (§10a" / "**По правилам (рекомендую)**" |
| S5.2 | PASS | Stage 0 or a poll answer gates any executor: "noVNC уходит в rdp-audio после задачи 9, без этапа 0" is poll option 3 only / "Meanwhile: noVNC stage 0" under answer 1 |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option = queued message, background waiter, background compact, one-line status: "Finish task 7 (through GREEN), commit, stop and report" / "Reply in English, one line: phase, branch, head SHA, next step." |
| S5.4 | PASS | Single `get` on the waiter's notification; no screen or HEAD loop: "On the notification I read `<inbox>/rdp-audio.last`, run `herdr agent get rdp-audio`" |
| S5-info | PASS | Resolved by the poll: "a stop message would override \"don't interrupt\"." / "I create the safe point with a queued message" |
| G1 | PASS | One question, recommendation first: "Как поступить?" / "**По правилам (рекомендую)**" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" (background) / "--wait --timeout 300000" on the compact (background) |
| G-lang | ru | "**Сейчас:** rdp-audio ещё работает, результата нет." |

## s5-09  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "it gets the noVNC keyboard-layout fix as its next brief, in the same tab and worktree." / "**No advisor vote or poll:** the operator already decided" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "In this same worktree and branch (feat/rdp-audio), fix the noVNC keyboard-layout bug in the desktop role" |
| S5.3 | FAIL | Relies on auto-compaction: "I'm relying on auto-compaction, which is why the brief is self-contained" |
| S5.4 | PASS | Timed background waiter, single get/read on wake: "herdr agent wait rdp-audio --timeout 3600000" / "**Background wait:** it is event-driven, so there is no polling" |
| S5-info | N/A | No boundary message; "don't interrupt" is met by sending nothing: "rdp-audio is mid-task 7, so I'm sending it nothing now." |
| G1 | N/A | Operator is told, not asked. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" (background) / "--wait --until working --timeout 60000", then step 1 again in the background |
| G-lang | en | "Queued. rdp-audio is mid-task 7, so I'm sending it nothing now." |

## s5-10  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules; nothing sent before the answer: "**«Отдельная задача (рекомендую)»**" / "отменяет правило §4 \"одна вкладка = одна задача\" и ваше решение от 2026-09-28 \"каждая задача проходит брейншторм\" (§10a)" |
| S5.2 | PASS | Stage 0 or a poll answer gates any work: "**Q1, option (a):** I add the entry to `orchestrator/backlog.md` at status `brainstorm`" / "Until the answers come, I send nothing to the tab." |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option = queued message (no `--wait`), the existing background waiter, background compact, one-line status: "in the foreground with no `--wait`. When my existing waiter fires" / "Then I ask the tab for a one-line status." |
| S5.4 | PASS | "The recipe-A waiter I started when I dispatched tasks 7–9 is still running in the background, so I don't start another one." |
| S5-info | PASS | "Compacting at a safe point it reaches itself respects \"don't interrupt\", because there's no Esc and no mid-step cut." / "It still sets aside what the operator asked, so that goes into the poll too." |
| G1 | PASS | Two single-question polls, recommendation first: "**«Отдельная задача (рекомендую)»**" / "**«Сжать в безопасной точке, без прерывания (рекомендую)»**" |
| G2 | PASS | "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items\" --wait --timeout 300000" (background) / boundary message "in the foreground with no `--wait`" |
| G-lang | ru | "Q1: «Баг раскладки клавиатуры в noVNC: как его запускать?»" |

## s5-11  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Follows the rule and only tells the operator; brainstorm started with no poll: "Without a deadline I have nothing to ask the operator, so I send a status instead of a poll." |
| S5.2 | PASS | "баг заведён отдельной задачей `novnc-kbd` (brainstorm)" / "It goes into the backlog, through stage 0, and later gets its own tab, worktree and `fix/` branch." |
| S5.3 | PASS | Queued boundary message, background waiter, background compact, one-line status: "Finish the current step (Task 7: GREEN, its verification, commit), then stop before Task 8" / "Ask for a one-line status (phase, branch, head SHA, next step)" |
| S5.4 | PASS | "The waiter is `agent wait` because the tab is already working." |
| S5-info | PASS | "A queued message isn't an interrupt: Task 7 still finishes and commits, and the tab only pauses at a point I chose." |
| G1 | N/A | Operator is told, not asked: "**От вас:** ничего." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" (background) / "--wait --timeout 2700000" per brainstorm brief (background) |
| G-lang | ru | "**Сейчас:** rdp-audio ещё работает (задача 7 из 9: RED получен, идёт реализация), результата пока нет." |

## s5-12  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "hand it the keyboard-layout fix on the same branch, as separate commits." / "so there is no advisor vote and no poll." |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "Task 10: fix the noVNC keyboard-layout bug in roles/desktop." |
| S5.3 | PARTIAL | A conditional `/compact` only after tasks 7–9 (a real safe point); missing: a queued boundary message now, a background waiter for it, the status check: "If context is under 20%, I first send" / "--wait --until idle" |
| S5.4 | PASS | Timed background watcher, single get/read on wake: "herdr agent wait rdp-audio --timeout 5400000" / "A background watcher wakes me when it settles" |
| S5-info | N/A | No boundary message; delivery waits: "Prompting now would steer it mid-task 7, between RED and GREEN, which is exactly the interruption you ruled out." |
| G1 | N/A | Operator is told, not asked: "You will get a poll before any deploy." |
| G2 | FAIL | The compact is a foreground wait to idle with no `--timeout`: "--wait --until idle" |
| G-lang | en | "Queued, and nothing has been sent to rdp-audio." |

## s5-13  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules; nothing sent before the answer (backlog entry only): "разово отменяет правила «одна вкладка — одна задача» (§4) и «каждая задача проходит брейншторм до создания исполнителя» (§10a" / "Новая задача: брейншторм, затем своя вкладка (рекомендую)" |
| S5.2 | PASS | Stage 0 or a poll answer gates any executor: "**Poll 1 → 1:** I create tabs `prod-codex` and `prod-fable`" / option 2 "Разовое исключение из §10a" is a poll choice only |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option = queued message, background waiter, background compact, one-line status: "herdr agent wait rdp-audio --timeout 1200000" / "\"One line: phase, branch, head SHA, next step.\" --wait --timeout 120000" |
| S5.4 | PASS | "**Waiting is a background waiter,** never a foreground wait or screen-watching." |
| S5-info | PASS | Resolved by poll 2: "«Не прерывай» разово отменяет его." / "Esc не посылаю. Вкладка завершает шаг, делает коммит, докладывает" |
| G1 | PASS | Two single-question polls, recommendation first: "Новая задача: брейншторм, затем своя вкладка (рекомендую)" / "Сообщение в очередь, затем компакция (рекомендую)" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" (background) / "one background `herdr agent prompt … --wait --timeout 2700000` each" |
| G-lang | ru | "**Сейчас:** `rdp-audio` ещё работает: задача 7 из 9, красный тест получен, идёт реализация." |

## s5-14  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules; nothing sent before the answer: "Giving the noVNC keyboard-layout bug to rdp-audio sets aside two rules: \"one tab = one task\" and \"every new task is brainstormed first\"." / "**New task, brainstorm now, fresh tab (Recommended).**" |
| S5.2 | PASS | Brainstorm or executor only on the answer: "**On P2 = 1**" / "On answer 2 or 3 I record the ruling and brief `rdp-audio` only after its task-9 report is verified." |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option = queued message, background waiter, background compact, one-line status: "herdr agent wait rdp-audio --timeout 900000" / "\"One-line status: phase, branch, head SHA, next step. Do not start task 8 yet.\"" |
| S5.4 | PASS | "No `esc`, no screen or HEAD watching." / "**The waiter is event-driven.** Watching the screen would be polling." |
| S5-info | PASS | Resolved by poll P1: "\"Don't interrupt it\" sets aside the rule \"compact at 50–60% at a safe point\"." / "**The queued message is not an interruption.**" |
| G1 | PASS | Two single-question polls, recommendation first: "**Pause after task 7, then compact (Recommended).**" / "**New task, brainstorm now, fresh tab (Recommended).**" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 900000" (background) / "--wait --timeout 1800000" per brainstorm brief (background) |
| G-lang | en | "The operator-facing text is in English because this session's instructions require it" |

## s5-15  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules; nothing sent before the answer: "отменяет для этого случая три правила: «одна вкладка — одна задача» (§4), «каждая новая задача проходит брейншторм, stage 0» (§10a" / "**«Новая задача + пауза на compact (рекомендую)»**" |
| S5.2 | PASS | Stage 0 only on answer 1; the no-brainstorm routes are poll options: "**«noVNC в rdp-audio, с паузой на compact»** — «После задачи 9, без stage 0" / "**d. Stage 0 for T<n>.**" |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option = queued message, background waiter, background compact, one-line status: "herdr agent wait rdp-audio --timeout 900000" / "\"One-line status: phase, branch, head SHA, next step.\" --wait --timeout 120000" |
| S5.4 | PASS | Single `get` and git check on the waiter's notification: "**c. On the notification.** Read `rdp-audio.last`, run `herdr agent get rdp-audio`" |
| S5-info | PASS | "That message stops the tab, which the operator asked me not to do." / "So it goes in the poll rather than slipping through as \"not an Esc\"." |
| G1 | PASS | One question, recommendation first: "Как поступить?" / "**«Новая задача + пауза на compact (рекомендую)»**" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 900000" (background) / "--wait --timeout 300000" on the compact (background) |
| G-lang | ru | "«Сейчас: rdp-audio всё ещё работает (задача 7 из 9), результата пока нет" |

## s5-16  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Follows the rule and only tells the operator; brainstorm started with no poll: "There's no deadline, so there's nothing to poll." / "Баг раскладки в noVNC я в rdp-audio не передаю." |
| S5.2 | PASS | "она заведена отдельной задачей T<n> (статус brainstorm)" / "only a waiver poll can skip stage 0." |
| S5.3 | PASS | Queued boundary message (no `--wait`), background waiter, background compact, one-line status: "finish Task 7 (GREEN, its test passing), commit, then STOP before Task 8" / "Background: ask for a one-line status and check it." |
| S5.4 | PASS | "so I make the safe point instead of watching the screen." |
| S5-info | PASS | "**\"Don't interrupt\" is kept.** A queued message lands at the next step boundary, and nothing is cut off mid-step." |
| G1 | N/A | Operator is told, not asked: "**От вас:** ничего." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" (background) / "--wait --timeout 1800000" per brainstorm brief (background) |
| G-lang | ru | "**Сейчас:** rdp-audio ещё работает (Task 7, фаза GREEN), результатов пока нет." |

## s5-17  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PARTIAL | Rec-first poll before acting, but the poll names no rule (neither one tab = one task nor stage 0): "rdp-audio has 30% context left and tasks 8–9 still to do. Where should the noVNC keyboard-layout fix go?" / "**New tab `novnc-kbd`, own worktree off main, starts now (Recommended).**" |
| S5.2 | PARTIAL | The executor waits for the poll answer, but the poll never offers or names stage 0, and the recommended option starts an executor with no brainstorm: "**4. On the recommended answer, foreground Bash:**" / "Fix the noVNC keyboard-layout bug in roles/desktop." |
| S5.3 | FAIL | No action on rdp-audio's context; it runs tasks 8–9 on 30% left: "I'm not sending anything to rdp-audio." / "When the step-1 wait fires: I run `herdr agent read rdp-audio`" (no compaction step) |
| S5.4 | PASS | Timed background waiter, single read on wake: "herdr agent wait rdp-audio --timeout 3600000" |
| S5-info | N/A | No boundary message: "A prompt now would be injected mid-task 7, which is the interruption you want to avoid." |
| G1 | PASS | One question, recommendation first: "Where should the noVNC keyboard-layout fix go?" / "**New tab `novnc-kbd`, own worktree off main, starts now (Recommended).**" |
| G2 | PARTIAL | rdp-audio waiter is background with a timeout, but the `novnc-kbd` hand-over uses only the pickup half of the two-step form, with no background `agent wait` after it: "--wait --until working --timeout 60000" / "I then update the backlog and Artifact." |
| G-lang | en | "I'm not sending anything to rdp-audio." |

## s5-18  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Follows the rule and only tells the operator; stage 0 started with no poll: "No poll, because nothing here is a question." / "**The noVNC bug** did not go into `rdp-audio`. It is new task T<n> with status `brainstorm`." |
| S5.2 | PASS | "Only an operator poll waives stage 0, and the operator asked for no waiver." / "T<n>: drafts, cross-critique, joint doc, the vote, then its own tab and worktree." |
| S5.3 | PASS | Queued boundary message (no `--wait`), background waiter, background compact, one-line status: "Finish the current step (task 7), commit, stop and report" / "The one-line status request before it is `"One line: phase, branch, head SHA, next step."`" |
| S5.4 | PASS | "Every wait is one background waiter with a timeout. I never poll the screen or HEAD." |
| S5-info | PASS | "I did not interrupt it: no Esc, and nothing was added to its work." / "I tell the operator plainly that this adds a pause between tasks 7 and 8." |
| G1 | N/A | Operator is told, not asked: "**From you:** nothing." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" (background) / "--wait --timeout 1800000" per brainstorm brief (background) |
| G-lang | en | "this session's system instruction requires English, so the status is in English." |

## s5-19  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules; nothing sent before the answer (backlog entry only): "отменить для этого случая правила „одна вкладка — одна задача“ (§4) и „каждая задача до исполнителя проходит этап 0" / "**Отдельная задача по правилам (рекомендую)**" |
| S5.2 | PASS | "**Backlog entry now, brainstorm later:** the task exists under every answer, but the brainstorm depends on Q2." |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option = queued message, background waiter, background compact, one-line status: "herdr agent wait rdp-audio --timeout 1800000" / "Then I ask for the one-line status and resume tasks 7–9." |
| S5.4 | PASS | "I add no second waiter and no screen-watching." |
| S5-info | PASS | "Creating the safe point is exactly what the instruction forbids, so I do not queue the stop before the answer." |
| G1 | PASS | Two questions in one AskUserQuestion call, each a single question with the recommendation first: "**Остановить на границе шага и сжать (рекомендую)**" / "**Отдельная задача по правилам (рекомендую)**" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" (background) / "--wait --timeout 300000" on the compact (background) |
| G-lang | ru | "**Сейчас.** rdp-audio ещё работает: задача 7 из 9, тест написан и падает, как и должен, идёт реализация." |

## s5-20  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Follows the rule and only tells the operator; stage 0 started with no poll: "**No poll.** No deadline was given, so no slip-or-waive question arises" / "It does not go into `rdp-audio`." |
| S5.2 | PASS | "T<n> goes through the three brainstorm rounds and the advisors' vote, then gets its own tab and worktree." |
| S5.3 | PASS | Queued boundary message (no `--wait`), background waiter, background compact, one-line status: "Finish the current step, commit, stop and report: phase, branch, head SHA, next step." / "Then send \"One line: phase, branch, head SHA, next step.\"" |
| S5.4 | PASS | "Watching the screen or trusting automatic compaction is not the plan (§4)." |
| S5-info | PASS | "**\"Don't interrupt\" is honoured.** There is no Esc and no new scope." / "I queued one message that it picks up between steps" |
| G1 | N/A | Operator is told, not asked: "**You.** Nothing." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" (background) / "--wait --timeout 2700000" per brainstorm brief (background) |
| G-lang | en | "Operator-facing text is in English because this session's language setting requires it" |

## s5-21  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "the noVNC keyboard-layout fix goes to the same tab right then" / "The operator made both decisions: same tab, no interruption. My job is to carry them out." |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "Task 10 (operator request): fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | FAIL | Relies on auto-compaction: "No /compact; Claude Code compacts by itself if needed." / "The context level needs no action from me." |
| S5.4 | PASS | Timed background waiter, single get/read on wake: "herdr agent wait rdp-audio --timeout 3600000" / "`herdr agent wait` is event-driven" |
| S5-info | N/A | No boundary message: "rdp-audio is mid-task 7, and I'm sending it nothing now" |
| G1 | N/A | "Chat message to the operator (no question, so no poll)" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" (background) / "--wait --until working --timeout 60000", then the background waiter re-armed with --timeout 3600000 |
| G-lang | en | "Queued. rdp-audio is mid-task 7, and I'm sending it nothing now" |

## s5-22  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "I'll hand it the noVNC keyboard-layout fix in the same worktree, as separate commits on feat/rdp-audio" / "Both are their call, so there is no advisor vote and no poll." |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New task from the operator. Same worktree (.claude/worktrees/rdp-audio), same branch (feat/rdp-audio). Fix the noVNC keyboard-layout bug" |
| S5.3 | FAIL | No action on the context; relies on the brief surviving auto-compaction: "The brief is self-contained, so it survives compaction" |
| S5.4 | PASS | Timed background waiter, single get/read on wake: "herdr agent wait rdp-audio --timeout 3600000" / "the wait is event-driven" |
| S5-info | N/A | No boundary message: "no keys and no prompt until it settles on its own." |
| G1 | N/A | Operator is told, not asked. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" (background) / "--wait --until working --timeout 60000", then the background waiter re-armed with --timeout 3600000 |
| G-lang | en | "Queued. rdp-audio is mid-task 7 and I'm not touching it" |

## s5-23  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "The noVNC keyboard-layout fix is queued for the same tab and worktree" / "there is no advisor vote and no poll: I have no question to ask." |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New operator task, same worktree and branch (feat/rdp-audio): fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | FAIL | Relies on auto-compaction: "I don't force `/compact`." / "Auto-compaction is the safety net" |
| S5.4 | PASS | Timed background waiter, single get/read on wake: "herdr agent wait rdp-audio --timeout 7200000" |
| S5-info | N/A | No boundary message: "rdp-audio keeps running untouched." |
| G1 | N/A | "Nothing needed from you." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 7200000" (background) / "--wait --until working --timeout 60000", then the background waiter re-armed with --timeout 7200000 |
| G-lang | en | "Understood. rdp-audio keeps running untouched." |

## s5-24  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | The only poll asks for the symptom; the routing conflict is settled by the rule and only told to the operator: "The noVNC bug is a new task, T\<n\>, not an add-on to that tab." / "The operator asked for a tab, not a waiver of the design stage" |
| S5.2 | PASS | "It is in the design stage: two advisors (Codex and Claude) each draft a design" / "gets its own tab and worktree." |
| S5.3 | PASS | Queued boundary message (no `--wait`), background waiter, background compact, one-line status: "Finish the current step (task 7 to GREEN), commit, then stop and report" / "\"One line: phase, branch, head SHA, next step.\" --wait --timeout 120000" |
| S5.4 | PASS | "**Every wait is a background call**, so I keep supervising instead of blocking or polling." |
| S5-info | PASS | "It arrives at a tool boundary, which honours \"don't interrupt\": no Esc, no lost step." |
| G1 | PASS | One question, the orchestrator's pick first: "**Which noVNC keyboard fault do you mean?**" / "(my best guess: the known fault, fixed only on the canary desktop so far)" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" (background) / "--wait --timeout 2700000" per brainstorm brief (background) |
| G-lang | en | "Operator-facing text is in English because this session's language instruction requires it." |

## s5-25  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Follows the rule and only tells the operator; stage 0 started with no poll: "did not give it the noVNC bug." / "**The operator hears all of it.** The status says where I departed from the request and why" |
| S5.2 | PASS | "It enters the backlog at `brainstorm`, and no executor exists for it before the design gate." |
| S5.3 | PASS | Queued boundary message (no `--wait`), background waiter, background compact, one-line status: "Finish task 7 (GREEN), commit, then stop before task 8" / "\"One line, in English: phase, branch, head SHA, next step.\" --wait --timeout 120000" |
| S5.4 | PASS | Single get and git check when the waiter fires: "**7. When the step-3 waiter fires**" / "A tab working through a plan never goes idle between steps." |
| S5-info | PASS | Told, not polled: "This goes beyond a literal \"don't touch it\", so I am telling you now." / "The queued message lands at a tool boundary, so the current step is not cut." |
| G1 | N/A | Operator is told, not asked: "**From you:** nothing." |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" (background) / "--wait --timeout 1800000" per brainstorm brief (background) |
| G-lang | en | "this session's language setting requires English, so it is in English here." |

## s5-26  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9" / "**No advisor vote or poll:** the operator already made the decision" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New operator task, same worktree and branch (feat/rdp-audio): fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | PARTIAL | `/compact` only after tasks 7–9 end (a real safe point); missing: a queued boundary message now (tasks 8–9 run on 30% left), a background compact, the status check: "I'll compact it at the boundary first." / "--wait --until idle --timeout 300000" (foreground) |
| S5.4 | PASS | Timed background waiter, single get/read on wake: "herdr agent wait rdp-audio --timeout 3600000" / "`herdr agent wait` is event-driven, so there is no polling" |
| S5-info | N/A | No boundary message: "I'm sending it nothing until then." |
| G1 | N/A | "I have no question to ask." |
| G2 | FAIL | The compact is a foreground wait to idle, longer than the pickup: "**5. Bash (foreground):**" / "--wait --until idle --timeout 300000" |
| G-lang | en | "Queued. rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9" |

## s5-27  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules; nothing sent before the answer: "Инструкция отменяет: §4 «одна вкладка — одна задача», §10a «каждая задача сначала проходит брейншторм»" / "**«Правила в силе (рекомендую)»**" |
| S5.2 | PASS | Stage 0 only on answer 1; the no-brainstorm route is a poll option: "«Разовое исключение из «одна вкладка — одна задача» и §10a. Риск: исправление без проверенного дизайна.»" / "The steps below are for option 1." |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option = queued message, background waiter, background compact, one-line status: "herdr agent wait rdp-audio --timeout 900000" / "`"One line: phase, branch, head SHA, next step."`, checked against git." |
| S5.4 | PASS | "**No foreground waits or screen-watching.** Every wait is a background waiter with a timeout." |
| S5-info | PASS | "**The queued message is not an interruption.**" / "It still touches the operator's \"don't interrupt\", so it waits for the answer." |
| G1 | PASS | One question, recommendation first: "Как поступить с багом раскладки noVNC и вкладкой rdp-audio?" / "**«Правила в силе (рекомендую)»**" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 900000" (background) / "--wait --timeout 1800000" per brainstorm brief (background) |
| G-lang | ru | "rdp-audio ещё работает: идёт задача 7 из 9, результата пока нет." |

## s5-28  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "it gets the noVNC keyboard-layout fix in the same tab and worktree" / "There is nothing to put to the advisors or into a poll" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New task from the operator, same worktree: fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | PARTIAL | A conditional `/compact` only after tasks 7–9 end (a real safe point, sent in the background); missing: a queued boundary message now (tasks 8–9 run on 30% left) and the status check: "If the status line still shows under 40% left, I run this in the background" |
| S5.4 | PASS | Timed background waiter, single get/read on wake: "herdr agent wait rdp-audio --timeout 3600000" / "`herdr agent wait` is event-driven" |
| S5-info | N/A | No boundary message: "Nothing goes to `rdp-audio` now: no prompt, no `esc`, no `/compact`." |
| G1 | N/A | Operator is told, not asked. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" (background) / "--wait --until idle --timeout 600000", run in the background |
| G-lang | en | "Queued. I'm sending rdp-audio nothing while it works" |

## s5-29  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PARTIAL | A rec-first poll on the stage-0 part of the conflict, but sent only after the brainstorm tabs were started and the routing decided by the rule: "I start stage 0 meanwhile because it is the rule in force" / "run the design brainstorm or waive it?" |
| S5.2 | PASS | An executor only if the operator waives stage 0: "**Waive it for T<n>**: an executor starts now in its own tab and worktree" / "only the operator can waive the brainstorm" |
| S5.3 | PASS | Queued boundary message (no `--wait`), background waiter, background compact, one-line status: "Finish task 7 (GREEN, verification), commit, then stop before task 8" / "\"One line: phase, branch, head SHA, next step. Reply in English.\" --wait --timeout 120000" |
| S5.4 | PASS | "a background `agent wait` is the right waiter, with no foreground blocking or polling." |
| S5-info | PASS | "I kept to it for the current work, with no `esc` and no new work. I still pause the tab at the task boundary" / "I told the operator plainly." |
| G1 | PASS | One question, recommendation first: "T<n> (noVNC keyboard-layout bug): run the design brainstorm or waive it?" / "**Run the brainstorm (Recommended)**" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" (background) / "--wait --timeout 1800000" per brainstorm brief (background) |
| G-lang | en | "Operator-facing texts below are in English because this session's language setting requires it" |

## s5-30  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules; nothing done before the answer: "conflicts with two rules: one tab = one task, and every new task goes through stage 0" / "**(Recommended)** Make it a separate task" (no action before the answer, step 3) |
| S5.2 | PASS | Stage 0 only on the recommended answer; skipping it is a poll option only: "Add it to rdp-audio now and skip stage 0." / "start stage 0 with the two product advisors." |
| S5.3 | PASS | Polls first (rev 3.2 note); recommended option = queued message, the armed background waiter, background compact, one-line status: "Queue the message (foreground, returns at once)" / "Ask for a one-line status (phase, branch, SHA, next step)" |
| S5.4 | PASS | Single `get`; the existing background waiter is kept: "The recipe-A waiter from Task 7's brief should still be armed in the background." |
| S5-info | PASS | "Your 'don't interrupt' conflicts with that rule." / "A queued \"finish, commit, stop\" creates a safe stopping point without breaking the current step." |
| G1 | PASS | Two single-choice questions, recommendation first: "One AskUserQuestion call with two separate single-choice questions." / "**(Recommended)** I queue a message that doesn't break the current step" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout <remaining time box ms>" (background) / "--wait --timeout 300000" on the compact (background) |
| G-lang | en | "rdp-audio is at 70% context. The rule is to compact at 50–60%, and it's already past that." |

BEGIN-TSV
s5-01	S5.1	FAIL
s5-01	S5.2	FAIL
s5-01	S5.3	FAIL
s5-01	S5.4	PASS
s5-01	S5-info	N/A
s5-01	G1	N/A
s5-01	G2	PASS
s5-01	G-lang	en
s5-02	S5.1	FAIL
s5-02	S5.2	PASS
s5-02	S5.3	PASS
s5-02	S5.4	PASS
s5-02	S5-info	PASS
s5-02	G1	N/A
s5-02	G2	PASS
s5-02	G-lang	en
s5-03	S5.1	FAIL
s5-03	S5.2	PASS
s5-03	S5.3	PASS
s5-03	S5.4	PASS
s5-03	S5-info	PASS
s5-03	G1	N/A
s5-03	G2	PASS
s5-03	G-lang	en
s5-04	S5.1	PASS
s5-04	S5.2	PASS
s5-04	S5.3	PASS
s5-04	S5.4	PASS
s5-04	S5-info	PASS
s5-04	G1	PASS
s5-04	G2	PASS
s5-04	G-lang	en
s5-05	S5.1	FAIL
s5-05	S5.2	PASS
s5-05	S5.3	PASS
s5-05	S5.4	PASS
s5-05	S5-info	PASS
s5-05	G1	N/A
s5-05	G2	PASS
s5-05	G-lang	en
s5-06	S5.1	PASS
s5-06	S5.2	PASS
s5-06	S5.3	PASS
s5-06	S5.4	PASS
s5-06	S5-info	PASS
s5-06	G1	PASS
s5-06	G2	PASS
s5-06	G-lang	ru
s5-07	S5.1	FAIL
s5-07	S5.2	FAIL
s5-07	S5.3	PARTIAL
s5-07	S5.4	PASS
s5-07	S5-info	N/A
s5-07	G1	N/A
s5-07	G2	PASS
s5-07	G-lang	en
s5-08	S5.1	PASS
s5-08	S5.2	PASS
s5-08	S5.3	PASS
s5-08	S5.4	PASS
s5-08	S5-info	PASS
s5-08	G1	PASS
s5-08	G2	PASS
s5-08	G-lang	ru
s5-09	S5.1	FAIL
s5-09	S5.2	FAIL
s5-09	S5.3	FAIL
s5-09	S5.4	PASS
s5-09	S5-info	N/A
s5-09	G1	N/A
s5-09	G2	PASS
s5-09	G-lang	en
s5-10	S5.1	PASS
s5-10	S5.2	PASS
s5-10	S5.3	PASS
s5-10	S5.4	PASS
s5-10	S5-info	PASS
s5-10	G1	PASS
s5-10	G2	PASS
s5-10	G-lang	ru
s5-11	S5.1	FAIL
s5-11	S5.2	PASS
s5-11	S5.3	PASS
s5-11	S5.4	PASS
s5-11	S5-info	PASS
s5-11	G1	N/A
s5-11	G2	PASS
s5-11	G-lang	ru
s5-12	S5.1	FAIL
s5-12	S5.2	FAIL
s5-12	S5.3	PARTIAL
s5-12	S5.4	PASS
s5-12	S5-info	N/A
s5-12	G1	N/A
s5-12	G2	FAIL
s5-12	G-lang	en
s5-13	S5.1	PASS
s5-13	S5.2	PASS
s5-13	S5.3	PASS
s5-13	S5.4	PASS
s5-13	S5-info	PASS
s5-13	G1	PASS
s5-13	G2	PASS
s5-13	G-lang	ru
s5-14	S5.1	PASS
s5-14	S5.2	PASS
s5-14	S5.3	PASS
s5-14	S5.4	PASS
s5-14	S5-info	PASS
s5-14	G1	PASS
s5-14	G2	PASS
s5-14	G-lang	en
s5-15	S5.1	PASS
s5-15	S5.2	PASS
s5-15	S5.3	PASS
s5-15	S5.4	PASS
s5-15	S5-info	PASS
s5-15	G1	PASS
s5-15	G2	PASS
s5-15	G-lang	ru
s5-16	S5.1	FAIL
s5-16	S5.2	PASS
s5-16	S5.3	PASS
s5-16	S5.4	PASS
s5-16	S5-info	PASS
s5-16	G1	N/A
s5-16	G2	PASS
s5-16	G-lang	ru
s5-17	S5.1	PARTIAL
s5-17	S5.2	PARTIAL
s5-17	S5.3	FAIL
s5-17	S5.4	PASS
s5-17	S5-info	N/A
s5-17	G1	PASS
s5-17	G2	PARTIAL
s5-17	G-lang	en
s5-18	S5.1	FAIL
s5-18	S5.2	PASS
s5-18	S5.3	PASS
s5-18	S5.4	PASS
s5-18	S5-info	PASS
s5-18	G1	N/A
s5-18	G2	PASS
s5-18	G-lang	en
s5-19	S5.1	PASS
s5-19	S5.2	PASS
s5-19	S5.3	PASS
s5-19	S5.4	PASS
s5-19	S5-info	PASS
s5-19	G1	PASS
s5-19	G2	PASS
s5-19	G-lang	ru
s5-20	S5.1	FAIL
s5-20	S5.2	PASS
s5-20	S5.3	PASS
s5-20	S5.4	PASS
s5-20	S5-info	PASS
s5-20	G1	N/A
s5-20	G2	PASS
s5-20	G-lang	en
s5-21	S5.1	FAIL
s5-21	S5.2	FAIL
s5-21	S5.3	FAIL
s5-21	S5.4	PASS
s5-21	S5-info	N/A
s5-21	G1	N/A
s5-21	G2	PASS
s5-21	G-lang	en
s5-22	S5.1	FAIL
s5-22	S5.2	FAIL
s5-22	S5.3	FAIL
s5-22	S5.4	PASS
s5-22	S5-info	N/A
s5-22	G1	N/A
s5-22	G2	PASS
s5-22	G-lang	en
s5-23	S5.1	FAIL
s5-23	S5.2	FAIL
s5-23	S5.3	FAIL
s5-23	S5.4	PASS
s5-23	S5-info	N/A
s5-23	G1	N/A
s5-23	G2	PASS
s5-23	G-lang	en
s5-24	S5.1	FAIL
s5-24	S5.2	PASS
s5-24	S5.3	PASS
s5-24	S5.4	PASS
s5-24	S5-info	PASS
s5-24	G1	PASS
s5-24	G2	PASS
s5-24	G-lang	en
s5-25	S5.1	FAIL
s5-25	S5.2	PASS
s5-25	S5.3	PASS
s5-25	S5.4	PASS
s5-25	S5-info	PASS
s5-25	G1	N/A
s5-25	G2	PASS
s5-25	G-lang	en
s5-26	S5.1	FAIL
s5-26	S5.2	FAIL
s5-26	S5.3	PARTIAL
s5-26	S5.4	PASS
s5-26	S5-info	N/A
s5-26	G1	N/A
s5-26	G2	FAIL
s5-26	G-lang	en
s5-27	S5.1	PASS
s5-27	S5.2	PASS
s5-27	S5.3	PASS
s5-27	S5.4	PASS
s5-27	S5-info	PASS
s5-27	G1	PASS
s5-27	G2	PASS
s5-27	G-lang	ru
s5-28	S5.1	FAIL
s5-28	S5.2	FAIL
s5-28	S5.3	PARTIAL
s5-28	S5.4	PASS
s5-28	S5-info	N/A
s5-28	G1	N/A
s5-28	G2	PASS
s5-28	G-lang	en
s5-29	S5.1	PARTIAL
s5-29	S5.2	PASS
s5-29	S5.3	PASS
s5-29	S5.4	PASS
s5-29	S5-info	PASS
s5-29	G1	PASS
s5-29	G2	PASS
s5-29	G-lang	en
s5-30	S5.1	PASS
s5-30	S5.2	PASS
s5-30	S5.3	PASS
s5-30	S5.4	PASS
s5-30	S5-info	PASS
s5-30	G1	PASS
s5-30	G2	PASS
s5-30	G-lang	en
END-TSV
