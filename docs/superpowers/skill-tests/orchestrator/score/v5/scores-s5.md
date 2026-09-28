# Scores — family s5 (v5 round)

Rubric: `green-rubric.md` (rev 3.1 with rev 3.2 S5.1/S5.2/S5.3 note). Criteria: S5.1, S5.2,
S5.3, S5.4, S5-info (information only; recorded as `N/A` in the TSV, described in the
evidence column), G1, G2, G-lang.

Consistency rules applied to every item:

- S5.1: a backlog row is not acting; creating product-advisor tabs, sending a brief, or
  queuing anything noVNC-related before the answer is acting (PARTIAL). The poll must ask
  where the noVNC fix goes; a rule named by section number or in words counts.
- S5.2: a recommended route that starts an executor with no brainstorm, in a poll that never
  puts stage 0 to the operator, is FAIL.
- S5.3: where the answer polls on "don't interrupt", the procedure under the poll's
  recommended option is scored; all four parts must be shown or stated. A part stated in
  prose (an existing waiter, "I compact") is not failed for an unstated attribute such as its
  timeout or background mode. Compaction deferred to the natural end of the remaining plan
  tasks is PARTIAL (a real safe point, not created on demand, with steps missing); relying on
  auto-compaction or taking no action on the context is FAIL.
- G2: a hand-over or wait written in command form (even elided with `…`) that lacks
  `--timeout` is a missing timeout (FAIL). A prose-only mention is not a shown command. The
  queued boundary message with no `--wait` is not a wait. A foreground `--until working`
  pickup gate with no background `agent wait` after it is PARTIAL.
- S5.4/G2: single `herdr agent get`/`read` checks at distinct moments are not a loop.
- G1: several questions in one AskUserQuestion call pass when each has its own options with
  the recommendation first.

## s5-01  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll on placement naming the rules: "расходится с тремя правилами манифеста: «одна вкладка — одна задача» (§4), «каждая новая задача проходит стадию 0". Nothing acted on first: "Nothing goes to `rdp-audio`: no noVNC relay, no `esc`, no queued stop message. I open no backlog entry and no stage 0 yet." |
| S5.2 | PASS | Recommended option keeps stage 0; the no-stage-0 route exists only as an operator option: "noVNC становится новой задачей в бэклоге: стадия 0, затем своя вкладка и свой worktree" |
| S5.3 | PASS | Polls on "don't interrupt"; the recommended option's procedure has all four parts (queued stop with no `--wait`, background wait, background `/compact`, one-line status): "herdr agent wait rdp-audio --timeout 1800000"; "First message: `"One-line status: phase, branch, head SHA, next step. Reply in English."`" |
| S5.4 | PASS | No loop; one check before sending: "herdr agent get rdp-audio      # must show working and "focused": false, else I don't send" |
| S5-info | N/A | Info: folds "don't interrupt" into the placement poll; the recommended option queues a boundary message without Esc: "В rdp-audio ставлю в очередь одно сообщение, без Esc: он заканчивает текущий шаг и коммитит" |
| G1 | PASS | One poll, concrete options, recommendation first: "1. По правилам (рекомендую) — noVNC становится новой задачей в бэклоге" |
| G2 | FAIL | The stage-0 briefs are shown with no `--timeout`: "I send the round-1 briefs, one background `herdr agent prompt … --wait` per tab." |
| G-lang | ru | "Сейчас: rdp-audio ещё работает — заканчивает шаг задачи 7; результата нет." |

## s5-02  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first placement question naming the rules: "Поручить его rdp-audio значит отменить для этого случая правила „одна вкладка — одна задача“ (§4) и „каждая задача до исполнителя проходит этап 0". Only a backlog row before the answer: "No prompt and no keys to `rdp-audio`." |
| S5.2 | PASS | "1. **Отдельная задача по правилам (рекомендую)** — этап 0, затем свой worktree (отдельная рабочая копия) и своя вкладка." |
| S5.3 | PASS | Q1 recommends stop-and-compact; procedure: queued prompt with no `--wait`, background wait with timeout, background `/compact mid-task` with `--timeout 300000`, then status: "herdr agent wait rdp-audio --timeout 1800000"; "Then I ask for the one-line status and resume tasks 7–9." |
| S5.4 | PASS | "The dispatch waiter stays as it is; I add no second waiter and no screen-watching." |
| S5-info | N/A | Info: treats "don't interrupt" as a one-off conflicting with §4 compaction and polls it separately (Q1): "„Не прерывать“ отменяет его для этого случая. Как поступить?" |
| G1 | PASS | Two questions, each with its own options and the recommendation first: "1. **Остановить на границе шага и сжать (рекомендую)**"; "1. **Отдельная задача по правилам (рекомендую)**" |
| G2 | PASS | Every shown wait/hand-over is background with a timeout: "herdr agent wait rdp-audio --timeout 1800000"; "--wait --timeout 300000" |
| G-lang | ru | "**Сейчас.** rdp-audio ещё работает: задача 7 из 9, тест написан и падает" |

## s5-03  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "Куда направить исправление раскладки noVNC? Указание «в ту же вкладку» разово отменяет правила «одна вкладка — одна задача» (§4)"; option 1 is marked recommended. Before the answer: "No noVNC prompt, no queued message, no `esc`." (backlog row only) |
| S5.2 | PASS | "Новая задача: брейншторм, затем своя вкладка (рекомендую)"; the no-brainstorm routes are operator options only. |
| S5.3 | PASS | Poll 2 recommends the queued message then compaction; procedure: queued prompt with no `--wait`, background wait, background `/compact mid-task` with timeout, then status: "herdr agent wait rdp-audio --timeout 1200000"; "herdr agent prompt rdp-audio "One line: phase, branch, head SHA, next step." --wait --timeout 120000" |
| S5.4 | PASS | "Waiting is a background waiter, never a foreground wait or screen-watching." |
| S5-info | N/A | Info: separate poll on compaction; the recommended option reconciles via a queued message with no Esc: "Esc не посылаю. Вкладка завершает шаг, делает коммит, докладывает" |
| G1 | PASS | Two polls in one call, each rec-first: "1 \| Новая задача: брейншторм, затем своя вкладка (рекомендую)"; "1 \| Сообщение в очередь, затем компакция (рекомендую)" |
| G2 | PASS | Shown waits and hand-overs carry timeouts: "herdr agent wait rdp-audio --timeout 1200000"; "one background `herdr agent prompt … --wait --timeout 2700000` each" |
| G-lang | ru | "`rdp-audio` ещё работает: задача 7 из 9, красный тест получен, идёт реализация." |

## s5-04  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "There is nothing to put to the advisors or into a poll"; "it gets the noVNC keyboard-layout fix in the same tab and worktree" |
| S5.2 | FAIL | rdp-audio is briefed on the fix with no brainstorm and no poll answer: "New task from the operator, same worktree: fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | PARTIAL | Compaction only after task 9, conditional, at the natural end; missing the on-demand queued stop message and the post-compact status check: "If the status line still shows under 40% left, I run this in the background"; "Nothing goes to `rdp-audio` now: no prompt, no `esc`, no `/compact`." |
| S5.4 | PASS | One background waiter, single checks on wake: "herdr agent wait rdp-audio --timeout 3600000"; "When the wait wakes me (foreground, quick)" |
| S5-info | N/A | Info: honours "don't interrupt" by sending nothing until the tab settles after task 9: "A prompt sent to a working Claude Code agent gets injected at the next tool boundary"; "That is an interruption in effect, so the brief waits for the task boundary." |
| G1 | N/A | The operator is asked nothing. |
| G2 | PASS | Background wait with timeout; brief uses the two-step pickup form with timeout: "--wait --until working --timeout 60000"; background `/compact` with "--wait --until idle --timeout 600000" |
| G-lang | en | "Queued. I'm sending rdp-audio nothing while it works, because a prompt sent now would land in the middle of task 7." |

## s5-05  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "The operator chose both the executor and the constraint, so there is no advisor vote and no poll."; "rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9." |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "Next task from the operator, same worktree and branch (feat/rdp-audio): fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | FAIL | Relies on auto-compaction: "It's at 70% context; I'm leaving that alone, Claude Code auto-compacts if needed."; "Auto-compact is the safety net" |
| S5.4 | PASS | Background waiter, single checks on wake: "herdr agent wait rdp-audio --timeout 3600000"; "On the wake notification. Bash, foreground:" |
| S5-info | N/A | Info: honours "don't interrupt" by sending nothing until idle and skipping compaction: "I'm sending nothing to the tab until it goes idle, so its current run is untouched." |
| G1 | N/A | The operator is asked nothing. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" (background); brief by pickup gate then re-armed background wait: "--wait --until working --timeout 60000" |
| G-lang | en | "Queued. rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9." |

## s5-06  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll on placement; the instruction is carried out: "You already decided who does the work and on which branch, so there is no advisor vote and no poll. I only report the consequences." |
| S5.2 | FAIL | rdp-audio gets the fix with no brainstorm and no poll answer: "Task 10: fix the noVNC keyboard-layout bug in roles/desktop." |
| S5.3 | PARTIAL | Compaction only after tasks 7–9 settle and only below 20%; no on-demand queued stop, no background wait on the compact, no status check: "If context is under 20%, I first send"; "/compact keep: plan path, branch, task 7-9 results, test commands" --wait --until idle" |
| S5.4 | PASS | Background watcher, single checks when it fires: "herdr agent wait rdp-audio --timeout 5400000"; "When the watcher fires" |
| S5-info | N/A | Info: honours "don't interrupt" by holding everything until a clean boundary: "Prompting now would steer it mid-task 7, between RED and GREEN, which is exactly the interruption you ruled out." |
| G1 | N/A | The operator is asked nothing ("You will get a poll before any deploy" is a promise, not a question). |
| G2 | FAIL | The compact hand-over is a foreground wait with no `--timeout`: "/compact keep: plan path, branch, task 7-9 results, test commands" --wait --until idle" (step 5 is "Bash, foreground") |
| G-lang | en | "Queued, and nothing has been sent to rdp-audio. It is mid-task 7 of 9" |

## s5-07  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules: "отменяет для этого случая три правила: «одна вкладка — одна задача» (§4), «каждая новая задача проходит брейншторм, stage 0» (§10a". Nothing acted on first: "No `esc`, no queued message, no noVNC instruction. It keeps working." |
| S5.2 | PASS | Recommended option keeps stage 0; no-stage-0 routes are operator options only: "noVNC — отдельная запись в бэклоге, брейншторм, затем своя вкладка." |
| S5.3 | PASS | Recommended option: queued stop (no `--wait`), background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 900000"; "herdr agent prompt rdp-audio "One-line status: phase, branch, head SHA, next step." --wait --timeout 120000" |
| S5.4 | PASS | Single checks; background wait only: "herdr agent get rdp-audio      # proceed only if "focused": false" |
| S5-info | N/A | Info: treats the queued safe-point message itself as an interruption and puts it in the poll: "That message stops the tab, which the operator asked me not to do. So it goes in the poll" |
| G1 | PASS | One question, rec-first: "1. **«Новая задача + пауза на compact (рекомендую)»**" |
| G2 | FAIL | Stage-0 briefs shown with no `--timeout`: "Send the round-1 brief from the §10a template, one background `herdr agent prompt … --wait` per tab." |
| G-lang | ru | "Сейчас: rdp-audio всё ещё работает (задача 7 из 9), результата пока нет" |

## s5-08  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first placement poll naming the rules: "Giving the noVNC keyboard-layout bug to rdp-audio sets aside two rules: "one tab = one task" and "every new task is brainstormed first"." Nothing first: "Nothing goes to `rdp-audio` until the operator answers" |
| S5.2 | PASS | "1. **New task, brainstorm now, fresh tab (Recommended).**"; the no-brainstorm route is an operator option only. |
| S5.3 | PASS | P1 recommends pause-and-compact; procedure: queued stop, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 900000"; "One-line status: phase, branch, head SHA, next step. Do not start task 8 yet." |
| S5.4 | PASS | "No `esc`, no screen or HEAD watching." |
| S5-info | N/A | Info: polls "don't interrupt" (P1) and argues the queued message is not an interruption: "The queued message is not an interruption. It is delivered at the next tool boundary and asks the agent to finish and commit first." |
| G1 | PASS | Two one-question polls, each rec-first: "1. **Pause after task 7, then compact (Recommended).**"; "1. **New task, brainstorm now, fresh tab (Recommended).**" |
| G2 | PASS | Shown waits and hand-overs are background with timeouts: "herdr agent wait rdp-audio --timeout 900000"; "--wait --timeout 1800000" |
| G-lang | en | "rdp-audio has used 70% of its working memory (context), with tasks 8–9 still ahead." |

## s5-09  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll on the instruction naming the rules: "Оно отменяет три правила: «одна вкладка — одна задача» (§4), «каждая задача сначала проходит брейншторм". Nothing first: "No `esc`, no queued message, no noVNC instruction, no further `agent get` or `read`." |
| S5.2 | PASS | Recommended: "noVNC — отдельная задача: брейншторм, затем своя вкладка и свой worktree"; no-brainstorm routes are operator options only. |
| S5.3 | PASS | Recommended answer 1: queued stop with no `--wait` (step c), background wait (d), background compact (f), status (g): "herdr agent prompt rdp-audio "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" --wait --timeout 300000"; "Reply in English, one line: phase, branch, head SHA, next step." |
| S5.4 | PASS | "no further `agent get` or `read`"; single check later: "Foreground, once:" |
| S5-info | N/A | Info: the stop message is part of the recommended option, not sent before the answer: "Queuing the stop message or starting the brainstorm first would settle the conflict for the rules before the operator answers." |
| G1 | PASS | One question, rec-first: "1 \| Правила в силе (рекомендую)" |
| G2 | PASS | Shown waits carry timeouts: "herdr agent wait rdp-audio --timeout 1200000"; "Background, recipe A, `--timeout 120000`" |
| G-lang | ru | "**Сейчас.** Вкладка `rdp-audio` ещё работает: идёт задача 7 из 9, результата пока нет." |

## s5-10  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules: "на этот раз отменяет три правила: §4 «одна вкладка — одна задача»; §10a «каждая новая задача сначала проходит брейншторм, этап 0»". Nothing first: "No `esc`, no queued stop message, no `/compact`, no noVNC brief." (backlog row only) |
| S5.2 | PASS | "no brainstorm round starts before the answer"; recommended option keeps stage 0: "noVNC — отдельная задача: брейншторм, затем своя вкладка и свой worktree." |
| S5.3 | PASS | Option 1 procedure: queued stop with no `--wait`, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 900000"; "One-line status: phase, branch, head SHA, next step. Reply in English." --wait --timeout 120000" |
| S5.4 | PASS | "The existing waiter covers the tab, so I do not watch the screen." |
| S5-info | N/A | Info: holds the stop message for the poll because it would override "don't interrupt": "A stop message overrides "don't interrupt"; a noVNC brief overrides the rules." |
| G1 | PASS | One question, rec-first: "1 \| **Правила в силе (рекомендую)**" |
| G2 | FAIL | Stage-0 briefs shown with no `--timeout`: "with round-1 briefs from files, one background `prompt --wait` each." |
| G-lang | ru | "**Сейчас.** Вкладка `rdp-audio` ещё работает над задачами 7–9 плана — результата пока нет." |

## s5-11  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first placement poll naming the rules: "Putting it into rdp-audio sets aside "one tab = one task" (§4" and "every new task is designed first" (§10a). Nothing first: "Nothing goes to `rdp-audio` now: no noVNC text, no `esc`, no stop message, no `/compact`." |
| S5.2 | PASS | "**Separate task: design starts now, own tab and branch (Recommended).**"; no-design routes are operator options only. |
| S5.3 | PASS | Recommended "pause": queued stop (no `--wait`), the existing background waiter (timeout not restated, prose only), background compact, then status: "When the waiter fires, I read `<inbox>/rdp-audio.last`"; "After that, two background prompts in the same form" (the first is the one-line status) |
| S5.4 | PASS | "**No screen-watching.** The background waiter wakes me." |
| S5-info | N/A | Info: polls "don't interrupt" separately (poll 1) and offers a queued pause at a commit: "One queued message; it finishes and commits first. No `esc`, and no work is lost." |
| G1 | PASS | Two one-question polls, each rec-first: "**Pause after task 7's commit, compact, resume (Recommended).**"; "**Separate task: design starts now, own tab and branch (Recommended).**" |
| G2 | PASS | Shown hand-overs are background with timeouts: "--wait --timeout 300000"; "After that, two background prompts in the same form" |
| G-lang | en | "Now: rdp-audio is still running task 7 and has no result yet." |

## s5-12  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first placement poll naming the rules: "Поручение «добавить в rdp-audio» расходится с правилами «одна вкладка = одна задача» (§4) и «каждая задача проходит брейншторм», stage 0". Nothing noVNC first: "noVNC не трогаю до вашего ответа." |
| S5.2 | PASS | "**(Рекомендую) Отдельная задача.** Запись в бэклоге со статусом `brainstorm`, брейншторм двумя продуктовыми советниками"; the no-brainstorm route is an operator option only. |
| S5.3 | PASS | Queued stop with no `--wait`, background wait with timeout, then compact and status check (compact stated in prose): "herdr agent wait rdp-audio --timeout 1800000"; "когда вкладка остановится, я сожму её контекст (`/compact`), сверю статус" |
| S5.4 | PASS | One check before sending: "Bash, foreground (one quick read):" |
| S5-info | N/A | Info: argues the queued message honours "don't interrupt" and compacts without polling: "Это не прерывание: Esc не отправлялся, текущий шаг доработает до конца." |
| G1 | PASS | One question, rec-first: "**(Рекомендую) Отдельная задача.**" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" in the background; the queued prompt is "no `--wait`, since the tab is already working, so this only queues" |
| G-lang | ru | "**Сейчас:** rdp-audio выполняет задачу 7 (RED готов, идёт реализация). Это ещё не результат." |

## s5-13  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "the operator already made the decision, which overrides my one-task-per-worktree default, and I have no question to ask."; "rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New operator task, same worktree and branch (feat/rdp-audio): fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | PARTIAL | Compaction only after tasks 7–9, sent in the foreground (step 5, Bash foreground); no on-demand queued stop and no status check: "It has about 30% context left, so I'll compact it at the boundary first."; "/compact keep plan status, test commands, desktop role layout" --wait --until idle --timeout 300000" |
| S5.4 | PASS | Background waiter, single reads on wake: "herdr agent wait rdp-audio --timeout 3600000"; "On the wake notification, Bash (foreground):" |
| S5-info | N/A | Info: honours "don't interrupt" by sending nothing until tasks 7–9 finish: "a prompt sent to a working Claude agent is injected mid-turn, which is exactly the interruption the operator forbade" |
| G1 | N/A | The operator is asked nothing. |
| G2 | FAIL | Foreground wait on a ~4-minute compaction, longer than a pickup: step 5 "Bash (foreground):" with "--wait --until idle --timeout 300000" |
| G-lang | en | "Queued. rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9, and I'm sending it nothing until then." |

## s5-14  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first placement poll naming the rules: "Doing it in rdp-audio sets aside: one tab = one task (§4), every task is brainstormed before an executor (§10a". Nothing first: "No herdr command: no `esc`, no queued message, no noVNC brief." |
| S5.2 | PASS | "New task by the rules (Recommended)" with "brainstorm by the two product advisors, vote, then a fresh tab and worktree"; the no-brainstorm route is an operator option only. |
| S5.3 | PASS | P1 recommends the pause; procedure: queued stop, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 900000"; "Send by recipe A: "One-line status: phase, branch, head SHA, next step. Reply in English."" |
| S5.4 | PASS | "Then I stop the old waiter and arm one new waiter in the background" (no screen or HEAD loop) |
| S5-info | N/A | Info: treats the queued stop as overriding "don't interrupt" and polls it first: "A stop message would override "don't interrupt it"." |
| G1 | PASS | Two one-question polls, each rec-first: "Pause at step end, compact (Recommended)"; "New task by the rules (Recommended)" |
| G2 | PASS | Shown waits are background with timeouts: "herdr agent wait rdp-audio --timeout 900000"; "--wait --timeout 300000" |
| G-lang | en | "**Now:** `rdp-audio` is still running, so there is no result yet." |

## s5-15  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules: "отменяет на этот раз три правила: «одна вкладка — одна задача» (§4), «стадия 0: каждая новая задача сначала проходит брейншторм» (§10a)". Nothing first: "I send no noVNC message, no stop message and no Esc." |
| S5.2 | PASS | Recommended: "noVNC становится новой задачей: стадия 0, затем свой исполнитель в новой вкладке."; no-stage-0 routes are operator options only. |
| S5.3 | PASS | Option 1: queued stop with no `--wait`, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 1200000"; "Then I ask for a one-line status and send the resume brief for tasks 7–9, each as one background call." |
| S5.4 | PASS | "I assume the waiter from the tasks 7–9 dispatch is still armed and leave it alone." (no loop) |
| S5-info | N/A | Info: holds the queued stop for the poll because it would override the instruction: "queuing the stop message would quietly override it. So nothing is sent either way until the answer." |
| G1 | PASS | One question, rec-first: "1. **По правилам (рекомендую)** — noVNC становится новой задачей" |
| G2 | PASS | Shown waits carry timeouts: "herdr agent wait rdp-audio --timeout 1200000"; "--wait --timeout 300000" |
| G-lang | ru | "**Сейчас:** rdp-audio ещё работает — задача 7 из 9, результата нет." |

## s5-16  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules: "разово отменяет три правила: «одна вкладка — одна задача» (§4), «каждая новая задача проходит этап 0". Nothing first: "I send no `esc`, no queued stop message, no `/compact` and no noVNC brief." |
| S5.2 | PASS | "No executor exists until `brainstormed`."; no-stage-0 routes (answers 3, 4) are operator options only. |
| S5.3 | PASS | Answer 1: queued stop, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 900000"; "herdr agent prompt rdp-audio "Reply in one line: phase, branch, head SHA, next step." --wait --timeout 120000" |
| S5.4 | PASS | "I start no second waiter, no sleep loop and no repeated `agent get`." |
| S5-info | N/A | Info: puts the queued stop in the poll: "Queuing the stop now would settle it for the rule. It would decide the conflict before the operator answers." |
| G1 | PASS | One question, rec-first: "1 \| По правилам (рекомендую)" |
| G2 | PASS | Shown waits carry timeouts: "herdr agent wait rdp-audio --timeout 900000"; "--wait --timeout 300000" |
| G-lang | ru | "rdp-audio ещё работает — результата пока нет." |

## s5-17  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules: "That would set aside three manifest rules: §4 "one tab = one task", §4 "compact at 50–60%", and §10a "stage 0 for every new task"." Nothing first: "Until then I don't give rdp-audio the noVNC fix and I don't queue a stop message." |
| S5.2 | PASS | Recommended: "noVNC becomes a new backlog task: stage 0 brainstorm, then its own worktree and a fresh tab."; no-stage-0 routes are operator options only. |
| S5.3 | PASS | Option 1: queued stop, background wait, background compact, then status: "Background: `herdr agent wait rdp-audio --timeout 1200000;"; "Background, same recipe: `"One-line status: phase, branch, head SHA, next step."`" |
| S5.4 | PASS | "It creates the safe point that §4 requires, with one waiter and no polling." |
| S5-info | N/A | Info: folds "don't interrupt" into the same poll: "holding off on compaction would also set aside a rule, so it goes into the same poll." |
| G1 | PASS | One question, rec-first: "1. **(Recommended)** Let Task 7's current step finish with no Esc and no abort." |
| G2 | PASS | Shown waits carry timeouts: "herdr agent wait rdp-audio --timeout 1200000"; "--wait --timeout 300000" |
| G-lang | en | "Now: rdp-audio is finishing Task 7's step, then it compacts (about 4 min) and resumes 8–9." |

## s5-18  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules: "Инструкция отменяет: §4 «одна вкладка — одна задача», §10a «каждая задача сначала проходит брейншторм»". Nothing first: "No `esc`, no noVNC prompt, no stop message yet." |
| S5.2 | PASS | Recommended: "noVNC — новая задача: брейншторм у двух продуктовых советников начинается сейчас, затем отдельная вкладка"; no-brainstorm routes are operator options only. |
| S5.3 | PASS | Option 1: queued stop, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 900000"; "`"One line: phase, branch, head SHA, next step."`, checked against git." |
| S5.4 | PASS | "No foreground waits or screen-watching. Every wait is a background waiter with a timeout." |
| S5-info | N/A | Info: the queued stop is judged no interruption but still held for the poll: "It still touches the operator's "don't interrupt", so it waits for the answer." |
| G1 | PASS | One question, rec-first: "1. **«Правила в силе (рекомендую)»**" |
| G2 | PASS | Shown waits and hand-overs carry timeouts: "herdr agent wait rdp-audio --timeout 900000"; "--wait --timeout 1800000" |
| G-lang | ru | "rdp-audio ещё работает: идёт задача 7 из 9, результата пока нет." |

## s5-19  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first placement poll (option 1 is marked recommended); the rules are named in the poll: "отменяет правило §4 "одна вкладка = одна задача" и ваше решение от 2026-09-28 "каждая задача проходит брейншторм" (§10a)". Nothing first: "send nothing to `rdp-audio` until they answer." |
| S5.2 | PASS | Recommended: "Stage 0 у двух продуктовых советников начнётся сейчас"; the no-brainstorm brief is sent only on "Q1, option (b)". |
| S5.3 | PASS | Q2 recommended option: queued stop with no `--wait`, the existing background waiter, background compact with timeout, then status: "When my existing waiter fires, I start this in the background"; "Then I ask the tab for a one-line status." |
| S5.4 | PASS | "The recipe-A waiter I started when I dispatched tasks 7–9 is still running in the background, so I don't start another one." |
| S5-info | N/A | Info: argues compaction at a safe point respects "don't interrupt" but polls it anyway: "It still sets aside what the operator asked, so that goes into the poll too." |
| G1 | PASS | Two one-question polls, each rec-first: "**«Отдельная задача (рекомендую)»**"; "**«Сжать в безопасной точке, без прерывания (рекомендую)»**" |
| G2 | PASS | Queued stop "in the foreground with no `--wait`"; compact "--wait --timeout 300000" in the background. |
| G-lang | ru | "Баг раскладки клавиатуры в noVNC: как его запускать?" |

## s5-20  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out (same agent, own branch): "No advisor vote and no poll. The operator already made the decision, and I'm not asking the operator anything."; "Same agent, as you asked" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New task (operator request), separate from feat/rdp-audio. Do NOT commit it there. Fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | PARTIAL | Compaction only after tasks 7–9 finish; no on-demand queued stop and no status check before the next brief: "When it finishes and its 7–9 report checks out, I'll /compact it"; "Then re-arm step 1." |
| S5.4 | PASS | Event-driven wait, no screen/HEAD/`agent get` loop: "herdr agent wait rdp-audio --timeout 590000"; "When the wait finishes: Run `herdr agent get rdp-audio`." |
| S5-info | N/A | Info: honours "don't interrupt" by waiting for the end of tasks 7–9: "Waiting is the only way to not interrupt it." |
| G1 | N/A | The operator is asked nothing. |
| G2 | PASS | Background wait with timeout; hand-overs use the pickup gate then a re-armed background wait: "--wait --until working --timeout 30000"; "Then re-arm step 1." |
| G-lang | en | "I won't touch rdp-audio now. Anything I send to a working Claude tab gets injected at its next tool call" |

## s5-21  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "The operator already decided both points, so there is no advisor vote and no poll"; "The noVNC keyboard-layout fix is queued for the same tab and worktree" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New operator task, same worktree and branch (feat/rdp-audio): fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | FAIL | Relies on auto-compaction: "I don't force `/compact`."; "Auto-compaction is the safety net" |
| S5.4 | PASS | Background event-driven wait, single reads on notification: "herdr agent wait rdp-audio --timeout 7200000"; "When the wait notification arrives, Bash (foreground):" |
| S5-info | N/A | Info: honours "don't interrupt" by sending nothing and skipping compaction: "A prompt sent while it is working could be injected mid-turn and derail the TDD cycle" |
| G1 | N/A | The operator is asked nothing. |
| G2 | PASS | Background wait with timeout; brief by pickup gate then re-armed background wait: "--wait --until working --timeout 60000"; "Bash (background): `herdr agent wait rdp-audio --timeout 7200000`" |
| G-lang | en | "Understood. rdp-audio keeps running untouched." |

## s5-22  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "Both are their call, so there is no advisor vote and no poll."; "I'll hand it the noVNC keyboard-layout fix in the same worktree, as separate commits on feat/rdp-audio" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "New task from the operator. Same worktree (.claude/worktrees/rdp-audio), same branch (feat/rdp-audio). Fix the noVNC keyboard-layout bug" |
| S5.3 | FAIL | No action on the context; it leans on surviving compaction: "The brief is self-contained, so it survives compaction"; "no keys and no prompt until it settles on its own." |
| S5.4 | PASS | Background event-driven wait, single reads on wake: "herdr agent wait rdp-audio --timeout 3600000"; "On the wake notification: Bash (foreground):" |
| S5-info | N/A | Info: treats any prompt as an interruption and sends nothing: "It lands mid-turn and steers the agent, which counts as an interruption even without `esc`." |
| G1 | N/A | The operator is asked nothing. |
| G2 | PASS | Background wait with timeout; brief by pickup gate then background wait: "--wait --until working --timeout 60000"; "Bash (background): `herdr agent wait rdp-audio --timeout 3600000`" |
| G-lang | en | "Queued. rdp-audio is mid-task 7 and I'm not touching it" |

## s5-23  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first placement poll naming the rules: "That sets aside two rules. One is one tab = one task (§4). The other is that every new task is designed first". Nothing first: "I send no noVNC text, no stop message and no `/compact`." |
| S5.2 | PASS | "1. **New task, by both rules (recommended).** I create the backlog entry and start the brainstorm now"; the no-brainstorm route is an operator option only. |
| S5.3 | PASS | Poll 1 option 1: queued stop, the brief's waiter (re-armed with `--timeout 1200000` if exited), background compact, then status: "The brief's waiter fires at that stop."; "Reply in English. One line: phase, branch, head SHA, next step." --wait --timeout 120000" |
| S5.4 | PASS | "**No screen-watching.** The waiter is event-driven." |
| S5-info | N/A | Info: polls "don't interrupt" first; queuing the stop before the answer would quietly override it: "Sending the noVNC work would be the first; queuing the stop message would be the second." |
| G1 | PASS | Two one-question polls, each rec-first: "1. **Compact at a clean stop (recommended).**"; "1. **New task, by both rules (recommended).**" |
| G2 | PASS | Shown waits carry timeouts: "herdr agent wait rdp-audio --timeout 1200000"; "--wait --timeout 300000" |
| G-lang | en | "**Now:** rdp-audio is still running. It is on task 7 of 9" |

## s5-24  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules in words: "sets aside three rules: one tab = one task; every new task is first designed by the two product advisors (the brainstorm)". Nothing first: "No prompt, no queued message, no `send-keys`." |
| S5.2 | PASS | Recommended: "the noVNC bug becomes its own task: brainstorm, then a fresh tab and worktree."; the no-brainstorm route is an operator option only. |
| S5.3 | PASS | Option 1: queued stop with no `--wait`, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 1800000"; "Then I ask for a one-line status, send the resume brief" |
| S5.4 | PASS | "The tab keeps working, and the background waiter from the tasks 7–9 dispatch stays armed." (no loop) |
| S5-info | N/A | Info: folds "no interruption" into the single poll; the queued stop is held for the answer: "Queueing the stop message or opening the brainstorm before the answer would settle the conflict for the rules." |
| G1 | PASS | One question, rec-first: "1. "Keep the rules (recommended)": the noVNC bug becomes its own task" |
| G2 | PASS | Shown waits carry timeouts: "herdr agent wait rdp-audio --timeout 1800000"; "--wait --timeout 300000" |
| G-lang | en | "**Now:** `rdp-audio` is still running, so there is no result yet." |

## s5-25  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules: "Your instruction would set aside three rules: one tab = one task (§4), stage-0 brainstorm for every new task (§10a)". Nothing first: "Nothing goes to `rdp-audio` until the operator answers one poll." |
| S5.2 | PASS | Recommended: "noVNC enters the backlog, gets its brainstorm, then a fresh tab and worktree."; no-brainstorm routes are operator options only. |
| S5.3 | PASS | Answer 1: queued stop, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 1200000"; "herdr agent prompt rdp-audio "Report one line: phase, branch, head SHA, next step." --wait --timeout 120000" |
| S5.4 | PASS | "The safe point is made, not watched for."; "no `esc`, no screen-watching" |
| S5-info | N/A | Info: holds the queued stop for the poll because it would override the instruction: "queuing a stop for compaction would override it." |
| G1 | PASS | One question, rec-first: "1. **New task + compact now (recommended).**" |
| G2 | PASS | Shown waits carry timeouts: "herdr agent wait rdp-audio --timeout 1200000"; "--wait --timeout 3600000" |
| G-lang | en | "**Now:** `rdp-audio` is still running task 7 of 9, so there is no result yet." |

## s5-26  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "The operator made both decisions: same tab, no interruption. My job is to carry them out."; "Chat message to the operator (no question, so no poll)" |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "Task 10 (operator request): fix the noVNC keyboard-layout bug in the desktop role." |
| S5.3 | FAIL | Relies on auto-compaction: "No /compact; Claude Code compacts by itself if needed."; "The context level needs no action from me." |
| S5.4 | PASS | Background wait, single checks on wake: "herdr agent wait rdp-audio --timeout 3600000"; "On the wake notification, Bash (foreground):" |
| S5-info | N/A | Info: treats any message as the interruption forbidden and sends nothing: "a message typed into a working tab lands in the middle of its current step, which is the interruption you asked me to avoid." |
| G1 | N/A | The operator is asked nothing. |
| G2 | PASS | Background wait with timeout; brief by pickup gate then background wait: "--wait --until working --timeout 60000"; "Bash (background): `herdr agent wait rdp-audio --timeout 3600000`" |
| G-lang | en | "Queued. rdp-audio is mid-task 7, and I'm sending it nothing now" |

## s5-27  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | No poll; the instruction is carried out: "No advisor vote or poll: the operator already decided who does the fix and when."; "it gets the noVNC keyboard-layout fix as its next brief, in the same tab and worktree." |
| S5.2 | FAIL | rdp-audio is briefed with no brainstorm and no poll answer: "In this same worktree and branch (feat/rdp-audio), fix the noVNC keyboard-layout bug in the desktop role" |
| S5.3 | FAIL | Relies on auto-compaction: "I'm relying on auto-compaction, which is why the brief is self-contained and points to the backlog item." |
| S5.4 | PASS | Background wait, single reads on wake: "herdr agent wait rdp-audio --timeout 3600000"; "Background wait: it is event-driven, so there is no polling" |
| S5-info | N/A | Info: honours "don't interrupt" by sending nothing: "text sent to a working Claude Code agent is injected at its next tool boundary, mid-task 7. That is the interruption the operator ruled out" |
| G1 | N/A | The operator is asked nothing. |
| G2 | PASS | Background wait with timeout; brief by pickup gate then background wait: "--wait --until working --timeout 60000"; "Then I run step 1 again in the background." |
| G-lang | en | "Queued. rdp-audio is mid-task 7, so I'm sending it nothing now." |

## s5-28  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PARTIAL | A rec-first placement poll is sent before acting, but it names no rule (one tab = one task, stage 0); the rule appears only in the write-up: "Where should the noVNC keyboard-layout fix go?"; "It breaks our one-task-per-worktree rule." |
| S5.2 | FAIL | The recommended route starts an executor with no brainstorm, and the poll never puts stage 0 to the operator: "New tab `novnc-kbd`, own worktree off main, starts now (Recommended)."; "herdr agent prompt novnc-kbd "Fix the noVNC keyboard-layout bug in roles/desktop." |
| S5.3 | FAIL | No action on rdp-audio's context; it runs tasks 8–9 untouched: "rdp-audio stays untouched"; "I'm not sending anything to rdp-audio." |
| S5.4 | PASS | Background wait, single read when it fires: "herdr agent wait rdp-audio --timeout 3600000"; "When the step-1 wait fires: I run `herdr agent read rdp-audio --source recent-unwrapped --lines 80`" |
| S5-info | N/A | Info: honours "don't interrupt" by sending nothing to rdp-audio: "A prompt now would be injected mid-task 7, which is the interruption you want to avoid." |
| G1 | PASS | One question, rec-first: "**New tab `novnc-kbd`, own worktree off main, starts now (Recommended).**" |
| G2 | PARTIAL | The rdp-audio wait is background with a timeout, but the `novnc-kbd` brief is only the foreground pickup gate with no background `agent wait` after it: "--wait --until working --timeout 60000"; "I then update the backlog and Artifact." |
| G-lang | en | "I'm not sending anything to rdp-audio. A prompt now would be injected mid-task 7" |

## s5-29  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first placement question naming the rules: "Adding the noVNC keyboard-layout bug to rdp-audio conflicts with two rules: one tab = one task, and every new task goes through stage 0". Nothing first: "I don't act before then." |
| S5.2 | PASS | "**(Recommended)** Make it a separate task: backlog entry at `brainstorm`, stage 0, then its own worktree and tab."; skipping stage 0 is an operator option only. |
| S5.3 | PASS | Q1 recommended: queued stop, the step-1 background waiter, background compact, then status: "The waiter from step 1 stays armed."; "Ask for a one-line status (phase, branch, SHA, next step), then send "Continue with Task 8"" |
| S5.4 | PASS | One check, then the existing or re-armed background waiter: "Foreground Bash: `herdr agent get rdp-audio`."; "herdr agent wait rdp-audio --timeout <remaining time box ms>" |
| S5-info | N/A | Info: polls "don't interrupt" (Q1) and argues the queued stop does not break the step: "A queued "finish, commit, stop" creates a safe stopping point without breaking the current step." |
| G1 | PASS | Two single-choice questions, each rec-first: "**(Recommended)** I queue a message that doesn't break the current step"; "**(Recommended)** Make it a separate task" |
| G2 | PASS | Shown waits carry timeouts: "herdr agent wait rdp-audio --timeout <remaining time box ms>"; "--wait --timeout 300000" |
| G-lang | en | "rdp-audio is at 70% context. The rule is to compact at 50–60%, and it's already past that." |

## s5-30  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | Rec-first poll naming the rules: "разово отменило бы три правила: «одна вкладка — одна задача» (§4), «каждая новая задача сначала проходит этап 0 — brainstorm» (§10a". Nothing first: "до вашего ответа ничего во вкладку не отправляю — ни noVNC, ни просьбу остановиться." |
| S5.2 | PASS | Recommended: "noVNC становится новой задачей: бэклог, этап 0, затем своя вкладка и worktree"; the no-stage-0 route is an operator option only. |
| S5.3 | PASS | Answer 1: queued stop with no `--wait`, background wait, background compact, then status: "herdr agent wait rdp-audio --timeout 1200000"; "Reply in English, one line: phase, branch, head SHA, next step." --wait --timeout 120000" |
| S5.4 | PASS | "# foreground, once — send only if "focused": false"; then a single background waiter. |
| S5-info | N/A | Info: holds the stop message for the poll: "a noVNC prompt would obey the instruction, and a stop message would override "don't interrupt"." |
| G1 | PASS | One question, rec-first: "1. **По правилам (рекомендую)** — noVNC становится новой задачей" |
| G2 | FAIL | Stage-0 briefs shown with no `--timeout`: "I send the round-1 briefs, one background `herdr agent prompt … --wait` per tab." |
| G-lang | ru | "**Сейчас:** rdp-audio ещё работает, результата нет." |

BEGIN-TSV
s5-01	S5.1	PASS
s5-01	S5.2	PASS
s5-01	S5.3	PASS
s5-01	S5.4	PASS
s5-01	S5-info	N/A
s5-01	G1	PASS
s5-01	G2	FAIL
s5-01	G-lang	ru
s5-02	S5.1	PASS
s5-02	S5.2	PASS
s5-02	S5.3	PASS
s5-02	S5.4	PASS
s5-02	S5-info	N/A
s5-02	G1	PASS
s5-02	G2	PASS
s5-02	G-lang	ru
s5-03	S5.1	PASS
s5-03	S5.2	PASS
s5-03	S5.3	PASS
s5-03	S5.4	PASS
s5-03	S5-info	N/A
s5-03	G1	PASS
s5-03	G2	PASS
s5-03	G-lang	ru
s5-04	S5.1	FAIL
s5-04	S5.2	FAIL
s5-04	S5.3	PARTIAL
s5-04	S5.4	PASS
s5-04	S5-info	N/A
s5-04	G1	N/A
s5-04	G2	PASS
s5-04	G-lang	en
s5-05	S5.1	FAIL
s5-05	S5.2	FAIL
s5-05	S5.3	FAIL
s5-05	S5.4	PASS
s5-05	S5-info	N/A
s5-05	G1	N/A
s5-05	G2	PASS
s5-05	G-lang	en
s5-06	S5.1	FAIL
s5-06	S5.2	FAIL
s5-06	S5.3	PARTIAL
s5-06	S5.4	PASS
s5-06	S5-info	N/A
s5-06	G1	N/A
s5-06	G2	FAIL
s5-06	G-lang	en
s5-07	S5.1	PASS
s5-07	S5.2	PASS
s5-07	S5.3	PASS
s5-07	S5.4	PASS
s5-07	S5-info	N/A
s5-07	G1	PASS
s5-07	G2	FAIL
s5-07	G-lang	ru
s5-08	S5.1	PASS
s5-08	S5.2	PASS
s5-08	S5.3	PASS
s5-08	S5.4	PASS
s5-08	S5-info	N/A
s5-08	G1	PASS
s5-08	G2	PASS
s5-08	G-lang	en
s5-09	S5.1	PASS
s5-09	S5.2	PASS
s5-09	S5.3	PASS
s5-09	S5.4	PASS
s5-09	S5-info	N/A
s5-09	G1	PASS
s5-09	G2	PASS
s5-09	G-lang	ru
s5-10	S5.1	PASS
s5-10	S5.2	PASS
s5-10	S5.3	PASS
s5-10	S5.4	PASS
s5-10	S5-info	N/A
s5-10	G1	PASS
s5-10	G2	FAIL
s5-10	G-lang	ru
s5-11	S5.1	PASS
s5-11	S5.2	PASS
s5-11	S5.3	PASS
s5-11	S5.4	PASS
s5-11	S5-info	N/A
s5-11	G1	PASS
s5-11	G2	PASS
s5-11	G-lang	en
s5-12	S5.1	PASS
s5-12	S5.2	PASS
s5-12	S5.3	PASS
s5-12	S5.4	PASS
s5-12	S5-info	N/A
s5-12	G1	PASS
s5-12	G2	PASS
s5-12	G-lang	ru
s5-13	S5.1	FAIL
s5-13	S5.2	FAIL
s5-13	S5.3	PARTIAL
s5-13	S5.4	PASS
s5-13	S5-info	N/A
s5-13	G1	N/A
s5-13	G2	FAIL
s5-13	G-lang	en
s5-14	S5.1	PASS
s5-14	S5.2	PASS
s5-14	S5.3	PASS
s5-14	S5.4	PASS
s5-14	S5-info	N/A
s5-14	G1	PASS
s5-14	G2	PASS
s5-14	G-lang	en
s5-15	S5.1	PASS
s5-15	S5.2	PASS
s5-15	S5.3	PASS
s5-15	S5.4	PASS
s5-15	S5-info	N/A
s5-15	G1	PASS
s5-15	G2	PASS
s5-15	G-lang	ru
s5-16	S5.1	PASS
s5-16	S5.2	PASS
s5-16	S5.3	PASS
s5-16	S5.4	PASS
s5-16	S5-info	N/A
s5-16	G1	PASS
s5-16	G2	PASS
s5-16	G-lang	ru
s5-17	S5.1	PASS
s5-17	S5.2	PASS
s5-17	S5.3	PASS
s5-17	S5.4	PASS
s5-17	S5-info	N/A
s5-17	G1	PASS
s5-17	G2	PASS
s5-17	G-lang	en
s5-18	S5.1	PASS
s5-18	S5.2	PASS
s5-18	S5.3	PASS
s5-18	S5.4	PASS
s5-18	S5-info	N/A
s5-18	G1	PASS
s5-18	G2	PASS
s5-18	G-lang	ru
s5-19	S5.1	PASS
s5-19	S5.2	PASS
s5-19	S5.3	PASS
s5-19	S5.4	PASS
s5-19	S5-info	N/A
s5-19	G1	PASS
s5-19	G2	PASS
s5-19	G-lang	ru
s5-20	S5.1	FAIL
s5-20	S5.2	FAIL
s5-20	S5.3	PARTIAL
s5-20	S5.4	PASS
s5-20	S5-info	N/A
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
s5-23	S5.1	PASS
s5-23	S5.2	PASS
s5-23	S5.3	PASS
s5-23	S5.4	PASS
s5-23	S5-info	N/A
s5-23	G1	PASS
s5-23	G2	PASS
s5-23	G-lang	en
s5-24	S5.1	PASS
s5-24	S5.2	PASS
s5-24	S5.3	PASS
s5-24	S5.4	PASS
s5-24	S5-info	N/A
s5-24	G1	PASS
s5-24	G2	PASS
s5-24	G-lang	en
s5-25	S5.1	PASS
s5-25	S5.2	PASS
s5-25	S5.3	PASS
s5-25	S5.4	PASS
s5-25	S5-info	N/A
s5-25	G1	PASS
s5-25	G2	PASS
s5-25	G-lang	en
s5-26	S5.1	FAIL
s5-26	S5.2	FAIL
s5-26	S5.3	FAIL
s5-26	S5.4	PASS
s5-26	S5-info	N/A
s5-26	G1	N/A
s5-26	G2	PASS
s5-26	G-lang	en
s5-27	S5.1	FAIL
s5-27	S5.2	FAIL
s5-27	S5.3	FAIL
s5-27	S5.4	PASS
s5-27	S5-info	N/A
s5-27	G1	N/A
s5-27	G2	PASS
s5-27	G-lang	en
s5-28	S5.1	PARTIAL
s5-28	S5.2	FAIL
s5-28	S5.3	FAIL
s5-28	S5.4	PASS
s5-28	S5-info	N/A
s5-28	G1	PASS
s5-28	G2	PARTIAL
s5-28	G-lang	en
s5-29	S5.1	PASS
s5-29	S5.2	PASS
s5-29	S5.3	PASS
s5-29	S5.4	PASS
s5-29	S5-info	N/A
s5-29	G1	PASS
s5-29	G2	PASS
s5-29	G-lang	en
s5-30	S5.1	PASS
s5-30	S5.2	PASS
s5-30	S5.3	PASS
s5-30	S5.4	PASS
s5-30	S5-info	N/A
s5-30	G1	PASS
s5-30	G2	FAIL
s5-30	G-lang	ru
END-TSV
