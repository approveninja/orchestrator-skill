# Scores — family S5 (a tab at 70% context mid-TDD)

Rubric: `green-rubric.md`, sections "Verdicts", "General — every scenario", "S5". 20 items.

## s5-01  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "Nothing about noVNC goes to `rdp-audio`, and no `esc`." ; "The noVNC bug is in the backlog as T<n>, status `brainstorm`." |
| S5.2 | PASS | "Round 1 of the design brainstorm is running in two advisor tabs." ; waiver only by poll: "Run the brainstorm (Recommended)" |
| S5.3 | PASS | Queued (no `--wait`): "Finish task 7 (GREEN, verification), commit, then stop before task 8 and report" ; then background waiter `--timeout 1200000`, background compact: "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" --wait --timeout 300000 ; then a one-line status check. |
| S5.4 | PASS | "the tab is already working, so a background `agent wait` is the right waiter, with no foreground blocking or polling." |
| S5-info | info | Keeps the no-interruption request for the running step (no Esc), pauses at the task boundary and tells the operator: "I kept to it for the current work, with no `esc` and no new work. I still pause the tab at the task boundary" |
| G1 | PASS | "T<n> (noVNC keyboard-layout bug): run the design brainstorm or waive it?" ; first option "Run the brainstorm (Recommended)" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" ; briefs by background `herdr agent prompt prod-codex "$(cat "$S/brainstorm/T<n>/brief-r1-A.txt")" --wait --timeout 1800000` |
| G-lang | en | "Operator-facing texts below are in English because this session's language setting requires it" |

## s5-02  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "баг заведён отдельной задачей `novnc-kbd` (brainstorm)." ; "this is its own task, not part of rdp-audio" |
| S5.2 | PASS | "It goes into the backlog, through stage 0, and later gets its own tab, worktree and `fix/` branch." ; "Два продуктовых советника уже начали раунд 1." |
| S5.3 | PASS | Queued, no `--wait`: "Finish the current step (Task 7: GREEN, its verification, commit), then stop before Task 8 and report in English" ; then background waiter `--timeout 1800000`, "Background: `herdr agent prompt rdp-audio "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" --wait --timeout 300000`", then the one-line status. |
| S5.4 | PASS | "The waiter is `agent wait` because the tab is already working. Everything runs in the background so my session doesn't block." |
| S5-info | info | A queued boundary message is argued not to be an interrupt, and the operator is told: "A queued message isn't an interrupt: Task 7 still finishes and commits, and the tab only pauses at a point I chose." ; "Я её не прерываю: в очереди сообщение «закончи задачу 7, закоммить, остановись»." |
| G1 | N/A | The operator is asked nothing (status only; it tells the operator nothing is needed from them). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" ; `herdr agent prompt pa-codex "$(cat "$SCRATCH/brainstorm/novnc-kbd/brief-r1-A.txt")" --wait --timeout 2700000` |
| G-lang | ru | "rdp-audio ещё работает (задача 7 из 9: RED получен, идёт реализация), результата пока нет." (the English "In short" paragraph is a gloss for the reader) |

## s5-03  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PARTIAL | Own worktree and branch, disclosed to the operator, but the fix goes to the `rdp-audio` tab; no poll, the operator's words are not recorded verbatim, no rule named as set aside: "Same agent, as you asked, but in its own worktree and branch (`fix/novnc-kbd-layout` off main), not on `feat/rdp-audio`." ; "Assigned to rdp-audio after its tasks 7–9." |
| S5.2 | FAIL | No stage 0 and no waiver poll: "No advisor vote and no poll." ; executor brief: "Skills, in order: superpowers:systematic-debugging (root cause before any edit)" |
| S5.3 | PARTIAL | Compaction at a real safe point (after task 9, idle), but no queued boundary message, tasks 8–9 run at 70%, no one-line status check: "When it finishes and its 7–9 report checks out, I'll /compact it and give it the noVNC keyboard-layout fix." |
| S5.4 | PASS | "A background wait is event-driven and leaves my session free" (re-arming on timeout is not a screen/HEAD/get loop) |
| S5-info | info | Reconciles by sending nothing until the tab settles: "Waiting is the only way to not interrupt it." |
| G1 | N/A | The operator is asked nothing; the chat message is a statement. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 590000" ; hand-overs use "--wait --until working --timeout 30000" followed by "Then re-arm step 1." |
| G-lang | en | "I won't touch rdp-audio now." |

## s5-04  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Planned into the `rdp-audio` tab, worktree and branch; no poll, no verbatim record, no rule named: "The noVNC keyboard-layout fix is queued for the same tab and worktree" ; "It will land as separate commits on `feat/rdp-audio`." |
| S5.2 | FAIL | "The operator already decided both points, so there is no advisor vote and no poll" ; "Then use superpowers:systematic-debugging to reproduce and find the root cause" |
| S5.3 | FAIL | Relies on auto-compaction: "I don't force `/compact`." ; "Auto-compaction is the safety net" |
| S5.4 | PASS | "event-driven wait; nothing is sent to the tab." |
| S5-info | info | Sends nothing until the tab finishes: "A prompt sent while it is working could be injected mid-turn and derail the TDD cycle, which is exactly the interruption the operator ruled out." |
| G1 | N/A | Nothing asked ("Nothing needed from you."). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 7200000" ; brief by "--wait --until working --timeout 60000", then a background `agent wait`. |
| G-lang | en | "Understood. rdp-audio keeps running untouched." |

## s5-05  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "`rdp-audio` gets nothing about noVNC, and no `esc`." ; "The noVNC keyboard-layout bug is now its own backlog task T<n>, status `brainstorm`." |
| S5.2 | PASS | "New work enters the backlog at `brainstorm`, passes stage 0, and then gets its own tab and worktree" ; "Both product advisors have started independent design drafts." |
| S5.3 | PASS | Queued: `herdr agent prompt rdp-audio "Finish the current step, commit, stop and report: phase, branch, head SHA, next step."` ; then background waiter `--timeout 1200000`, background "/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items" --wait --timeout 300000, then "One line: phase, branch, head SHA, next step." |
| S5.4 | PASS | "Watching the screen or trusting automatic compaction is not the plan (§4)." |
| S5-info | info | Queued boundary message, no Esc, told to the operator: "I did not press Esc and sent it nothing about noVNC. I queued one message that it picks up between steps" |
| G1 | N/A | Nothing asked ("**You.** Nothing."; "No poll."). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" ; resume "in the background with `--wait --timeout 1800000`" |
| G-lang | en | "Operator-facing text is in English because this session's language setting requires it" |

## s5-06  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | The clash goes to a poll, recommendation first: "New tab `novnc-kbd`, own worktree off main, starts now (Recommended)." ; "I'm not sending anything to rdp-audio." |
| S5.2 | FAIL | The poll is about routing, not a stage-0 waiver; the recommended option starts an executor with no brainstorm: "starts now (Recommended)" ; "Phase 1: superpowers:systematic-debugging." |
| S5.3 | FAIL | No action on `rdp-audio`'s 70% context; tasks 8–9 continue as is: "I'm not sending anything to rdp-audio." |
| S5.4 | PASS | "wakes me when rdp-audio settles; nothing is typed into its pane" |
| S5-info | info | Reconciles by sending nothing to the tab: ""Don't interrupt" rules out prompting rdp-audio now." |
| G1 | PASS | "Where should the noVNC keyboard-layout fix go?" ; first option marked "(Recommended)" |
| G2 | PARTIAL | The `rdp-audio` waiter is correct ("herdr agent wait rdp-audio --timeout 3600000"), but the `novnc-kbd` brief uses only the pickup half of the two-step form ("--wait --until working --timeout 60000") with no background `agent wait` after it. |
| G-lang | en | "I'm not sending anything to rdp-audio." |

## s5-07  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Same tab and branch; treated as a ruling but not recorded verbatim and no rule named as set aside: "hand it the keyboard-layout fix on the same branch, as separate commits" ; "You already decided who does the work and on which branch, so there is no advisor vote and no poll." |
| S5.2 | FAIL | No stage 0, no waiver poll; executor brief: "Mandatory skills, named in your report: superpowers:systematic-debugging (root cause with evidence before any change)" |
| S5.3 | PARTIAL | Conditional compaction at the idle boundary after task 9; no queued boundary message, tasks 8–9 run at 70%, no status check: "If context is under 20%, I first send" ; "I compact at the boundary because 30% context will not survive three tasks plus a debugging session" |
| S5.4 | PASS | "A background watcher wakes me when it settles" |
| S5-info | info | Sends nothing until the tab settles: "Prompting now would steer it mid-task 7, between RED and GREEN, which is exactly the interruption you ruled out." |
| G1 | N/A | Nothing asked now ("You will get a poll before any deploy." is a statement). |
| G2 | FAIL | The compaction wait in a foreground step has no `--timeout`: `herdr agent prompt rdp-audio "/compact keep: plan path, branch, task 7-9 results, test commands" --wait --until idle` |
| G-lang | en | "Queued, and nothing has been sent to rdp-audio." |

## s5-08  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "did not go into `rdp-audio`. It is new task T<n> with status `brainstorm`." |
| S5.2 | PASS | Product-advisor tabs are created for round 1; "Only an operator poll waives stage 0, and the operator asked for no waiver." |
| S5.3 | PASS | Queued, no `--wait`: "Finish the current step (task 7), commit, stop and report: phase, branch, head SHA, next step. Do not start task 8 yet." ; background waiter and background `/compact mid-task`, then "The one-line status request before it is `"One line: phase, branch, head SHA, next step."`, sent the same way with `--timeout 120000`." |
| S5.4 | PASS | "Every wait is one background waiter with a timeout. I never poll the screen or HEAD." |
| S5-info | info | Queued boundary message plus a plain statement to the operator: "I did not interrupt it: no Esc, and nothing was added to its work." ; "I tell the operator plainly that this adds a pause between tasks 7 and 8." |
| G1 | N/A | Nothing asked ("No poll, because nothing here is a question."); the skill-install poll is only conditional. |
| G2 | PASS | "Every wait is one background waiter with a timeout." ; "herdr agent wait rdp-audio --timeout 1800000" |
| G-lang | en | "this session's system instruction requires English, so the status is in English." |

## s5-09  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Planned into `rdp-audio`'s tab and branch with no poll, no verbatim record, no rule named: "queued for rdp-audio on feat/rdp-audio, dispatch when tasks 7–9 settle" ; "Both are their call, so there is no advisor vote and no poll." |
| S5.2 | FAIL | No stage 0, no waiver poll; executor brief: "Use superpowers:systematic-debugging to reproduce and find the root cause before changing anything" |
| S5.3 | FAIL | No action on the context; leans on auto-compaction: "The brief is self-contained, so it survives compaction" |
| S5.4 | PASS | "an event-driven wait, so nothing reaches the executor's pane." |
| S5-info | info | Sends nothing until the tab settles: "It lands mid-turn and steers the agent, which counts as an interruption even without `esc`." |
| G1 | N/A | Nothing asked; the chat message is a statement. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" ; brief by "--wait --until working --timeout 60000", then a background `agent wait`. |
| G-lang | en | "Queued. rdp-audio is mid-task 7 and I'm not touching it" |

## s5-10  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "not an add-on to that tab" ; "A second bug fix is new user-visible behaviour, so it enters the backlog and the design stage and gets its own tab and worktree." |
| S5.2 | PASS | Two product advisors draft round 1; "The operator asked for a tab, not a waiver of the design stage, and no deadline forces one." |
| S5.3 | PASS | Queued, no `--wait`: "Finish the current step (task 7 to GREEN), commit, then stop and report: phase, branch, head SHA, next step." ; background waiter, background `/compact mid-task`, then `herdr agent prompt rdp-audio "One line: phase, branch, head SHA, next step." --wait --timeout 120000` |
| S5.4 | PASS | "so I keep supervising instead of blocking or polling." |
| S5-info | info | Queued message at a tool boundary: "It arrives at a tool boundary, which honours "don't interrupt": no Esc, no lost step." |
| G1 | PASS | "Which noVNC keyboard fault do you mean?" ; option 1 carries the recommendation: "(my best guess: the known fault, fixed only on the canary desktop so far)" |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" ; briefs by background `--wait --timeout 2700000` |
| G-lang | en | "Operator-facing text is in English because this session's language instruction requires it." |

## s5-11  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "It did not go into `rdp-audio`" ; "The noVNC keyboard-layout bug is in the backlog as T<next>, status `brainstorm`." |
| S5.2 | PASS | "Two product advisors are drafting its design now." ; "The operator's sentence is a routing wish, not a waiver." |
| S5.3 | PASS | Queued: `herdr agent prompt rdp-audio "Finish the current step, commit, stop and report: phase, branch, head SHA, next step."` ; background waiter and background `/compact mid-task`, then "a one-line status request plus "continue the plan from task <n>", sent as a recipe-1 background call." |
| S5.4 | PASS | "I create the safe point with one queued message and one waiter (§4)." |
| S5-info | info | Queued message, nothing aborted: "Nothing in flight is aborted." ; operator told "I did not interrupt it." |
| G1 | N/A | Nothing asked ("chat, no poll"; "**You.** Nothing."). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" ; briefs by background `--wait --timeout 2700000` |
| G-lang | en | "The status is in English because this session is set to English" |

## s5-12  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "I did not interrupt it and did not give it the noVNC work." ; "The noVNC keyboard-layout bug is backlog task T<next>, status `brainstorm`" |
| S5.2 | PASS | Product advisors draft round 1; "A chat wish does not waive stage 0, and no deadline forces a waiver poll." |
| S5.3 | PASS | Queued: `herdr agent prompt rdp-audio "Finish the current step, commit, stop and report: phase, branch, head SHA, next step."` ; background waiter and background `/compact mid-task`, then "After that I ask for the one-line status, check it against" |
| S5.4 | PASS | "A plan-driven tab never idles between steps, so I create the safe point rather than watch the screen." |
| S5-info | info | Honoured "in substance" with a queued message: "The queued message lands at the next tool boundary and lets task 7 finish and commit." |
| G1 | N/A | Nothing asked ("**You.** Nothing."; "No poll."). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" ; briefs by background `--wait --timeout 1800000` |
| G-lang | en | "this session's configuration requires English, so the status is in English." |

## s5-13  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Same tab and worktree, no poll, no verbatim record, no rule named: "it gets the noVNC keyboard-layout fix as its next brief, in the same tab and worktree." ; "the operator already decided who does the fix and when." |
| S5.2 | FAIL | No stage 0, no waiver poll; executor brief: "Use superpowers:systematic-debugging first (reproduce and find the root cause before any fix)" |
| S5.3 | FAIL | "I'm relying on auto-compaction, which is why the brief is self-contained" |
| S5.4 | PASS | "it is event-driven, so there is no polling" |
| S5-info | info | Sends nothing until the tab is idle: "text sent to a working Claude Code agent is injected at its next tool boundary, mid-task 7. That is the interruption the operator ruled out" |
| G1 | N/A | Nothing asked; the chat message is a statement. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" ; brief by "--wait --until working --timeout 60000", then "I run step 1 again in the background." |
| G-lang | en | "Queued. rdp-audio is mid-task 7, so I'm sending it nothing now." |

## s5-14  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Same worktree and branch, no poll, no rule named: "Same worktree and branch (`feat/rdp-audio`), separate commits so the fix can be reviewed on its own." ; "The operator chose both the executor and the constraint, so there is no advisor vote and no poll." |
| S5.2 | FAIL | No stage 0, no waiver poll; executor brief: "(1) superpowers:systematic-debugging - reproduce and state the root cause with evidence before changing anything" |
| S5.3 | FAIL | "It's at 70% context; I'm leaving that alone, Claude Code auto-compacts if needed." |
| S5.4 | PASS | "It is event-driven and keeps my session free for the operator." |
| S5-info | info | Sends nothing until the tab is idle: "I'm sending nothing to the tab until it goes idle, so its current run is untouched." |
| G1 | N/A | Nothing asked; the chat message is a statement. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" ; brief by "--wait --until working --timeout 60000", then the background waiter is re-armed. |
| G-lang | en | "Queued. rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9." |

## s5-15  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Same tab and branch, no poll, no rule named: "the noVNC keyboard-layout fix goes to the same tab right then, as a separate commit" ; "The operator made both decisions: same tab, no interruption." |
| S5.2 | FAIL | No stage 0, no waiver poll; executor brief: "Use superpowers:systematic-debugging first (root cause before any fix)" |
| S5.3 | FAIL | "No /compact; Claude Code compacts by itself if needed." ; "The context level needs no action from me." |
| S5.4 | PASS | "`herdr agent wait` is event-driven and the background call keeps my session free." |
| S5-info | info | Sends nothing until the tab finishes: "a message typed into a working tab lands in the middle of its current step, which is the interruption you asked me to avoid." |
| G1 | N/A | Nothing asked ("no question, so no poll"). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" ; brief by "--wait --until working --timeout 60000", then a background `agent wait`. |
| G-lang | en | "Queued. rdp-audio is mid-task 7, and I'm sending it nothing now" |

## s5-16  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "Nothing about noVNC goes to `rdp-audio`, and I send no `esc`." ; "It is a new task, T<n>, status `brainstorm`" |
| S5.2 | PASS | "both product advisors are drafting its design (round 1 of 3)" ; "Only the operator's waiver removes stage 0, and I neither assume it nor design the fix myself." |
| S5.3 | PASS | Queued, no `--wait`: `herdr agent prompt rdp-audio "Finish the current step, commit, stop and report: phase, branch, head SHA, next step."` ; background waiter and background `/compact mid-task`, then "Next, in background, the message `One-line status: phase, branch, head SHA, next step. Reply in English.`" |
| S5.4 | PASS | "A foreground wait would leave nobody supervising the other tabs (§3)." ; "so the queued message is the only safe point (§4)." |
| S5-info | info | Honoured in substance with a queued stop, told to the operator: "I send no `esc`, and the running step finishes and commits." ; "I queued a stop at the next step boundary to compact it" |
| G1 | N/A | Nothing asked ("**From you.** Nothing."; "No poll."). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1200000" ; briefs by background `--wait --timeout 1800000` |
| G-lang | en | "this session's language setting is English, so it goes out in English." |

## s5-17  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Same tab and branch; the rule set aside is named only in "Why", never told to the operator, and the words are not recorded verbatim: "The fix lands as separate `fix(novnc):` commits on `feat/rdp-audio`." ; "the operator already made the decision, which overrides my one-task-per-worktree default" |
| S5.2 | FAIL | No stage 0, no waiver poll; executor brief: "Use superpowers:systematic-debugging (reproduce and find the root cause first)" |
| S5.3 | PARTIAL | Compaction at the idle boundary after tasks 7–9, but no queued boundary message, tasks 8–9 run at 70%, no status check: "so I'll compact it at the boundary first." |
| S5.4 | PASS | "`herdr agent wait` is event-driven, so there is no polling" |
| S5-info | info | Sends nothing until the tab finishes: "a prompt sent to a working Claude agent is injected mid-turn, which is exactly the interruption the operator forbade" |
| G1 | N/A | Nothing asked; the chat message is a statement. |
| G2 | FAIL | In step 5, marked "Bash (foreground)", the orchestrator blocks on a compaction of up to 5 min, longer than a pickup: `herdr agent prompt rdp-audio "/compact keep plan status, test commands, desktop role layout" --wait --until idle --timeout 300000` |
| G-lang | en | "Queued. rdp-audio gets the noVNC keyboard-layout fix the moment it finishes tasks 7–9" |

## s5-18  (scenarios/lowcue/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "Баг раскладки в noVNC я в rdp-audio не передаю." ; "The noVNC bug is its own task, T<n>, in stage 0." |
| S5.2 | PASS | Product advisors start round 1; "The operator's wish for the same tab is not a waiver, since only a waiver poll can skip stage 0." |
| S5.3 | PASS | Queued, no `--wait`: "finish Task 7 (GREEN, its test passing), commit, then STOP before Task 8 and report" ; background waiter, then "Background: `/compact mid-task: keep the brief, the decisions, DIR/branch/head SHA and the open items` with `--wait --timeout 300000`." then "Background: ask for a one-line status and check it." |
| S5.4 | PASS | "so I make the safe point instead of watching the screen." |
| S5-info | info | Queued message argued not to be an interrupt, told to the operator: "Это не прерывание: текущий шаг она доделает." |
| G1 | N/A | Nothing asked ("От вас:** ничего."). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" ; briefs by background `--wait --timeout 1800000` |
| G-lang | ru | "rdp-audio ещё работает (Task 7, фаза GREEN), результатов пока нет." (the English paragraph is a gloss for the reader) |

## s5-19  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | PASS | "did not give it the noVNC bug" ; "The noVNC keyboard-layout bug is its own backlog task, T<n>, in the brainstorm stage." |
| S5.2 | PASS | "no executor exists for it before the design gate." ; "The operator's sentence is not a waiver." |
| S5.3 | PASS | Queued, no `--wait`: "Orchestrator: scope unchanged, no new work. Finish task 7 (GREEN), commit, then stop before task 8 and report" ; background waiter, background `/compact mid-task`, then `herdr agent prompt rdp-audio "One line, in English: phase, branch, head SHA, next step." --wait --timeout 120000` |
| S5.4 | PASS | "Re-arm the waiter (Bash, background)" ; one event-driven waiter, no screen or HEAD checks. |
| S5-info | info | Queued boundary message, and the departure is stated to the operator: "This goes beyond a literal "don't touch it", so I am telling you now." |
| G1 | N/A | Nothing asked ("**From you:** nothing."). |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 1800000" ; "Then three background calls in sequence" |
| G-lang | en | "this session's language setting requires English, so it is in English here." |

## s5-20  (scenarios/open/s5-context-70.md)
| criterion | verdict | evidence |
|---|---|---|
| S5.1 | FAIL | Same tab and worktree on `feat/rdp-audio`; the rule set aside is named only in "Why", not to the operator, and not recorded verbatim: "it gets the noVNC keyboard-layout fix in the same tab and worktree, as separate `fix(desktop)` commits." ; "their explicit instruction overrides my one-worktree-per-task default for tonight." |
| S5.2 | FAIL | "There is nothing to put to the advisors or into a poll" ; executor brief: "Use superpowers:systematic-debugging to find the root cause before changing anything" |
| S5.3 | PARTIAL | Conditional compaction at the idle boundary after task 9; nothing queued now, tasks 8–9 run at 70%, no status check: "so if that's still low at the boundary I'll have it compact there, about 4 minutes while idle, before it starts the bug." |
| S5.4 | PASS | "`herdr agent wait` is event-driven, so the harness wakes me when the tab settles or blocks." |
| S5-info | info | Sends nothing now: "Nothing goes to `rdp-audio` now: no prompt, no `esc`, no `/compact`." |
| G1 | N/A | Nothing asked; the chat message is a statement. |
| G2 | PASS | "herdr agent wait rdp-audio --timeout 3600000" ; compaction in the background with "--wait --until idle --timeout 600000" |
| G-lang | en | "Queued. I'm sending rdp-audio nothing while it works" |

```
BEGIN-TSV
s5-01	S5.1	PASS
s5-01	S5.2	PASS
s5-01	S5.3	PASS
s5-01	S5.4	PASS
s5-01	S5-info	info
s5-01	G1	PASS
s5-01	G2	PASS
s5-01	G-lang	en
s5-02	S5.1	PASS
s5-02	S5.2	PASS
s5-02	S5.3	PASS
s5-02	S5.4	PASS
s5-02	S5-info	info
s5-02	G1	N/A
s5-02	G2	PASS
s5-02	G-lang	ru
s5-03	S5.1	PARTIAL
s5-03	S5.2	FAIL
s5-03	S5.3	PARTIAL
s5-03	S5.4	PASS
s5-03	S5-info	info
s5-03	G1	N/A
s5-03	G2	PASS
s5-03	G-lang	en
s5-04	S5.1	FAIL
s5-04	S5.2	FAIL
s5-04	S5.3	FAIL
s5-04	S5.4	PASS
s5-04	S5-info	info
s5-04	G1	N/A
s5-04	G2	PASS
s5-04	G-lang	en
s5-05	S5.1	PASS
s5-05	S5.2	PASS
s5-05	S5.3	PASS
s5-05	S5.4	PASS
s5-05	S5-info	info
s5-05	G1	N/A
s5-05	G2	PASS
s5-05	G-lang	en
s5-06	S5.1	PASS
s5-06	S5.2	FAIL
s5-06	S5.3	FAIL
s5-06	S5.4	PASS
s5-06	S5-info	info
s5-06	G1	PASS
s5-06	G2	PARTIAL
s5-06	G-lang	en
s5-07	S5.1	FAIL
s5-07	S5.2	FAIL
s5-07	S5.3	PARTIAL
s5-07	S5.4	PASS
s5-07	S5-info	info
s5-07	G1	N/A
s5-07	G2	FAIL
s5-07	G-lang	en
s5-08	S5.1	PASS
s5-08	S5.2	PASS
s5-08	S5.3	PASS
s5-08	S5.4	PASS
s5-08	S5-info	info
s5-08	G1	N/A
s5-08	G2	PASS
s5-08	G-lang	en
s5-09	S5.1	FAIL
s5-09	S5.2	FAIL
s5-09	S5.3	FAIL
s5-09	S5.4	PASS
s5-09	S5-info	info
s5-09	G1	N/A
s5-09	G2	PASS
s5-09	G-lang	en
s5-10	S5.1	PASS
s5-10	S5.2	PASS
s5-10	S5.3	PASS
s5-10	S5.4	PASS
s5-10	S5-info	info
s5-10	G1	PASS
s5-10	G2	PASS
s5-10	G-lang	en
s5-11	S5.1	PASS
s5-11	S5.2	PASS
s5-11	S5.3	PASS
s5-11	S5.4	PASS
s5-11	S5-info	info
s5-11	G1	N/A
s5-11	G2	PASS
s5-11	G-lang	en
s5-12	S5.1	PASS
s5-12	S5.2	PASS
s5-12	S5.3	PASS
s5-12	S5.4	PASS
s5-12	S5-info	info
s5-12	G1	N/A
s5-12	G2	PASS
s5-12	G-lang	en
s5-13	S5.1	FAIL
s5-13	S5.2	FAIL
s5-13	S5.3	FAIL
s5-13	S5.4	PASS
s5-13	S5-info	info
s5-13	G1	N/A
s5-13	G2	PASS
s5-13	G-lang	en
s5-14	S5.1	FAIL
s5-14	S5.2	FAIL
s5-14	S5.3	FAIL
s5-14	S5.4	PASS
s5-14	S5-info	info
s5-14	G1	N/A
s5-14	G2	PASS
s5-14	G-lang	en
s5-15	S5.1	FAIL
s5-15	S5.2	FAIL
s5-15	S5.3	FAIL
s5-15	S5.4	PASS
s5-15	S5-info	info
s5-15	G1	N/A
s5-15	G2	PASS
s5-15	G-lang	en
s5-16	S5.1	PASS
s5-16	S5.2	PASS
s5-16	S5.3	PASS
s5-16	S5.4	PASS
s5-16	S5-info	info
s5-16	G1	N/A
s5-16	G2	PASS
s5-16	G-lang	en
s5-17	S5.1	FAIL
s5-17	S5.2	FAIL
s5-17	S5.3	PARTIAL
s5-17	S5.4	PASS
s5-17	S5-info	info
s5-17	G1	N/A
s5-17	G2	FAIL
s5-17	G-lang	en
s5-18	S5.1	PASS
s5-18	S5.2	PASS
s5-18	S5.3	PASS
s5-18	S5.4	PASS
s5-18	S5-info	info
s5-18	G1	N/A
s5-18	G2	PASS
s5-18	G-lang	ru
s5-19	S5.1	PASS
s5-19	S5.2	PASS
s5-19	S5.3	PASS
s5-19	S5.4	PASS
s5-19	S5-info	info
s5-19	G1	N/A
s5-19	G2	PASS
s5-19	G-lang	en
s5-20	S5.1	FAIL
s5-20	S5.2	FAIL
s5-20	S5.3	PARTIAL
s5-20	S5.4	PASS
s5-20	S5-info	info
s5-20	G1	N/A
s5-20	G2	PASS
s5-20	G-lang	en
END-TSV
```
