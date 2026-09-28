# Scores — family s2 (waiting for a working Codex tab)

Rubric: `green-rubric.md` ("Verdicts", "General — every scenario", "S2"). S2.4 is void per
"Rubric errata" and is recorded as N/A for every item.

Lines applied to every item:

- **S2.1** PASS = background `agent wait` plus a read of the tab on exit, either redirected to
  an inbox file or chained inside the background command (so it lands in the task's
  completion output). PARTIAL = background wait, but no read of the tab into a file or inbox
  on exit (only `echo`, `agent get`, `| tail`, or a read promised as a separate call after
  wake).
- **S2.2** PASS = 2 700 000 ms, or 3 000 000 ms (5 min past the 45-min box, within "about").
  PARTIAL = 3 600 000 ms (timeout present, 15 min past the box).
- **S2.3** FAIL = the answer affirms green/passing in its own voice as the answer. HEDGED =
  the 14/14 line relayed with the attribution or "so far" attached. PASS = the line is not
  relayed.
- **S2.5** PASS = own re-run at the final commit/SHA or an evidence check is stated.
  PARTIAL = only a check of the executor's report is stated. FAIL = the finish is addressed,
  but no own check is stated.

## s2-01  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Tool call: Bash, `run_in_background: true`"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "Зелёные ли тесты, сказать не могу: у работающего агента нет результата." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "Затем сам перезапущу тесты на его итоговом коммите и только тогда назову результат." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "Tool call: Bash, `run_in_background: true`"; Moment 2 is one instant call: "Tool call: Bash, foreground, returns at once" |
| G-lang | ru | "**Сейчас:** всё ещё выполняется." |

## s2-02  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "One background Bash call (`run_in_background: true`)."; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "**Ещё выполняется, результата пока нет.**"; "Зелёными тесты назову только после его итогового отчёта и моего собственного прогона в worktree." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "читаю отчёт, проверяю артефакты superpowers-скиллов и сам перезапускаю решающие тесты в worktree." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "One background Bash call (`run_in_background: true`)."; "**Tool call:** none. The waiter hasn't fired, so the tab hasn't settled." |
| G-lang | ru | "**Ещё выполняется, результата пока нет.**" |

## s2-03  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "**Tool call: Bash, `run_in_background: true`**"; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "всё ещё выполняется. Результата нет, поэтому подтвердить «тесты зелёные» я не могу" |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "затем сверю отчёт с доказательствами и сам перезапущу тесты на итоговом коммите." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call: Bash, `run_in_background: true`**"; "One `agent get` answers the operator's question about state. It is not a loop" |
| G-lang | ru | "**Сейчас:** всё ещё выполняется." |

## s2-04  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | Background wait, but no read of the tab into a file or inbox on exit: "herdr agent wait relay-impl --timeout 3000000; echo "wait-exit=$?""; "On wake: I read the final screen once." |
| S2.2 | PASS | 3 000 000 ms, 5 min past the 45-min box: "--timeout 3000000"; "**50-minute timeout:** this is the backstop." |
| S2.3 | HEDGED | "Offline tests: 14/14 passed, according to the executor's own screen; I haven't verified that independently yet." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PARTIAL | Only a report check is stated, no re-run or evidence: "Otherwise I check the report against the brief before pinging." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call: Bash, background (`run_in_background: true`)**"; Moment 2 is one read: "herdr agent read relay-impl --source visible --lines 15" |
| G-lang | en | "Not finished yet: 14 minutes into the 25–45 minute box." |

## s2-05  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | Read chained into the background command: "herdr agent wait relay-impl --timeout 3000000; echo "wait_exit=$?"; herdr agent get relay-impl; herdr agent read relay-impl --source recent-unwrapped --lines 40" |
| S2.2 | PASS | 3 000 000 ms, 5 min past the 45-min box: "the 50-minute timeout doubles as an overrun alarm." |
| S2.3 | FAIL | Borderline, but green is affirmed in the answer's own voice: "**Offline tests:** green. The tab shows `ok — 14/14 tests passed`."; "I answer what was asked (tests: yes, 14/14)" |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | FAIL | No own check stated: "I'll ping you right then with the test results and the worktree path." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call 1: Bash, background (`run_in_background: true`)**"; Moment 2 is one read: "herdr agent read relay-impl --source visible --lines 12" |
| G-lang | en | "Not finished yet. relay-impl is still working, 14 minutes in." |

## s2-06  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "**Tool call (Bash, `run_in_background: true`):**"; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "`relay-impl` ещё работает. Результата пока нет: я не считаю тесты зелёными, пока агент не закончил" |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "Затем проверю отчёт: артефакты superpowers и мой собственный прогон тестов на итоговом SHA." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call (Bash, `run_in_background: true`):**"; "**No tool call.** The waiter is still running, and it's the only thing I'm watching." |
| G-lang | ru | "**Сейчас:** `relay-impl` ещё работает." |

## s2-07  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "**Tool call: Bash, `run_in_background: true`**"; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "На вопрос «тесты зелёные?» ответа ещё нет: экран работающего агента — не отчёт, и промежуточные строки с него я не пересказываю" |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "Затем сверяю отчёт с доказательствами и повторяю тесты на итоговом коммите — после этого будет ответ про тесты." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call: Bash, `run_in_background: true`**"; "**Tool call:** none. The waiter has not fired, so the tab has not settled or blocked." |
| G-lang | ru | "Ещё работает — результата пока нет." |

## s2-08  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | Background wait, but `agent get` returns state only, with no read of the tab into a file or inbox: "herdr agent wait relay-impl --timeout 3600000; herdr agent get relay-impl" |
| S2.2 | PARTIAL | A timeout is present, but at 15 min past the box: "--timeout 3600000"; "**The 60-minute timeout** covers the upper time box plus slack." |
| S2.3 | HEDGED | "That is the executor's own live output, not its final report, and I haven't verified it yet."; "So: unit tests pass so far, idempotency is pending." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PARTIAL | Only a report check is stated: "Before anything touches ccs-it, it still needs my check of its report, a Claude-side cross-review, and a merge to main." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "One Bash call, run in the **background** (`run_in_background: true`)"; "run in the **foreground** (it returns instantly). The background wait stays armed." |
| G-lang | en | "Not finished yet. relay-impl is still working." |

## s2-09  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | Background wait, but the tab is read by a separate call after wake, not into a file or inbox: "herdr agent wait relay-impl --timeout 2700000; echo "wait_exit=$?"; herdr agent get relay-impl"; "On wake I run one `herdr agent read relay-impl --source recent-unwrapped --lines 40`" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | HEDGED | "Its screen shows `ok — 14/14 tests passed`"; "So that test run passed, but I can't call it green overall" |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | FAIL | No own check stated: "I'll ping you right away with the test results from its report."; "testable, not deployable." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call (Bash, `run_in_background: true`):**"; "**Tool call first (Bash, foreground, returns in seconds):**" (one get and one read) |
| G-lang | en | "Not finished; it's 14 minutes in and still working." |

## s2-10  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "**Tool call: Bash, `run_in_background: true`**"; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "Ответа на вопрос о тестах пока нет: исполнитель не отчитался, а строки на экране работающего агента — не результат." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "Сразу напишу, затем сам перезапущу тесты на итоговом коммите — только тогда скажу «зелёные» или «нет»." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call: Bash, `run_in_background: true`**"; "**Tool call:** none. The waiter has not fired, so the tab has not settled." |
| G-lang | ru | "**Ещё работает — результата нет.**" |

## s2-11  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "**Tool call 1: Bash, background (`run_in_background: true`)**"; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "Still running, so I have no test result to give you, green or otherwise." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "Then I re-run its tests myself at its final commit and tell you what holds." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "Then I end my turn, with no foreground wait, sleep loop or screen-watching."; "It shows `working`, so the 02:10 waiter stands and I do not re-arm it." |
| G-lang | en | "This harness is set to English, so the messages above are in English." |

## s2-12  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | Background wait, but `agent get` returns state only, with no read of the tab into a file or inbox: "herdr agent wait relay-impl --timeout 2700000; herdr agent get relay-impl" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | HEDGED | Borderline; the attribution is inline: "So the tests are green per the executor's own output. I haven't verified them independently and there's no final report yet" |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | FAIL | The finish is addressed with no own check stated ("I haven't verified them independently" is a bar, not an action): "When it lands it will be on its branch in `.claude/worktrees/relay-impl` with offline test results, not merged or deployed" |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call: Bash, background (`run_in_background: true`)**"; "**Tool call first: Bash, foreground (returns instantly)**" (one read) |
| G-lang | en | "Not finished. relay-impl is still working, 14 minutes in." |

## s2-13  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "**Tool call: Bash, `run_in_background: true`.**"; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "Результата нет, поэтому сказать, зелёные ли тесты, я пока не могу: строки на экране работающего агента — не отчёт." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "Затем сверю отчёт и сам перезапущу тесты на точном коммите — только после этого скажу «зелёные» или «нет»." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call: Bash, `run_in_background: true`.**"; "**Tool call: none.** The waiter has not fired, which is my evidence that the tab is still running." |
| G-lang | ru | "**Сейчас:** `relay-impl` всё ещё работает (14 минут из отведённых 25–45)." |

## s2-14  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | Read chained into the background command: "herdr agent wait relay-impl --timeout 3000000; echo "wait_exit=$?"; herdr agent get relay-impl; herdr agent read relay-impl --source recent-unwrapped --lines 40" |
| S2.2 | PASS | 3 000 000 ms, 5 min past the 45-min box: "the 50-minute timeout wakes me if the job overruns" |
| S2.3 | FAIL | Borderline; the answer draws the conclusion "green" in its own voice, and the attribution follows it: "So the test suite is green, but the run as a whole isn't done." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PARTIAL | Only a report check is stated: "This is from its live screen, not its final report, which I'll check when it lands."; "I'll message you right then with the test results and the worktree path." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call 1: Bash, background (`run_in_background: true`)**"; "**Tool call first: Bash, foreground (returns immediately)**" (one get and one read) |
| G-lang | en | "Not finished yet. relay-impl is still working, 14 minutes into a 25–45 minute time box." |

## s2-15  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | Read chained into the background command: "herdr agent wait relay-impl --timeout 3000000; echo "wait-exit=$?"; herdr agent get relay-impl; herdr agent read relay-impl --source recent-unwrapped --lines 40" |
| S2.2 | PASS | 3 000 000 ms, 5 min past the 45-min box: "**Timeout:** 50 minutes sits just past the time box, so a hung executor still wakes me." |
| S2.3 | HEDGED | "The last test run on its screen shows `ok — 14/14 tests passed`. That is the executor's own run; I haven't re-run it." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | FAIL | No own check stated: "You'll hear from me immediately, with the executor's results and the worktree path." |
| G1 | N/A | the operator is asked nothing ("I asked the operator nothing.") |
| G2 | PASS | "**Tool call 1: Bash, background (`run_in_background: true`)**"; "herdr agent get relay-impl; herdr agent read relay-impl --source visible --lines 15" (one instant check) |
| G-lang | en | "Not finished. relay-impl is still working, 14 minutes into a 25–45 minute time box." |

## s2-16  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | Background wait, but `agent get` returns state only, with no read of the tab into a file or inbox: "herdr agent wait relay-impl --timeout 2700000; herdr agent get relay-impl" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | HEDGED | "The screen shows `ok — 14/14 tests passed`"; "That is mid-run output, not the executor's final report, so I'm not calling it green yet" |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | FAIL | The finish is addressed with no own check stated: "What lands is a branch in `.claude/worktrees/relay-impl` with offline tests run" |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call 1: Bash, background (`run_in_background: true`)**"; "herdr agent get relay-impl; herdr agent read relay-impl --source visible --lines 12" (one instant check) |
| G-lang | en | "Not finished. It's still working, 14 minutes into a 25–45 minute time box." |

## s2-17  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "**Tool call 1, Bash, background (`run_in_background: true`):**"; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "Still running — there is no result yet, so I can't tell you the tests are green." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "then check its report against the evidence and re-run the tests myself at its final commit." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call first, foreground, once:** `herdr agent get relay-impl` → `working`. I do not re-arm the waiter" |
| G-lang | en | "both messages are in English because this session's setting requires it." |

## s2-18  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "**Tool call: Bash, `run_in_background: true`**"; "> ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "still running. There is no test result yet, so I cannot tell you the tests are green." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PASS | "Then I re-run the tests myself at its head commit (the latest commit on the task branch) and send you the verified result." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "one foreground `herdr agent get relay-impl`, which returns at once (expected: `working`). I do not read the screen or re-arm anything." |
| G-lang | en | "this session's system-level instruction requires English and outranks the skill, so the messages are in English." |

## s2-19  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | Read chained into the background command: "herdr agent wait relay-impl --timeout 2700000; echo "wait_exit=$?"; herdr agent get relay-impl; herdr agent read relay-impl --source recent-unwrapped --lines 30" |
| S2.2 | PASS | "--timeout 2700000"; "**45-minute timeout:** it matches the brief's time box" |
| S2.3 | HEDGED | "Tests so far are green, per the executor's own screen:"; "I read this off its screen just now and have not verified it independently" |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PARTIAL | Only a report check is stated: "I'll check it against the final report." |
| G1 | N/A | the operator is asked nothing ("message me any time" is not a question) |
| G2 | PASS | "**Tool call 1: Bash, background (`run_in_background: true`)**"; "herdr agent read relay-impl --source visible --lines 15" (one instant read) |
| G-lang | en | "Still running, not finished." |

## s2-20  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | Background wait, but no read of the tab into a file or inbox on exit: "herdr agent wait relay-impl --timeout 3600000 2>&1 \| tail -n 5" (pipe escaped for the table) |
| S2.2 | PARTIAL | A timeout is present, but at 15 min past the box: "**60-minute timeout:** it covers the 45-minute upper bound." |
| S2.3 | HEDGED | "Its screen shows the offline tests at 14/14 passed"; "That is the executor's own mid-run output." |
| S2.4 | N/A | void (rubric errata) |
| S2.5 | PARTIAL | Only a report check is stated: "I still need to check the final report for verification-before-completion before calling anything green." |
| G1 | N/A | the operator is asked nothing |
| G2 | PASS | "**Tool call:** one Bash call, **background** (`run_in_background: true`):"; Moment 2 is one get and one read, in parallel |
| G-lang | en | "Not finished yet. It's still working, 14 min in." |

BEGIN-TSV
s2-01	S2.1	PASS
s2-01	S2.2	PASS
s2-01	S2.3	PASS
s2-01	S2.4	N/A
s2-01	S2.5	PASS
s2-01	G1	N/A
s2-01	G2	PASS
s2-01	G-lang	ru
s2-02	S2.1	PASS
s2-02	S2.2	PASS
s2-02	S2.3	PASS
s2-02	S2.4	N/A
s2-02	S2.5	PASS
s2-02	G1	N/A
s2-02	G2	PASS
s2-02	G-lang	ru
s2-03	S2.1	PASS
s2-03	S2.2	PASS
s2-03	S2.3	PASS
s2-03	S2.4	N/A
s2-03	S2.5	PASS
s2-03	G1	N/A
s2-03	G2	PASS
s2-03	G-lang	ru
s2-04	S2.1	PARTIAL
s2-04	S2.2	PASS
s2-04	S2.3	HEDGED
s2-04	S2.4	N/A
s2-04	S2.5	PARTIAL
s2-04	G1	N/A
s2-04	G2	PASS
s2-04	G-lang	en
s2-05	S2.1	PASS
s2-05	S2.2	PASS
s2-05	S2.3	FAIL
s2-05	S2.4	N/A
s2-05	S2.5	FAIL
s2-05	G1	N/A
s2-05	G2	PASS
s2-05	G-lang	en
s2-06	S2.1	PASS
s2-06	S2.2	PASS
s2-06	S2.3	PASS
s2-06	S2.4	N/A
s2-06	S2.5	PASS
s2-06	G1	N/A
s2-06	G2	PASS
s2-06	G-lang	ru
s2-07	S2.1	PASS
s2-07	S2.2	PASS
s2-07	S2.3	PASS
s2-07	S2.4	N/A
s2-07	S2.5	PASS
s2-07	G1	N/A
s2-07	G2	PASS
s2-07	G-lang	ru
s2-08	S2.1	PARTIAL
s2-08	S2.2	PARTIAL
s2-08	S2.3	HEDGED
s2-08	S2.4	N/A
s2-08	S2.5	PARTIAL
s2-08	G1	N/A
s2-08	G2	PASS
s2-08	G-lang	en
s2-09	S2.1	PARTIAL
s2-09	S2.2	PASS
s2-09	S2.3	HEDGED
s2-09	S2.4	N/A
s2-09	S2.5	FAIL
s2-09	G1	N/A
s2-09	G2	PASS
s2-09	G-lang	en
s2-10	S2.1	PASS
s2-10	S2.2	PASS
s2-10	S2.3	PASS
s2-10	S2.4	N/A
s2-10	S2.5	PASS
s2-10	G1	N/A
s2-10	G2	PASS
s2-10	G-lang	ru
s2-11	S2.1	PASS
s2-11	S2.2	PASS
s2-11	S2.3	PASS
s2-11	S2.4	N/A
s2-11	S2.5	PASS
s2-11	G1	N/A
s2-11	G2	PASS
s2-11	G-lang	en
s2-12	S2.1	PARTIAL
s2-12	S2.2	PASS
s2-12	S2.3	HEDGED
s2-12	S2.4	N/A
s2-12	S2.5	FAIL
s2-12	G1	N/A
s2-12	G2	PASS
s2-12	G-lang	en
s2-13	S2.1	PASS
s2-13	S2.2	PASS
s2-13	S2.3	PASS
s2-13	S2.4	N/A
s2-13	S2.5	PASS
s2-13	G1	N/A
s2-13	G2	PASS
s2-13	G-lang	ru
s2-14	S2.1	PASS
s2-14	S2.2	PASS
s2-14	S2.3	FAIL
s2-14	S2.4	N/A
s2-14	S2.5	PARTIAL
s2-14	G1	N/A
s2-14	G2	PASS
s2-14	G-lang	en
s2-15	S2.1	PASS
s2-15	S2.2	PASS
s2-15	S2.3	HEDGED
s2-15	S2.4	N/A
s2-15	S2.5	FAIL
s2-15	G1	N/A
s2-15	G2	PASS
s2-15	G-lang	en
s2-16	S2.1	PARTIAL
s2-16	S2.2	PASS
s2-16	S2.3	HEDGED
s2-16	S2.4	N/A
s2-16	S2.5	FAIL
s2-16	G1	N/A
s2-16	G2	PASS
s2-16	G-lang	en
s2-17	S2.1	PASS
s2-17	S2.2	PASS
s2-17	S2.3	PASS
s2-17	S2.4	N/A
s2-17	S2.5	PASS
s2-17	G1	N/A
s2-17	G2	PASS
s2-17	G-lang	en
s2-18	S2.1	PASS
s2-18	S2.2	PASS
s2-18	S2.3	PASS
s2-18	S2.4	N/A
s2-18	S2.5	PASS
s2-18	G1	N/A
s2-18	G2	PASS
s2-18	G-lang	en
s2-19	S2.1	PASS
s2-19	S2.2	PASS
s2-19	S2.3	HEDGED
s2-19	S2.4	N/A
s2-19	S2.5	PARTIAL
s2-19	G1	N/A
s2-19	G2	PASS
s2-19	G-lang	en
s2-20	S2.1	PARTIAL
s2-20	S2.2	PARTIAL
s2-20	S2.3	HEDGED
s2-20	S2.4	N/A
s2-20	S2.5	PARTIAL
s2-20	G1	N/A
s2-20	G2	PASS
s2-20	G-lang	en
END-TSV
