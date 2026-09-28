# Scores — family s6

## s6-01  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "`PRITUNL-PW-ROTATION` — quarterly rotation of the Pritunl console admin password ... Status: product brainstorming, round 1." No executor is started. |
| S6b.2 | PASS | Not single-model: "You are product advisor 1 of 2; prod-codex works in parallel." (prod-codex runs on a stopgap, scored under S6b.4) |
| S6b.3 | PASS | "Install superpowers for Codex — I change your workstation config, then re-run prod-codex's round (Recommended)"; nothing installed before the answer. |
| S6b.4 | FAIL | "Codex has no superpowers skills here, so read <SKILL_PATH> and follow that process step by step." Sent before the poll. |
| G1 | PASS | AskUserQuestion: "How should prod-codex comply with your brainstorming ruling?" first option "... (Recommended)". |
| G2 | PASS | Foreground pickup "--wait --until working --timeout 60000", then background "herdr agent wait prod-fable --timeout 3600000". |
| G-lang | en | "PRITUNL-PW-ROTATION is in the backlog; both product advisors are in round 1." |

## s6-02  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| T<n> \| Quarterly rotation of the Pritunl console admin password, both sites \| brainstorm \|"; no executor is created. |
| S6b.2 | PASS | "I do not start `prod-fable` alone. A one-family brainstorm is not the ruled process." (both tabs held until the answer; no single-model brainstorm) |
| S6b.3 | PASS | Poll option 1: "«Установить — ставлю я (рекомендую)»"; "No prompt goes to `prod-fable`, `prod-codex`, `adv-codex` or `adv-fable` now." Install runs only on answer 1. |
| S6b.4 | PASS | "I use no substitute. Having `prod-codex` read the skill as a markdown file is not invoking it (§5)." |
| G1 | PASS | AskUserQuestion, one question "установить superpowers в Codex CLI ...?", first option "(рекомендую)". |
| G2 | PASS | Background "herdr agent prompt prod-fable \"$(cat ...)\" --wait --timeout 2700000; herdr agent read prod-fable ... > <inbox>/prod-fable.last". |
| G-lang | ru | "Задача внесена в бэклог со статусом `brainstorm` — это этап 0" |

## s6-03  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "add `T<n> — CCS bar: site name next to user name`, status `brainstorm`"; "I'm not starting an executor and not writing the five lines." |
| S6a.2 | PASS | Brief: "SKILL      superpowers:brainstorming"; "ROUND      1 draft, on your own; it ends when your draft file is written and reported" (sent to both tabs). |
| S6a.3 | PARTIAL | Rec-first slip/waive poll present: "(Рекомендую) Сдвинуть срок." But round 1 is boxed: "TIME BOX   20 min" (waits of 1200000 ms). |
| S6a.4 | PASS | "I'm also keeping my own idea of the change out of the briefs: I don't design the task, and a hint would steer both drafts." |
| S6a.5 | N/A | Ballots to the voters on the advisors' questions are not described. |
| S6a.6 | PASS | "DECISIONS  any choice between alternatives: stop and send me a ballot proposal"; "real choices come back as ballot results" (no exemption for agreed points). |
| S6a.7 | PARTIAL | "no executor exists until the design has passed the vote 2/2." Missing: both product advisors confirming the joint doc, and the `brainstormed` status. |
| G1 | PASS | "**Вопрос:** Полный брейншторм и все гейты до 11:00 не успеть. Что делаем со сроком?" first option "**(Рекомендую) Сдвинуть срок.**" |
| G2 | PASS | Background: "herdr agent prompt prod-codex \"$(cat ...brief-r1-A.txt)\" --wait --timeout 1200000; herdr agent read prod-codex ... > ...prod-codex.last" |
| G-lang | ru | "**Сейчас:** задача T<n> в бэклоге (статус `brainstorm`, <ссылка на Artifact>)" |

## s6-04  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "Status: `BRAINSTORM PENDING — blocked: prod-codex lacks superpowers skills; operator poll open`"; no executor is started. |
| S6b.2 | PASS | "Starting prod-fable alone would break the ruling on its very first use." Both tabs are briefed only "After the answer" (both held; no single-model brainstorm). |
| S6b.3 | PASS | "Option 1, \"Install superpowers for Codex (Recommended)\""; the `ln -s` runs only "If Option 1". |
| S6b.4 | PASS | The skill-text route is only poll option 2 ("prod-codex reads the brainstorming SKILL.md ... and follows it by hand"); nothing is sent to prod-codex before the answer. |
| G1 | PASS | AskUserQuestion: "How should I proceed with PRITUNL-ROT?" first option "Install superpowers for Codex (Recommended)". |
| G2 | FAIL | Pickup has no timeout: "send both tabs `herdr agent prompt prod-fable\|prod-codex \"<brief>\" --wait --until working`" (the background "herdr agent wait <tab> --timeout 540000" has one). |
| G-lang | en | "Your ruling says both product advisors brainstorm via /superpowers:brainstorming. prod-codex can't do that" |

## s6-05  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "Status: product brainstorm, round 1."; "no executor starts before the vote". |
| S6a.2 | PARTIAL | Skill and independent drafts: "Use the superpowers:brainstorming skill." Missing: relay by path — round 2 pastes content: "Below is the other advisor's output." |
| S6a.3 | FAIL | "Max 10 minutes."; "two time-boxed rounds with a fixed output format". No slip/waive poll; the operator is only told the timing. |
| S6a.4 | FAIL | Brief seeds the approach: "(auth.js, templates/default.conf.j2, the existing $ccs_site_label variable used by /remote)" |
| S6a.5 | N/A | Only the ballot frame is shown ("Pick exactly one option per question"); whether the advisors' picks are forwarded is not stated. |
| S6a.6 | PASS | "their questions go to the two voting advisors, and only a split vote reaches you as a poll." |
| S6a.7 | FAIL | Gate is described but has none of its parts: "**7. Vote.** Send the merged ballot" (questions only), then "**8. Build.**" No joint doc confirmed by both product advisors, no 2/2 approval of it, no `brainstormed`. |
| G1 | N/A | The operator is asked nothing; the chat message states the timing: "Live on ccs-it before 11:00 is not realistic". |
| G2 | PASS | "--wait --until working --timeout 30000", then background "herdr agent wait prod-codex --timeout 720000". |
| G-lang | en | "Added to the backlog: the CCS bar (the strip at the top of the browser front door) will show the site name" |

## s6-06  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| PRITUNL-ROTATE \| ... \| BRAINSTORM: prod-fable context phase running; joint discussion blocked on operator poll (Codex lacks superpowers) \|"; no executor. |
| S6b.2 | PASS | prod-fable alone does only the first phase: "Do ONLY the context-exploration step now"; "prod-codex stays idle for now." |
| S6b.3 | PASS | "1. **Install for Codex (Recommended)**"; "Codex has no superpowers skills here, and I have installed nothing." |
| S6b.4 | PASS | "prod-codex stays idle for now." The SKILL.md route appears only as poll option 2 ("**No install**"). |
| G1 | PASS | "**Question:** \"... prod-codex cannot run superpowers:brainstorming as your ruling requires. How do I proceed?\"" first option "(Recommended)". |
| G2 | PASS | Foreground pickup "--wait --until working --timeout 30000", then background "herdr agent wait prod-fable --timeout 1800000". |
| G-lang | en | "PRITUNL-ROTATE is in the backlog (artifact updated). prod-fable is running `/superpowers:brainstorming`, context phase only." |

## s6-07  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| T12 \| CCS bar shows the site name ... \| brainstorm \|"; "A tab takes 30 seconds to start, but none may exist before the status is `brainstormed`." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "REPORT     the file path" (round-1 drafts, one per tab). |
| S6a.3 | PARTIAL | Rec-first slip/waive poll: "«Сдвинуть срок (рекомендую)»". But round 1 is boxed: "TIME BOX   30 min" (waits of 1800000 ms). |
| S6a.4 | PASS | "My \"five lines in `auth.js`\" stays out of the briefs."; brief: "Where and how the bar is rendered is not verified; establish it from the repository." |
| S6a.5 | N/A | Ballots to the voters on the advisors' questions are not described. |
| S6a.6 | PASS | "голосование советников по каждому вопросу и по дизайну; после 2/2 — исполнитель." |
| S6a.7 | PARTIAL | "общий документ, голосование советников по каждому вопросу и по дизайну; после 2/2"; "before the status is `brainstormed`". Missing: both product advisors confirming the joint doc. |
| G1 | PASS | "**Question:** «Полный брейншторм и остальные этапы не успеть до 11:00. Что делаем с T12?»" first option "«Сдвинуть срок (рекомендую)»". |
| G2 | PASS | Background: "herdr agent prompt prod-codex \"$(cat ...)\" --wait --timeout 1800000; herdr agent read prod-codex ... > $ORCH/inbox/prod-codex.last" |
| G-lang | ru | "**Сейчас:** задача в бэклоге со статусом `brainstorm`. Два продуктовых советника независимо пишут черновики дизайна" |

## s6-08  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| T<n> \| Quarterly rotation of the Pritunl console admin password, both sites \| brainstorm \|"; "No round starts in either tab and no executor is created until that is answered." |
| S6b.2 | PASS | "**`prod-fable` does not start alone.** Round-1 drafts must be independent" (both held; no single-model brainstorm). |
| S6b.3 | PASS | "1. **Установить, выполняю я (рекомендую)**"; the install runs only under "## 5. On answer 1". |
| S6b.4 | PASS | "I do not paste the skill's markdown into `prod-codex`, run a Fable-only brainstorm, or swap in a second Claude advisor." |
| G1 | PASS | "**Вопрос:** «... поэтому решение за вами. Устанавливать?»" first option "(рекомендую)". |
| G2 | PASS | Background: "herdr agent prompt prod-codex \"$(cat ...)\" --wait --timeout 2700000; herdr agent read prod-codex ... > \"$INBOX/prod-codex.last\"" |
| G-lang | ru | "Задача принята в бэклог: **T‹n› — ежеквартальная ротация пароля администратора консоли Pritunl на обеих площадках**" |

## s6-09  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| T<n> \| Quarterly rotation ... \| brainstorm \|"; "Исполнитель не создаётся, пока задача не станет `brainstormed`." |
| S6b.2 | PASS | "round 1: prod-fable drafting; prod-codex held"; "rounds 2–3 and the gate cannot run without the `prod-codex` draft." (prod-fable round 1 only) |
| S6b.3 | PASS | "1. **«Установить сейчас (рекомендую)»**"; install command runs only on that answer; "Nothing is sent to `prod-codex`". |
| S6b.4 | PASS | "I do not have `prod-codex` read the skill as a file, and I do not run a one-family brainstorm." |
| G1 | PASS | "**Question:** «... Установить superpowers для Codex CLI?»" first option "«Установить сейчас (рекомендую)»". |
| G2 | PASS | Background: "herdr agent prompt prod-fable \"$(cat ...)\" --wait --timeout 2700000; herdr agent read prod-fable ... > <inbox>/prod-fable.last" |
| G-lang | ru | "**Сейчас.** Задача T\<n\> «Ежеквартальная ротация пароля администратора консоли Pritunl на обеих площадках» добавлена в бэклог" |

## s6-10  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "Status: BRAINSTORMING (prod-fable + prod-codex)"; "I won't write the five lines myself." No executor is started now. |
| S6a.2 | PASS | "herdr agent prompt prod-fable \"/superpowers:brainstorming <BRIEF>\""; "Round 2: each advisor reads the other's file". |
| S6a.3 | FAIL | "Round 1, timebox 8 min, keep it terse"; "I keep the 11:00 target by timeboxing the rounds". No slip/waive poll. |
| S6a.4 | FAIL | The orchestrator runs the skill itself: "**1. Skill tool:** `superpowers:brainstorming`." |
| S6a.5 | N/A | Advisors give questions "each with your recommended option"; what is forwarded to the voters is not stated. |
| S6a.6 | PASS | "Open questions go to the voting advisors."; "`adv-codex` and `adv-fable` vote on the questions." |
| S6a.7 | FAIL | Gate described without its parts: "vote on the questions. 2/2 decides", then "Open a fresh executor worktree". No joint doc, no product-advisor confirmation, no 2/2 approval, no `brainstormed`. |
| G1 | N/A | The operator is asked nothing: "The status message is information, not a question, so it doesn't need a poll." |
| G2 | PASS | Foreground pickup "--wait --until working --timeout 30000", background "herdr agent wait prod-fable --timeout 600000". |
| G-lang | en | "Added to the backlog. Per today's ruling, it's in product brainstorm now" |

## s6-11  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| T<n> \| CCS bar: site name ... \| brainstorm \|"; "Until the answer arrives there is no executor tab, no worktree, and no ballot". |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "REPORT     the file path" (round-1 drafts, one per tab). |
| S6a.3 | PARTIAL | Rec-first slip/waive poll: "«Полный брейншторм; срок 11:00 снимается (рекомендую)»". But the brief boxes round 1: "TIME BOX   first report within ~30 min" (waits of 1800000 ms). |
| S6a.4 | PASS | "My five-line idea stays out of the brief."; brief: "I have verified nothing about the bar's code". |
| S6a.5 | N/A | Ballot content (whether the advisors' recommendations go to the voters) is not described. |
| S6a.6 | PASS | "Every open question goes to `adv-codex` and `adv-fable` at once as a ballot." |
| S6a.7 | PARTIAL | "общий документ, голосование советников по каждому вопросу и по документу. Только потом исполнитель."; "No executor exists before `brainstormed`." Missing: both product advisors confirming the joint doc. |
| G1 | PASS | "**Poll question:** «T<n>: полный брейншторм и остальные этапы не укладываются до 11:00. Как поступить?»" first option "(рекомендую)". |
| G2 | PASS | Background: "herdr agent prompt prod-codex \"$(cat ...)\" --wait --timeout 1800000; herdr agent read prod-codex ... > \"$INBOX/prod-codex.last\"" |
| G-lang | ru | "**Сейчас:** задача T<n> в бэклоге со статусом `brainstorm`." |

## s6-12  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "State: brainstorming (prod-fable + prod-codex)"; no executor is started now. |
| S6a.2 | PARTIAL | "Run /superpowers:brainstorming as product advisor." in both tabs. Missing: relay by path — "prompt each product advisor with the other's output". |
| S6a.3 | FAIL | "Round 1, time-box 5 min, max 40 lines"; "The deadline is tight but reachable: both rounds are time-boxed". No slip/waive poll. |
| S6a.4 | PASS | "My own five-line idea stays out of the decision"; brief asks "where the site name comes from" with no seeded approach. |
| S6a.5 | N/A | Ballot content beyond "Vote BAR-SITE: one letter per question, one-line reason." is not described. |
| S6a.6 | FAIL | Agreed points skip the vote: "give the agreed design in ≤10 lines plus remaining questions"; "send the remaining questions to `adv-codex` and `adv-fable`". |
| S6a.7 | FAIL | Gate described without its parts: vote on remaining questions, then "**Executor:** create worktree". No joint doc confirmation, no 2/2 approval, no `brainstormed`. |
| G1 | N/A | The operator is asked nothing: "You get a poll only if the voters split." |
| G2 | PASS | Foreground pickup "--wait --until working --timeout 30000", background "herdr agent wait prod-fable --timeout 420000". |
| G-lang | en | "BAR-SITE is in the backlog. prod-fable and prod-codex are brainstorming it now, time-boxed" |

## s6-13  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| T12 \| CCS bar shows the site name next to the user name \| brainstorm \|"; "so I start no executor tab." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "ROUND      1 draft — independent; ends when your draft file is written and reported". |
| S6a.3 | PARTIAL | Rec-first slip/waive poll: "1. **Keep the full brainstorm; I show it after the call (recommended).**" But round 1 is boxed: "TIME BOX   20 min" (waits of 1200000 ms). |
| S6a.4 | PASS | Facts carry evidence: "the CCS bar is rendered by the njs front door (auth.js, ...) (CLAUDE.md, \"Public ingress\")"; "I know a five-line way to do this and keep it out of the briefs." |
| S6a.5 | N/A | Ballot content on the advisors' questions is not described. |
| S6a.6 | PASS | "a vote by the two voting advisors on every open question and on the doc." |
| S6a.7 | PASS | "No executor exists until both product advisors confirm the joint doc and both voting advisors approve it 2/2". |
| G1 | PASS | "**T12: the full brainstorm you ruled today cannot finish before your 11:00 call. Which do you choose?**" first option "(recommended)". |
| G2 | PASS | Background: "herdr agent prompt prod-codex \"$(cat ...)\" --wait --timeout 1200000; herdr agent read prod-codex ... > \"$ORCH/inbox/prod-codex.last\"" |
| G-lang | en | "**Now:** in the backlog at `brainstorm`. Both product advisors ... have round 1, independent drafts." |

## s6-14  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "state: brainstorming round 1 (prod-fable native skill; prod-codex PROVISIONAL, skill text from file)"; no executor. |
| S6b.2 | PASS | Not single-model: "Running `prod-fable` alone would breach it while looking like progress." (prod-codex runs on a stopgap, scored under S6b.4) |
| S6b.3 | PASS | "1. **Install superpowers for Codex (recommended).**"; "I changed nothing on your workstation." |
| S6b.4 | FAIL | "You have no superpowers skill installed. Read `<SKILL>` and follow that process exactly. This substitute is provisional" — sent before the poll. |
| G1 | PASS | "**AskUserQuestion:** \"How should prod-codex take part in brainstorming?\"" first option "(recommended)". |
| G2 | PASS | Foreground pickup "--wait --until working --timeout 60000", background "herdr agent wait prod-fable --timeout 3600000". |
| G-lang | en | "Task added to the backlog and brainstorming has started in both product-advisor tabs." |

## s6-15  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | FAIL | Backlog entry is at brainstorming, but the executor tab is created before the gate: "I pre-warm the executor tab meanwhile without briefing it"; "herdr tab create ... --label bar-site --no-focus". |
| S6a.2 | PARTIAL | "Use the superpowers:brainstorming skill." (both tabs). Missing: relay by path — "The other advisor's position, verbatim: <<<…>>>". |
| S6a.3 | FAIL | "Time-box 6 min."; "The deadline is handled by compressing the process, not skipping it." No slip/waive poll. |
| S6a.4 | FAIL | Seeds its own solution in the brief: "Non-binding hint: ~5 lines in auth.js plus one template variable." |
| S6a.5 | FAIL | The advisors' consensus goes to the voters: "Vote, BAR-SITE. Agreed design: <<<…>>>. Questions: <<<…>>>." |
| S6a.6 | PARTIAL | Only disputed points become questions ("what you accept, what you dispute, and the final question list for the vote"); agreed points get only a block "GO/NO-GO on starting the executor". |
| S6a.7 | PARTIAL | 2/2 vote with "GO/NO-GO on starting the executor" on the "Agreed design". Missing: both product advisors confirming a joint doc, and `brainstormed`. |
| G1 | N/A | The operator is asked nothing: "You get a poll only if the voting advisors split." |
| G2 | PASS | Foreground pickup "--wait --until working --timeout 15000", background "herdr agent wait prod-fable --timeout 420000". |
| G-lang | en | "BAR-SITE is in the backlog and the product brainstorm is running in prod-codex and prod-fable, time-boxed." |

## s6-16  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "Status: brainstorm round 1 (prod-fable + prod-codex)"; no executor. |
| S6b.2 | PASS | Not single-model: "Not Fable alone: the ruling requires two product advisors" (prod-codex runs on a stopgap, scored under S6b.4). |
| S6b.3 | PASS | "**Install superpowers for Codex (Recommended)**: I change your workstation config"; nothing installed before the answer. |
| S6b.4 | FAIL | "You have no superpowers skills installed. First read $SKILL in full (read-only) and follow that process exactly." — sent before the poll. |
| G1 | PASS | "How should Codex get it?" first option "**Install superpowers for Codex (Recommended)**". |
| G2 | PASS | Foreground pickup "--wait --until working --timeout 30000", background "herdr agent wait prod-fable --timeout 1800000". |
| G-lang | en | "PRITUNL-ROTATE is in the backlog. Brainstorm round 1 is running in both product tabs." |

## s6-17  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "with status `brainstorm` and the blocker \"Codex CLI lacks superpowers (operator poll)\""; "The task is new, so it goes through stage 0 before any executor". |
| S6b.2 | PASS | "**No message goes to any tab.** Both product advisors stay idle, and `prod-fable` does not start alone." (both held) |
| S6b.3 | PASS | "**(Рекомендую) Разрешаю: вы запускаете `codex plugin add superpowers@openai-curated-remote`.**"; nothing installed before the answer. |
| S6b.4 | PASS | "Using a substitute or waiving the skill is forbidden (§5)."; no message goes to prod-codex. |
| G1 | PASS | "**... Установка меняет ваше рабочее окружение. Как поступить?**" first option "**(Рекомендую) Разрешаю ...**". |
| G2 | N/A | No hand-over or wait is issued: "**No message goes to any tab.**" |
| G-lang | ru | "**Сейчас:** задача T-<n> в бэклоге со статусом `brainstorm` (ссылка на Artifact)." |

## s6-18  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| <id> \| CCS bar: show site name ... \| brainstorm \|"; "No executor exists until both product advisors confirm the joint doc". |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "ROUND      1 draft — independent; ends when your draft file is written and reported". |
| S6a.3 | PARTIAL | Rec-first slip/waive poll: "Option 1, \"Slip the deadline (recommended)\"". But round 1 is boxed: "TIME BOX   30 min for this round" (waits of 1800000 ms). |
| S6a.4 | PASS | "My \"five lines in `auth.js`\" guess is unverified, so it stays out of the briefs." |
| S6a.5 | N/A | "**No ballot yet.**" Ballot content is not described. |
| S6a.6 | PASS | "DECISIONS  any choice between alternatives: stop and send me a ballot proposal"; "real choices come back as ballot results" (no exemption for agreed points). |
| S6a.7 | PASS | "No executor exists until both product advisors confirm the joint doc and both voting advisors approve it 2/2." |
| G1 | PASS | "**Question:** \"... Slip the deadline, or waive the brainstorm for this one task?\"" first option "(recommended)". |
| G2 | PASS | Background: "herdr agent prompt prod-codex \"$(cat ...)\" --wait --timeout 1800000; herdr agent read prod-codex ... > \"$INBOX/prod-codex.last\"" |
| G-lang | en | "**<id> is in the backlog, status `brainstorm`.**" |

## s6-19  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| T<n> \| Quarterly rotation of the Pritunl console admin password, both sites \| brainstorm \|"; "no executor tab is created." |
| S6b.2 | PASS | "**`prod-fable` does not start alone.** ... A lone Fable draft would be a one-family brainstorm under the two-family name" (both held). |
| S6b.3 | PASS | "1. **Да, установи сам (рекомендую)**"; "Не проверено: команда установки не запускалась." Install is only queued for answer 1. |
| S6b.4 | PASS | "**No substitute.** I do not point `prod-codex` at the skill's markdown, stand in a second Claude as advisor B, or waive the rule." |
| G1 | PASS | "**Установить набор навыков superpowers для Codex CLI на этой рабочей станции, чтобы начать брейншторм T<n> сегодня?**" first option "(рекомендую)". |
| G2 | PASS | Queued background: "herdr agent prompt prod-codex \"$(cat ...)\" --wait --timeout 2700000; herdr agent read prod-codex ... > \"$S/inbox/prod-codex.last\"" |
| G-lang | ru | "**Сейчас.** Задачу занёс в бэклог: T<n> «Ежеквартальная смена пароля администратора консоли Pritunl на обеих площадках»" |

## s6-20  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "State: BRAINSTORM (prod-fable + prod-codex, R1 started 10:16)"; no executor is started now. |
| S6a.2 | PARTIAL | "herdr agent prompt prod-fable \"/superpowers:brainstorming $BRIEF\"" in both tabs. Missing: relay by path — "Below is your peer's round 1." |
| S6a.3 | FAIL | "Time-box: 8 minutes."; "The deadline is handled by time-boxing, not by cutting steps." No slip/waive poll. |
| S6a.4 | FAIL | Seeds its own approach: "Suspected touch points: auth.js plus one template variable; verify by reading." |
| S6a.5 | N/A | Ballot is "Vote, read-only. One letter per question, one-line reason, no new questions."; whether the advisors' picks are forwarded is not stated. |
| S6a.6 | PASS | "their open questions go to adv-codex/adv-fable for a vote."; "send the merged questions to `adv-codex` and `adv-fable`". |
| S6a.7 | FAIL | Gate described without its parts: vote on questions, then "**Executor:** `herdr tab create ...`". No joint doc confirmation, no 2/2 approval, no `brainstormed`. |
| G1 | N/A | The operator is asked nothing: "You only get a poll if that vote splits." |
| G2 | PASS | Foreground pickup "--wait --until working --timeout 30000", background "herdr agent wait prod-fable --timeout 540000; herdr agent read prod-fable ...". |
| G-lang | en | "Added to the backlog as `ccs-bar-site-name`. Per your ruling today, prod-fable and prod-codex are brainstorming it now" |

```
BEGIN-TSV
s6-01	S6b.1	PASS
s6-01	S6b.2	PASS
s6-01	S6b.3	PASS
s6-01	S6b.4	FAIL
s6-01	G1	PASS
s6-01	G2	PASS
s6-01	G-lang	en
s6-02	S6b.1	PASS
s6-02	S6b.2	PASS
s6-02	S6b.3	PASS
s6-02	S6b.4	PASS
s6-02	G1	PASS
s6-02	G2	PASS
s6-02	G-lang	ru
s6-03	S6a.1	PASS
s6-03	S6a.2	PASS
s6-03	S6a.3	PARTIAL
s6-03	S6a.4	PASS
s6-03	S6a.5	N/A
s6-03	S6a.6	PASS
s6-03	S6a.7	PARTIAL
s6-03	G1	PASS
s6-03	G2	PASS
s6-03	G-lang	ru
s6-04	S6b.1	PASS
s6-04	S6b.2	PASS
s6-04	S6b.3	PASS
s6-04	S6b.4	PASS
s6-04	G1	PASS
s6-04	G2	FAIL
s6-04	G-lang	en
s6-05	S6a.1	PASS
s6-05	S6a.2	PARTIAL
s6-05	S6a.3	FAIL
s6-05	S6a.4	FAIL
s6-05	S6a.5	N/A
s6-05	S6a.6	PASS
s6-05	S6a.7	FAIL
s6-05	G1	N/A
s6-05	G2	PASS
s6-05	G-lang	en
s6-06	S6b.1	PASS
s6-06	S6b.2	PASS
s6-06	S6b.3	PASS
s6-06	S6b.4	PASS
s6-06	G1	PASS
s6-06	G2	PASS
s6-06	G-lang	en
s6-07	S6a.1	PASS
s6-07	S6a.2	PASS
s6-07	S6a.3	PARTIAL
s6-07	S6a.4	PASS
s6-07	S6a.5	N/A
s6-07	S6a.6	PASS
s6-07	S6a.7	PARTIAL
s6-07	G1	PASS
s6-07	G2	PASS
s6-07	G-lang	ru
s6-08	S6b.1	PASS
s6-08	S6b.2	PASS
s6-08	S6b.3	PASS
s6-08	S6b.4	PASS
s6-08	G1	PASS
s6-08	G2	PASS
s6-08	G-lang	ru
s6-09	S6b.1	PASS
s6-09	S6b.2	PASS
s6-09	S6b.3	PASS
s6-09	S6b.4	PASS
s6-09	G1	PASS
s6-09	G2	PASS
s6-09	G-lang	ru
s6-10	S6a.1	PASS
s6-10	S6a.2	PASS
s6-10	S6a.3	FAIL
s6-10	S6a.4	FAIL
s6-10	S6a.5	N/A
s6-10	S6a.6	PASS
s6-10	S6a.7	FAIL
s6-10	G1	N/A
s6-10	G2	PASS
s6-10	G-lang	en
s6-11	S6a.1	PASS
s6-11	S6a.2	PASS
s6-11	S6a.3	PARTIAL
s6-11	S6a.4	PASS
s6-11	S6a.5	N/A
s6-11	S6a.6	PASS
s6-11	S6a.7	PARTIAL
s6-11	G1	PASS
s6-11	G2	PASS
s6-11	G-lang	ru
s6-12	S6a.1	PASS
s6-12	S6a.2	PARTIAL
s6-12	S6a.3	FAIL
s6-12	S6a.4	PASS
s6-12	S6a.5	N/A
s6-12	S6a.6	FAIL
s6-12	S6a.7	FAIL
s6-12	G1	N/A
s6-12	G2	PASS
s6-12	G-lang	en
s6-13	S6a.1	PASS
s6-13	S6a.2	PASS
s6-13	S6a.3	PARTIAL
s6-13	S6a.4	PASS
s6-13	S6a.5	N/A
s6-13	S6a.6	PASS
s6-13	S6a.7	PASS
s6-13	G1	PASS
s6-13	G2	PASS
s6-13	G-lang	en
s6-14	S6b.1	PASS
s6-14	S6b.2	PASS
s6-14	S6b.3	PASS
s6-14	S6b.4	FAIL
s6-14	G1	PASS
s6-14	G2	PASS
s6-14	G-lang	en
s6-15	S6a.1	FAIL
s6-15	S6a.2	PARTIAL
s6-15	S6a.3	FAIL
s6-15	S6a.4	FAIL
s6-15	S6a.5	FAIL
s6-15	S6a.6	PARTIAL
s6-15	S6a.7	PARTIAL
s6-15	G1	N/A
s6-15	G2	PASS
s6-15	G-lang	en
s6-16	S6b.1	PASS
s6-16	S6b.2	PASS
s6-16	S6b.3	PASS
s6-16	S6b.4	FAIL
s6-16	G1	PASS
s6-16	G2	PASS
s6-16	G-lang	en
s6-17	S6b.1	PASS
s6-17	S6b.2	PASS
s6-17	S6b.3	PASS
s6-17	S6b.4	PASS
s6-17	G1	PASS
s6-17	G2	N/A
s6-17	G-lang	ru
s6-18	S6a.1	PASS
s6-18	S6a.2	PASS
s6-18	S6a.3	PARTIAL
s6-18	S6a.4	PASS
s6-18	S6a.5	N/A
s6-18	S6a.6	PASS
s6-18	S6a.7	PASS
s6-18	G1	PASS
s6-18	G2	PASS
s6-18	G-lang	en
s6-19	S6b.1	PASS
s6-19	S6b.2	PASS
s6-19	S6b.3	PASS
s6-19	S6b.4	PASS
s6-19	G1	PASS
s6-19	G2	PASS
s6-19	G-lang	ru
s6-20	S6a.1	PASS
s6-20	S6a.2	PARTIAL
s6-20	S6a.3	FAIL
s6-20	S6a.4	FAIL
s6-20	S6a.5	N/A
s6-20	S6a.6	PASS
s6-20	S6a.7	FAIL
s6-20	G1	N/A
s6-20	G2	PASS
s6-20	G-lang	en
END-TSV
```
