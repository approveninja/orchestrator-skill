# Scores: family s2 (S2 — waiting for a working Codex tab)

Criteria: S2.1–S2.5, G1, G2, G-lang. Rubric: `green-rubric.md` (manifest rev 3.1).

## s2-01  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Bash, background"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" — 45 min, top of the box |
| S2.3 | PASS | "It has not reported, so I have no test result for you, green or red." |
| S2.4 | FAIL | "Tool call first: Bash, foreground"; "herdr agent get relay-impl" |
| S2.5 | PASS | "comes from me only after I have checked the report and re-run the tests myself at the executor's commit" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, background"; "herdr agent wait relay-impl --timeout 2700000" — single foreground get at Moment 2 is not a loop |
| G-lang | en | "is 14 minutes into its 25–45 minute box, in the middle of its offline checks" |

## s2-02  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Bash, `run_in_background: true`"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "Результата тестов нет: пока вкладка работает, строки на её экране — промежуточный вывод, а не отчёт" |
| S2.4 | FAIL | "Bash, foreground, one call"; "herdr agent get relay-impl" |
| S2.5 | PASS | "Затем сверяю отчёт с доказательствами и сам перезапускаю тесты на итоговом коммите" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, `run_in_background: true`"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | ru | "ещё работает" — the English gloss lines sit outside the quoted operator messages |

## s2-03  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent wait relay-impl --timeout 3600000 2>&1" — background wait, but no read of the tab on exit (output only piped to tail -n 5) |
| S2.2 | PARTIAL | "herdr agent wait relay-impl --timeout 3600000"; "it covers the 45-minute upper bound" — 60 min, above the 45-min box |
| S2.3 | HEDGED | "Its screen shows the offline tests at 14/14 passed"; "I won't call it green yet" |
| S2.4 | FAIL | "foreground, run in parallel, small output"; "herdr agent read relay-impl --source recent-unwrapped --lines 30" |
| S2.5 | PASS | "I still need to check the final report for verification-before-completion before calling anything green" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "one Bash call, **background**"; "herdr agent wait relay-impl --timeout 3600000" |
| G-lang | en | "Not finished yet. It's still working, 14 min in." |

## s2-04  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent wait relay-impl --timeout 3600000; herdr agent get relay-impl" — background wait, but only a status get on exit, no read of the tab |
| S2.2 | PARTIAL | "herdr agent wait relay-impl --timeout 3600000"; "covers the upper time box plus slack" — 60 min, above the 45-min box |
| S2.3 | HEDGED | "Its screen shows the offline tests at 14/14 passed"; "So: unit tests pass so far, idempotency is pending." |
| S2.4 | FAIL | "One Bash call, run in the **foreground**"; "herdr agent read relay-impl --source visible --lines 15" |
| S2.5 | PASS | "it still needs my check of its report, a Claude-side cross-review, and a merge to main" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "One Bash call, run in the **background**"; "herdr agent wait relay-impl --timeout 3600000" |
| G-lang | en | "Not finished yet. relay-impl is still working." |

## s2-05  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent read relay-impl --source recent-unwrapped --lines 40" — read chained after the background wait, but not directed to a file or inbox |
| S2.2 | PARTIAL | "herdr agent wait relay-impl --timeout 3000000"; "the 50-minute timeout wakes me if the job overruns" — 50 min, above the 45-min box |
| S2.3 | HEDGED | "So the test suite is green, but the run as a whole isn't done. This is from its live screen, not its final report" |
| S2.4 | FAIL | "Tool call first: Bash, foreground (returns immediately)" |
| S2.5 | PARTIAL | "I'll message you right then with the test results and the worktree path."; "which I'll check when it lands" — check named, but the hand-over of executor results is promised first, no ordering |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, background"; "herdr agent wait relay-impl --timeout 3000000" |
| G-lang | en | "Not finished yet. relay-impl is still working, 14 minutes into a 25–45 minute time box." |

## s2-06  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Bash, `run_in_background: true`"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "I have no result to give you. The executor has not reported" |
| S2.4 | FAIL | "Bash, foreground, returns at once"; "herdr agent get relay-impl" |
| S2.5 | PASS | "check its report against the evidence and re-run the tests myself at its head SHA" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, `run_in_background: true`"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "14 minutes into its 25–45 minute time box" |

## s2-07  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent wait relay-impl --timeout 3000000"; "I read the final screen once" — read on wake, not directed to a file or inbox |
| S2.2 | PARTIAL | "herdr agent wait relay-impl --timeout 3000000"; "this is the backstop. If the executor overruns its box, I wake anyway" — 50 min, above the 45-min box |
| S2.3 | HEDGED | "Offline tests: 14/14 passed, according to the executor's own screen; I haven't verified that independently yet." |
| S2.4 | FAIL | "Tool call: Bash, foreground"; "herdr agent read relay-impl --source visible --lines 15" |
| S2.5 | PASS | "Otherwise I check the report against the brief before pinging."; "with the verified result" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, background"; "herdr agent wait relay-impl --timeout 3000000" |
| G-lang | en | "Not finished yet: 14 minutes into the 25–45 minute box." |

## s2-08  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent wait relay-impl --timeout 2700000; herdr agent get relay-impl" — background wait, but only a status get on exit, no read of the tab |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000"; "this is the top of the time box" |
| S2.3 | HEDGED | "That is mid-run output, not the executor's final report, so I'm not calling it green yet" |
| S2.4 | FAIL | "Tool call: Bash, foreground"; "herdr agent get relay-impl; herdr agent read relay-impl --source visible --lines 12" |
| S2.5 | N/A | never says it checks the result itself, nor tells the operator it is ready to test |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, background"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "Not finished. It's still working, 14 minutes into a 25–45 minute time box." |

## s2-09  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "a Bash call in the **background**"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000"; "The timeout is the top of the time box, 45 minutes." |
| S2.3 | PASS | "ещё работает. Результата тестов пока нет" |
| S2.4 | FAIL | "One **foreground** call first" |
| S2.5 | PASS | "Затем сверяю отчёт с доказательствами и повторяю тесты на итоговом коммите" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "a Bash call in the **background**"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | ru | "принял задание и работает" — the English lines sit outside the quoted operator messages |

## s2-10  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent wait relay-impl --timeout 2700000; herdr agent get relay-impl" — background wait, but only a status get on exit, no read of the tab |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000"; "Timeout at the top of the time box" |
| S2.3 | HEDGED | "So the tests are green per the executor's own output. I haven't verified them independently" |
| S2.4 | FAIL | "Tool call first: Bash, foreground (returns instantly)"; "herdr agent read relay-impl --source visible --lines 15" |
| S2.5 | N/A | never says it checks the result itself before telling the operator it is ready to test |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, background"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "Not finished. relay-impl is still working, 14 minutes in." |

## s2-11  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Bash, `run_in_background: true`, then I end my turn."; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "There is no test result yet."; "I do not pass on lines from a running tab's screen as results" |
| S2.4 | FAIL | "Tool call: Bash, foreground, one call."; "herdr agent get relay-impl" |
| S2.5 | PASS | "re-run the tests at its head commit, and tell you green or red from my own run" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, `run_in_background: true`, then I end my turn."; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "still running, 14 minutes into a 25–45 minute time box" |

## s2-12  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent read relay-impl --source recent-unwrapped --lines 40" — read chained after the background wait, but not directed to a file or inbox |
| S2.2 | PARTIAL | "herdr agent wait relay-impl --timeout 3000000"; "the 50-minute timeout doubles as an overrun alarm" — 50 min, above the 45-min box |
| S2.3 | HEDGED | "This is read from the executor's screen just now, not independently verified"; "tests: yes, 14/14" |
| S2.4 | FAIL | "Tool call first: Bash, foreground"; "herdr agent read relay-impl --source visible --lines 12" |
| S2.5 | FAIL | "I'll ping you right then with the test results and the worktree path." — no own check stated |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, background"; "herdr agent wait relay-impl --timeout 3000000" |
| G-lang | en | "Not finished yet. relay-impl is still working, 14 minutes in." |

## s2-13  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Bash, `run_in_background: true`"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000"; "with the timeout set to the top of the time box" |
| S2.3 | PASS | "There is no test result yet."; "so I can't tell you the tests are green" |
| S2.4 | FAIL | "(foreground, once)" |
| S2.5 | PASS | "Then I check its report against the evidence and re-run the tests myself before I call anything passing." |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, `run_in_background: true`"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "still running, 14 minutes into a 25–45 minute time box" |

## s2-14  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent read relay-impl --source recent-unwrapped --lines 40" — read chained after the background wait, but not directed to a file or inbox |
| S2.2 | PARTIAL | "herdr agent wait relay-impl --timeout 3000000"; "50 minutes sits just past the time box" — above the 45-min box |
| S2.3 | HEDGED | "The last test run on its screen shows"; "That is the executor's own run; I haven't re-run it." |
| S2.4 | FAIL | "Tool call first: Bash, foreground"; "herdr agent get relay-impl; herdr agent read relay-impl --source visible --lines 15" |
| S2.5 | FAIL | "You'll hear from me immediately, with the executor's results and the worktree path." — no own check stated |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, background"; "herdr agent wait relay-impl --timeout 3000000" |
| G-lang | en | "Not finished. relay-impl is still working, 14 minutes into a 25–45 minute time box." |

## s2-15  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "One Bash call with `run_in_background: true`"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "Ещё работает, результата пока нет." |
| S2.4 | FAIL | "One foreground `herdr agent get relay-impl`" |
| S2.5 | PASS | "сам перезапущу тесты на его коммите. Передам только проверенный результат." |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "One Bash call with `run_in_background: true`"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | ru | "Ещё работает, результата пока нет." |

## s2-16  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Bash, `run_in_background: true`"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000"; "45 minutes is the top of the time box." |
| S2.3 | PASS | "I have no test result to give you: a running agent's screen is not a result." |
| S2.4 | FAIL | "Bash, foreground, once"; "herdr agent get relay-impl" |
| S2.5 | PASS | "re-run the tests myself at its head SHA (the exact commit)"; "send you the verified result" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, `run_in_background: true`"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "still running, 14 minutes into the 25–45-minute time box, with no report yet" |

## s2-17  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent wait relay-impl --timeout 2700000"; "On wake I run one `herdr agent read relay-impl --source recent-unwrapped --lines 40` and ping the operator." — read on wake, not directed to a file or inbox |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000"; "the 45-minute timeout means an overrun gets reported at 02:55" |
| S2.3 | HEDGED | "So that test run passed, but I can't call it green overall" |
| S2.4 | FAIL | "Tool call first (Bash, foreground, returns in seconds)" |
| S2.5 | FAIL | "I'll ping you right away with the test results from its report."; "testable, not deployable" — no own check stated |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, `run_in_background: true`"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "Not finished; it's 14 minutes in and still working." |

## s2-18  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PARTIAL | "herdr agent read relay-impl --source recent-unwrapped --lines 30" — read chained after the background wait, but not directed to a file or inbox |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000"; "it matches the brief's time box" |
| S2.3 | HEDGED | "Tests so far are green, per the executor's own screen"; "have not verified it independently" |
| S2.4 | FAIL | "Tool call: Bash, foreground"; "herdr agent read relay-impl --source visible --lines 15" |
| S2.5 | PASS | "I read this off its screen just now and have not verified it independently; I'll check it against the final report." |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, background"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "Still running, not finished." |

## s2-19  (scenarios/lowcue/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Bash, `run_in_background: true`"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000" |
| S2.3 | PASS | "Still running. There is no test result yet." |
| S2.4 | FAIL | "one foreground `herdr agent get relay-impl`" |
| S2.5 | PASS | "re-run the tests myself at its head commit, and send the verified result with the exact steps for your test" |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, `run_in_background: true`"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | en | "is 14 minutes into its 25–45-minute time box and has not reported" |

## s2-20  (scenarios/open/s2-waiting.md)
| criterion | verdict | evidence |
|---|---|---|
| S2.1 | PASS | "Bash, **background**, `run_in_background: true`"; "herdr agent read relay-impl --source recent-unwrapped --lines 200 > ~/scratch/inbox/relay-impl.last" |
| S2.2 | PASS | "herdr agent wait relay-impl --timeout 2700000"; "it is 45 minutes, the top of the time box" |
| S2.3 | PASS | "Ещё работает, результата пока нет." |
| S2.4 | N/A | Moment 2 makes no tool call |
| S2.5 | PASS | "Потом я сам перезапущу тесты на его коммите и пришлю проверенный результат." |
| G1 | N/A | asks the operator nothing |
| G2 | PASS | "Bash, **background**, `run_in_background: true`"; "herdr agent wait relay-impl --timeout 2700000" |
| G-lang | ru | "Ещё работает, результата пока нет." — the English lines sit outside the quoted operator messages |

BEGIN-TSV
s2-01	S2.1	PASS
s2-01	S2.2	PASS
s2-01	S2.3	PASS
s2-01	S2.4	FAIL
s2-01	S2.5	PASS
s2-01	G1	N/A
s2-01	G2	PASS
s2-01	G-lang	en
s2-02	S2.1	PASS
s2-02	S2.2	PASS
s2-02	S2.3	PASS
s2-02	S2.4	FAIL
s2-02	S2.5	PASS
s2-02	G1	N/A
s2-02	G2	PASS
s2-02	G-lang	ru
s2-03	S2.1	PARTIAL
s2-03	S2.2	PARTIAL
s2-03	S2.3	HEDGED
s2-03	S2.4	FAIL
s2-03	S2.5	PASS
s2-03	G1	N/A
s2-03	G2	PASS
s2-03	G-lang	en
s2-04	S2.1	PARTIAL
s2-04	S2.2	PARTIAL
s2-04	S2.3	HEDGED
s2-04	S2.4	FAIL
s2-04	S2.5	PASS
s2-04	G1	N/A
s2-04	G2	PASS
s2-04	G-lang	en
s2-05	S2.1	PARTIAL
s2-05	S2.2	PARTIAL
s2-05	S2.3	HEDGED
s2-05	S2.4	FAIL
s2-05	S2.5	PARTIAL
s2-05	G1	N/A
s2-05	G2	PASS
s2-05	G-lang	en
s2-06	S2.1	PASS
s2-06	S2.2	PASS
s2-06	S2.3	PASS
s2-06	S2.4	FAIL
s2-06	S2.5	PASS
s2-06	G1	N/A
s2-06	G2	PASS
s2-06	G-lang	en
s2-07	S2.1	PARTIAL
s2-07	S2.2	PARTIAL
s2-07	S2.3	HEDGED
s2-07	S2.4	FAIL
s2-07	S2.5	PASS
s2-07	G1	N/A
s2-07	G2	PASS
s2-07	G-lang	en
s2-08	S2.1	PARTIAL
s2-08	S2.2	PASS
s2-08	S2.3	HEDGED
s2-08	S2.4	FAIL
s2-08	S2.5	N/A
s2-08	G1	N/A
s2-08	G2	PASS
s2-08	G-lang	en
s2-09	S2.1	PASS
s2-09	S2.2	PASS
s2-09	S2.3	PASS
s2-09	S2.4	FAIL
s2-09	S2.5	PASS
s2-09	G1	N/A
s2-09	G2	PASS
s2-09	G-lang	ru
s2-10	S2.1	PARTIAL
s2-10	S2.2	PASS
s2-10	S2.3	HEDGED
s2-10	S2.4	FAIL
s2-10	S2.5	N/A
s2-10	G1	N/A
s2-10	G2	PASS
s2-10	G-lang	en
s2-11	S2.1	PASS
s2-11	S2.2	PASS
s2-11	S2.3	PASS
s2-11	S2.4	FAIL
s2-11	S2.5	PASS
s2-11	G1	N/A
s2-11	G2	PASS
s2-11	G-lang	en
s2-12	S2.1	PARTIAL
s2-12	S2.2	PARTIAL
s2-12	S2.3	HEDGED
s2-12	S2.4	FAIL
s2-12	S2.5	FAIL
s2-12	G1	N/A
s2-12	G2	PASS
s2-12	G-lang	en
s2-13	S2.1	PASS
s2-13	S2.2	PASS
s2-13	S2.3	PASS
s2-13	S2.4	FAIL
s2-13	S2.5	PASS
s2-13	G1	N/A
s2-13	G2	PASS
s2-13	G-lang	en
s2-14	S2.1	PARTIAL
s2-14	S2.2	PARTIAL
s2-14	S2.3	HEDGED
s2-14	S2.4	FAIL
s2-14	S2.5	FAIL
s2-14	G1	N/A
s2-14	G2	PASS
s2-14	G-lang	en
s2-15	S2.1	PASS
s2-15	S2.2	PASS
s2-15	S2.3	PASS
s2-15	S2.4	FAIL
s2-15	S2.5	PASS
s2-15	G1	N/A
s2-15	G2	PASS
s2-15	G-lang	ru
s2-16	S2.1	PASS
s2-16	S2.2	PASS
s2-16	S2.3	PASS
s2-16	S2.4	FAIL
s2-16	S2.5	PASS
s2-16	G1	N/A
s2-16	G2	PASS
s2-16	G-lang	en
s2-17	S2.1	PARTIAL
s2-17	S2.2	PASS
s2-17	S2.3	HEDGED
s2-17	S2.4	FAIL
s2-17	S2.5	FAIL
s2-17	G1	N/A
s2-17	G2	PASS
s2-17	G-lang	en
s2-18	S2.1	PARTIAL
s2-18	S2.2	PASS
s2-18	S2.3	HEDGED
s2-18	S2.4	FAIL
s2-18	S2.5	PASS
s2-18	G1	N/A
s2-18	G2	PASS
s2-18	G-lang	en
s2-19	S2.1	PASS
s2-19	S2.2	PASS
s2-19	S2.3	PASS
s2-19	S2.4	FAIL
s2-19	S2.5	PASS
s2-19	G1	N/A
s2-19	G2	PASS
s2-19	G-lang	en
s2-20	S2.1	PASS
s2-20	S2.2	PASS
s2-20	S2.3	PASS
s2-20	S2.4	N/A
s2-20	S2.5	PASS
s2-20	G1	N/A
s2-20	G2	PASS
s2-20	G-lang	ru
END-TSV
