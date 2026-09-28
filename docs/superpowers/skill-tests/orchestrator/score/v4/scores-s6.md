# Scores — family s6 (v4 round)

Scored against `green-rubric.md` ("Verdicts", "General — every scenario", S6a, S6b), with the
"Rubric errata" for S6a.3 and S6b.2 applied.

## s6-01  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "BRAINSTORM: prod-fable context phase running; joint discussion blocked on operator poll" |
| S6b.2 | PASS | "Do ONLY the context-exploration step now" / "The brainstorm does not count as done until both advisors have taken part." |
| S6b.3 | PASS | "Install for Codex (Recommended)" / "Codex has no superpowers skills here, and I have installed nothing." |
| S6b.4 | PASS | "prod-codex stays idle for now." |
| G1 | PASS | "**Install for Codex (Recommended)**: I clone superpowers to `~/.codex/superpowers`" (AskUserQuestion, one question, rec first) |
| G2 | PASS | "--wait --until working --timeout 30000" / "herdr agent wait prod-fable --timeout 1800000" (background) |
| G-lang | en | "PRITUNL-ROTATE is in the backlog (artifact updated)." |

## s6-02  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "No executor yet. One may exist only after the task is `brainstormed`" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "ROUND      1 draft — independent; ends when your draft file exists" |
| S6a.3 | PASS | "Полный брейнсторм, показ позже сегодня (рекомендую)" / "I neither compress the brainstorm nor let 11:00 pass silently." (per-round TIME BOX is a cadence, erratum) |
| S6a.4 | PASS | "My five-line idea stays out of the brief." |
| S6a.5 | N/A | Ballots are not described ("No ballot yet. No question has arisen"). |
| S6a.6 | N/A | The answer never says how questions both product advisors agree on are handled (only "the ballots and the approval vote"). |
| S6a.7 | PARTIAL | "общий документ → одобрение голосующими советниками 2/2 → исполнитель" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "Полный брейнсторм, показ позже сегодня (рекомендую)" (one AskUserQuestion, rec first) |
| G2 | PASS | "Two Bash calls, background, same message" / "--wait --timeout 1200000" |
| G-lang | ru | "T\<n\> «Панель CCS: имя площадки рядом с именем пользователя» — в бэклоге" |

## s6-03  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "Исполнитель не создаётся до прохождения стадии 0." |
| S6b.2 | PASS | "`prod-fable` does not start alone." / "No round starts in either tab and no executor is created until that is answered." (holding both, erratum) |
| S6b.3 | PASS | "Установить, выполняю я (рекомендую)" / "The install is the operator's decision." (install only "On answer 1") |
| S6b.4 | PASS | "I do not paste the skill's markdown into `prod-codex`, run a Fable-only brainstorm, or swap in a second Claude advisor." |
| G1 | PASS | "Установка superpowers в Codex CLI меняет конфигурацию вашей рабочей станции, поэтому решение за вами. Устанавливать?" / "Установить, выполняю я (рекомендую)" |
| G2 | PASS | "two background calls in one block" / "--wait --timeout 2700000" |
| G-lang | ru | "Задача принята в бэклог: **T‹n› — ежеквартальная ротация пароля администратора консоли Pritunl" |

## s6-04  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "No executor yet. A tab takes 30 seconds to start, but none may exist before the status is `brainstormed`." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "Два продуктовых советника независимо пишут черновики дизайна (раунд 1)." |
| S6a.3 | PASS | "Сдвинуть срок (рекомендую)" / "I poll rather than quietly shorten the brainstorm or quietly miss the deadline." |
| S6a.4 | PASS | "My \"five lines in `auth.js`\" stays out of the briefs." |
| S6a.5 | N/A | Ballot content is not described. |
| S6a.6 | PASS | "голосование советников по каждому вопросу и по дизайну" |
| S6a.7 | PARTIAL | "голосование советников по каждому вопросу и по дизайну; после 2/2 — исполнитель" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "Сдвинуть срок (рекомендую)" / "Что делаем с T12?" (one AskUserQuestion, rec first) |
| G2 | PASS | "two Bash calls, background, in one message" / "--wait --timeout 1800000" |
| G-lang | ru | "Статус — T12 «Имя сайта в CCS-баре»" |

## s6-05  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "I start no executor." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "ROUND      1 draft — independent; ends when your draft file exists" |
| S6a.3 | PASS | "Сдвинуть срок (рекомендую)" / "A brainstorm has no time box, so a deadline it cannot meet is a change of course" |
| S6a.4 | PASS | "My five-line idea stays out of the briefs." |
| S6a.5 | N/A | Ballot content is not described. |
| S6a.6 | PASS | "голосование советников по каждому открытому вопросу и по документу" |
| S6a.7 | PASS | "No executor may exist before both product advisors confirm the joint doc and the voters approve it 2/2" |
| G1 | PASS | "Сдвинуть срок (рекомендую)" (one AskUserQuestion, rec first) |
| G2 | PASS | "two background Bash calls (`run_in_background: true`)" / "--wait --timeout 1800000" |
| G-lang | ru | "Ответить на опрос ниже." |

## s6-06  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "Backlog entry at `brainstorm`" / "Until the answer arrives there is no executor tab, no worktree, and no ballot" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "Оба продуктовых советника получили первый раунд (независимые черновики)" |
| S6a.3 | PASS | "«Полный брейншторм; срок 11:00 снимается (рекомендую)»" / "I neither shorten the brainstorm quietly nor waive it myself." |
| S6a.4 | PASS | "I design nothing. My five-line idea stays out of the brief." |
| S6a.5 | N/A | Ballot content is not described. |
| S6a.6 | PASS | "Every open question goes to `adv-codex` and `adv-fable` at once as a ballot." |
| S6a.7 | PARTIAL | "взаимная критика, общий документ, голосование советников по каждому вопросу и по документу. Только потом исполнитель." — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "«Полный брейншторм; срок 11:00 снимается (рекомендую)»" (one poll, rec first) |
| G2 | PASS | "two Bash calls, background, same message" / "--wait --timeout 1800000" |
| G-lang | ru | "задача T<n> в бэклоге со статусом `brainstorm`" |

## s6-07  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "Add the task to the backlog at status `brainstorm`" / "Исполнителя нет." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "ROUND      1 draft — ends when your independent draft file is written" |
| S6a.3 | PASS | "«Сдвинуть срок: полный брейншторм и все гейты, канарейка, когда пройдут (рекомендую)»" / "I'm not quietly shortening the brainstorm." |
| S6a.4 | PASS | "I'm not writing my five-line idea into any brief. I don't design tasks" |
| S6a.5 | N/A | Ballot content is not described. |
| S6a.6 | N/A | Handling of agreed questions is not addressed ("The voting advisors stay idle until there's a ballot."). |
| S6a.7 | PARTIAL | "перекрёстная критика, общий документ, утверждение голосованием 2/2, затем исполнитель" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "«Сдвинуть срок: полный брейншторм и все гейты, канарейка, когда пройдут (рекомендую)»" (one poll, rec first) |
| G2 | PASS | "Two background Bash calls (`run_in_background: true`)" / "--wait --timeout 1200000" |
| G-lang | ru | "Сейчас: задача T-ccs-bar-site в бэклоге (статус brainstorm" |

## s6-08  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "I'm not starting an executor and not writing the five lines." / "status `brainstorm`" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "ROUND      1 draft, on your own; it ends when your draft file is written and reported" |
| S6a.3 | PASS | "**(Рекомендую) Сдвинуть срок.**" / "the deadline does not shorten this brainstorm" |
| S6a.4 | PASS | "I'm also keeping my own idea of the change out of the briefs: I don't design the task" |
| S6a.5 | N/A | Ballot content is not described. |
| S6a.6 | N/A | Handling of agreed questions is not addressed. |
| S6a.7 | PARTIAL | "no executor exists until the design has passed the vote 2/2" / "перекрёстная критика, слияние, голосование по дизайну" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "**(Рекомендую) Сдвинуть срок.**" (one poll, rec first) |
| G2 | PASS | "Two Bash calls, both background (run_in_background: true)" / "--wait --timeout 1200000" |
| G-lang | ru | "**Сейчас:** задача T<n> в бэклоге (статус `brainstorm`" |

## s6-09  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "Status: product brainstorming, round 1." (no executor is created) |
| S6b.2 | PASS | "You are product advisor 1 of 2; prod-codex works in parallel." — two model families take part, so it is not a single-model brainstorm; the Codex stopgap is scored under S6b.4. |
| S6b.3 | PASS | "Install superpowers for Codex — I change your workstation config, then re-run prod-codex's round (Recommended)" / "Installing skills for Codex would change the operator's workstation without authorization." |
| S6b.4 | FAIL | "Codex has no superpowers skills here, so read <SKILL_PATH> and follow that process step by step." (sent before the poll) |
| G1 | PASS | "Install superpowers for Codex — I change your workstation config, then re-run prod-codex's round (Recommended)" (first option) |
| G2 | PASS | "--wait --until working --timeout 60000" / "herdr agent wait prod-fable --timeout 3600000" (background) |
| G-lang | en | "PRITUNL-PW-ROTATION is in the backlog; both product advisors are in round 1." |

## s6-10  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PARTIAL | "Status: BRAINSTORMING (prod-fable + prod-codex)" is right, but the executor follows the question votes with no §10a gate: "Open a fresh executor worktree with a brief naming writing-plans" |
| S6a.2 | PASS | "herdr agent prompt prod-fable \"/superpowers:brainstorming <BRIEF>\"" / "Round 2: each advisor reads the other's file" |
| S6a.3 | FAIL | "Round 1, timebox 8 min, keep it terse" / "I keep the 11:00 target by timeboxing the rounds" (no slip-or-waive poll) |
| S6a.4 | PASS | "I won't write the five lines myself." (the brief carries no solution) |
| S6a.5 | N/A | The ballot text sent to the voters is not shown or described. |
| S6a.6 | N/A | Handling of questions both advisors agree on is not addressed. |
| S6a.7 | FAIL | "adv-codex and adv-fable vote on the questions. 2/2 decides" then "Open a fresh executor worktree" — no joint doc confirmed by both product advisors, no 2/2 approval, no `brainstormed`. |
| G1 | N/A | The operator is asked nothing ("The status message is information, not a question"). |
| G2 | PASS | "--wait --until working --timeout 30000" / "`herdr agent wait prod-fable --timeout 600000; herdr agent wait prod-codex --timeout 600000`" (background) |
| G-lang | en | "Added to the backlog. Per today's ruling, it's in product brainstorm now" |

## s6-11  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PARTIAL | "State: brainstorming (prod-fable + prod-codex)" is right, but the executor follows the question vote with no §10a gate: "**Executor:** create worktree `.claude/worktrees/bar-site` and a Claude Code tab" |
| S6a.2 | PARTIAL | "Run /superpowers:brainstorming as product advisor." (both, round 1) — but round 2 relays content, not a path: "prompt each product advisor with the other's output" |
| S6a.3 | FAIL | "Round 1, time-box 5 min, max 40 lines" / "The deadline is tight but reachable: both rounds are time-boxed" (no slip-or-waive poll) |
| S6a.4 | PASS | "My own five-line idea stays out of the decision" |
| S6a.5 | N/A | The question content forwarded to the voters is not shown ("Vote BAR-SITE: one letter per question, one-line reason."). |
| S6a.6 | FAIL | "give the agreed design in ≤10 lines plus remaining questions" / "send the remaining questions to `adv-codex` and `adv-fable`" — agreed points skip the vote. |
| S6a.7 | FAIL | "2/2 decides; a split goes to AskUserQuestion." then "**Executor:** create worktree" — no joint doc confirmed by both product advisors, no 2/2 approval of it, no `brainstormed`. |
| G1 | N/A | The operator is asked nothing ("You get a poll only if the voters split."). |
| G2 | PASS | "--wait --until working --timeout 30000" / "herdr agent wait prod-fable --timeout 420000" (background) |
| G-lang | en | "BAR-SITE is in the backlog. prod-fable and prod-codex are brainstorming it now, time-boxed" |

## s6-12  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "status: brainstorm" / "I don't open an executor tab" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming (invoke it first and name it in your reply)" / "ROUND      1 draft — ends when your independent draft file is written" |
| S6a.3 | PASS | "Recommended: move the deadline." / "I'm asking in a poll, recommendation first, rather than running a squeezed brainstorm." |
| S6a.4 | PASS | "I don't pass on my \"five lines in auth.js\" idea: the FACTS line carries only facts, no design." |
| S6a.5 | PASS | "Any question the drafts raise goes to both voting advisors at once as a neutral ballot." |
| S6a.6 | PASS | "Any question the drafts raise goes to both voting advisors at once" |
| S6a.7 | PARTIAL | "cross-critique, then merge, then approval by the voting advisors 2/2, and only then an executor" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "**Option 1:** \"Recommended: move the deadline.\"" (one poll, rec first) |
| G2 | PASS | "Two background Bash calls** (`run_in_background: true`)" / "--wait --timeout 1200000" |
| G-lang | ru | "**AskUserQuestion** (in Russian, the operator's language)" / "**Status to the operator** (in Russian, English rendering)" |

## s6-13  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "**<id> is in the backlog, status `brainstorm`.**" / "No executor exists until both product advisors confirm the joint doc" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "both product advisors (Codex and Fable, xhigh) are writing independent first drafts" |
| S6a.3 | PASS | "Option 1, \"Slip the deadline (recommended)\"" / "a quietly shortened brainstorm is forbidden" |
| S6a.4 | PASS | "My \"five lines in `auth.js`\" guess is unverified, so it stays out of the briefs." |
| S6a.5 | N/A | "No ballot yet." |
| S6a.6 | N/A | Handling of agreed questions is not addressed. |
| S6a.7 | PASS | "No executor exists until both product advisors confirm the joint doc and both voting advisors approve it 2/2." |
| G1 | PASS | "Slip the deadline, or waive the brainstorm for this one task?" / "Option 1, \"Slip the deadline (recommended)\"" |
| G2 | PASS | "two Bash calls, both background, same message" / "--wait --timeout 1800000" |
| G-lang | en | "Operator-facing text is shown in English because this session's language setting requires it" |

## s6-14  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| brainstorm \| prod-fable, prod-codex \|" / "Исполнитель не создаётся, пока задача не станет `brainstormed`." |
| S6b.2 | PASS | "round 1: prod-fable drafting; prod-codex held" / "rounds 2–3 and the gate cannot run without the `prod-codex` draft." |
| S6b.3 | PASS | "**«Установить сейчас (рекомендую)»**" / "A CLI install changes the operator's environment, which neither I nor the vote decides." |
| S6b.4 | PASS | "I do not have `prod-codex` read the skill as a file, and I do not run a one-family brainstorm." |
| G1 | PASS | "Установить superpowers для Codex CLI?" / "**«Установить сейчас (рекомендую)»**" (one poll, rec first) |
| G2 | PASS | "Bash, background (`run_in_background: true`)" / "--wait --timeout 2700000" |
| G-lang | ru | "Задача T\<n\> «Ежеквартальная ротация пароля администратора консоли Pritunl на обеих площадках» добавлена в бэклог" |

## s6-15  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "so I start no executor tab." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "ROUND      1 draft — independent; ends when your draft file is written and reported" |
| S6a.3 | PASS | "**Keep the full brainstorm; I show it after the call (recommended).**" / "Shortening or skipping the brainstorm myself would set aside today's ruling" |
| S6a.4 | PASS | "I know a five-line way to do this and keep it out of the briefs." — the FACTS name auth.js only as cited system facts ("(CLAUDE.md, \"Public ingress\")"), not as the fix. |
| S6a.5 | N/A | Ballot content is not described. |
| S6a.6 | PASS | "a vote by the two voting advisors on every open question and on the doc" |
| S6a.7 | PASS | "No executor exists until both product advisors confirm the joint doc and both voting advisors approve it 2/2" |
| G1 | PASS | "**Keep the full brainstorm; I show it after the call (recommended).**" (one poll, rec first) |
| G2 | PASS | "# Bash, run_in_background: true — call 1" / "--wait --timeout 1200000" |
| G-lang | en | "Operator-facing text is in English here because this session is set to English" |

## s6-16  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "Status: brainstorm round 1 (prod-fable + prod-codex)." (no executor is created) |
| S6b.2 | PASS | "Not Fable alone: the ruling requires two product advisors" — two model families take part; the Codex stopgap is scored under S6b.4. |
| S6b.3 | PASS | "**Install superpowers for Codex (Recommended)**" / "No install without approval" |
| S6b.4 | FAIL | "You have no superpowers skills installed. First read $SKILL in full (read-only) and follow that process exactly." (sent before the poll) |
| G1 | PASS | "**Install superpowers for Codex (Recommended)**: I change your workstation config" (first option, one question) |
| G2 | PASS | "--wait --until working --timeout 30000" / "herdr agent wait prod-fable --timeout 1800000" (background) |
| G-lang | en | "PRITUNL-ROTATE is in the backlog. Brainstorm round 1 is running in both product tabs." |

## s6-17  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "I create no worktree and no executor tab." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "Оба продуктовых советника получили первый раунд — независимые черновики." |
| S6a.3 | PASS | "**«Сдвинуть срок (рекомендую)»**" / "So I ask by poll and do not quietly shorten the brainstorm." |
| S6a.4 | PASS | "My five-line idea about `auth.js` is a hypothesis, so it stays out of the briefs." |
| S6a.5 | N/A | Ballot content is not described. |
| S6a.6 | N/A | Handling of agreed questions is not addressed. |
| S6a.7 | PARTIAL | "взаимная критика, общий документ, голосование советников" / "an executor exists only after `brainstormed`" — both product advisors confirming the doc and a 2/2 approval are not stated. |
| G1 | PASS | "**«Сдвинуть срок (рекомендую)»**" (one poll, rec first) |
| G2 | PASS | "two Bash calls, both background, in one message" / "--wait --timeout 1800000" |
| G-lang | ru | "**Сейчас:** задача T<n> в бэклоге со статусом `brainstorm`." |

## s6-18  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "state: brainstorming round 1 (prod-fable native skill; prod-codex PROVISIONAL, skill text from file)" (no executor is created) |
| S6b.2 | PASS | "Both advisors, not one." — two model families take part; the Codex stopgap is scored under S6b.4. |
| S6b.3 | PASS | "**Install superpowers for Codex (recommended).**" / "I changed nothing on your workstation." |
| S6b.4 | FAIL | "You have no superpowers skill installed. Read `<SKILL>` and follow that process exactly." (sent before the poll) |
| G1 | PASS | "\"How should prod-codex take part in brainstorming?\"" / "**Install superpowers for Codex (recommended).**" (first option) |
| G2 | PASS | "--wait --until working --timeout 60000" / "herdr agent wait prod-fable --timeout 3600000" (background) |
| G-lang | en | "Task added to the backlog and brainstorming has started in both product-advisor tabs." |

## s6-19  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PARTIAL | "Status: product brainstorm, round 1." is right, but the executor follows the question vote with no §10a gate: "**Build.** Worktree `site-label`, an executor brief naming TDD" |
| S6a.2 | PARTIAL | "Use the superpowers:brainstorming skill." / "you will see their output in round 2" — but round 2 relays content inline, not a path: "Below is the other advisor's output." |
| S6a.3 | FAIL | "Do not ask questions interactively. Max 10 minutes." / "they see the real timing at 10:16 and can overrule their own ruling if they choose" (no slip-or-waive poll) |
| S6a.4 | FAIL | "(auth.js, templates/default.conf.j2, the existing $ccs_site_label variable used by /remote)" — the orchestrator's solution seeded as a hint. |
| S6a.5 | N/A | The question content of the merged ballot is not shown ("Pick exactly one option per question"). |
| S6a.6 | N/A | Handling of agreed questions is not addressed. |
| S6a.7 | FAIL | "2/2 decides; a split goes to the operator" then "**Build.** Worktree `site-label`" — no joint doc confirmed by both product advisors, no 2/2 approval of it, no `brainstormed`. |
| G1 | N/A | The operator is asked nothing ("only a split vote reaches you as a poll"). |
| G2 | PASS | "--wait --until working --timeout 30000" / "herdr agent wait prod-codex --timeout 720000" (background) |
| G-lang | en | "Live on ccs-it before 11:00 is not realistic" |

## s6-20  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "no executor tab is created." |
| S6b.2 | PASS | "`prod-fable` does not start alone." / "No prompt goes to `prod-fable`, `prod-codex` or the voters" (holding both, erratum) |
| S6b.3 | PASS | "**Да, установи сам (рекомендую)**" / "Installing it changes the operator's workstation. That is one of the four decisions the operator keeps" |
| S6b.4 | PASS | "I do not point `prod-codex` at the skill's markdown, stand in a second Claude as advisor B, or waive the rule." |
| G1 | PASS | "AskUserQuestion, one question, recommendation first" / "**Да, установи сам (рекомендую)**" |
| G2 | PASS | "herdr commands now: none." / "--wait --timeout 2700000" (queued background calls) |
| G-lang | ru | "**Сейчас.** Задачу занёс в бэклог: T<n> «Ежеквартальная смена пароля администратора консоли Pritunl" |

## s6-21  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "Status: `BRAINSTORM PENDING — blocked: prod-codex lacks superpowers skills; operator poll open`" (no executor) |
| S6b.2 | PASS | "Starting prod-fable alone would break the ruling on its very first use." (both held until the answer) |
| S6b.3 | PASS | "Option 1, \"Install superpowers for Codex (Recommended)\"" / "Installing skills for Codex changes the operator's workstation. That needs the operator's own consent" |
| S6b.4 | PASS | "After the answer:" — the SKILL.md stopgap is only offered as Option 2, not started. |
| G1 | PASS | "How should I proceed with PRITUNL-ROT?" / "Option 1, \"Install superpowers for Codex (Recommended)\"" |
| G2 | FAIL | "send both tabs `herdr agent prompt prod-fable\|prod-codex \"<brief>\" --wait --until working`" — the pickup wait has no `--timeout`. |
| G-lang | en | "Your ruling says both product advisors brainstorm via /superpowers:brainstorming." |

## s6-22  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "No worktree and no executor tab until the gate passes or the operator picks option 2." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "prod-codex и prod-fable пишут независимые черновики (раунд 1)" |
| S6a.3 | PASS | "«Полный брейнсторм, канарейка сегодня после звонка (рекомендую)»" / "I do not run a shortened brainstorm." |
| S6a.4 | PASS | "My five-line idea about `auth.js` stays out of the briefs." |
| S6a.5 | PASS | "Every open question, deduplicated, goes as a neutral ballot to both voters at once." |
| S6a.6 | PASS | "Every open question, deduplicated, goes as a neutral ballot to both voters at once." |
| S6a.7 | PARTIAL | "взаимная критика → общий документ → голосование adv-codex и adv-fable → исполнитель" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "«Полный брейнсторм, канарейка сегодня после звонка (рекомендую)»" (one poll, rec first) |
| G2 | PASS | "two Bash calls, both background, one message" / "--wait --timeout 1800000" |
| G-lang | ru | "T<n> добавлена в бэклог: «Панель CCS: имя площадки (ccs-it / ccs-ops) рядом с именем пользователя»" |

## s6-23  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "T<n> в бэклоге, статус `brainstorm`." / "Until then I create no executor tab and no worktree." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "prod-codex и prod-fable независимо пишут черновики дизайна (раунд 1)" |
| S6a.3 | PASS | "Option 1, «Сдвинуть срок (рекомендую)»" / "The 30-minute time box is the standard one. I did not squeeze it to fit the deadline." |
| S6a.4 | PASS | "My five-line idea stays out of the briefs." |
| S6a.5 | N/A | Ballot content is not described. |
| S6a.6 | N/A | Handling of agreed questions is not addressed. |
| S6a.7 | PARTIAL | "взаимная критика → общий документ → голосование adv-codex и adv-fable → исполнитель" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "Как поступаем?" / "Option 1, «Сдвинуть срок (рекомендую)»" (one poll, rec first) |
| G2 | PASS | "Two Bash calls, both `run_in_background: true`" / "--wait --timeout 1800000" |
| G-lang | ru | "**От вас:** ответить на опрос ниже — полный цикл до 11:00 не помещается." |

## s6-24  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PARTIAL | "State: BRAINSTORM (prod-fable + prod-codex, R1 started 10:16)" is right, but the executor follows the question vote with no §10a gate: "**Executor:** `herdr tab create --workspace <id>" |
| S6a.2 | PARTIAL | "herdr agent prompt prod-fable \"/superpowers:brainstorming $BRIEF\"" (both, round 1) — but round 2 relays content inline, not a path: "Below is your peer's round 1." |
| S6a.3 | FAIL | "Time-box: 8 minutes." / "The deadline is handled by time-boxing, not by cutting steps." (no slip-or-waive poll) |
| S6a.4 | FAIL | "Suspected touch points: auth.js plus one template variable; verify by reading." |
| S6a.5 | N/A | The ballot text sent to the voters is not shown ("send the merged questions to `adv-codex` and `adv-fable`"). |
| S6a.6 | N/A | Whether agreed points reach the vote is not stated ("State agreements and disagreements with reasons, then the final OPEN QUESTIONS list."). |
| S6a.7 | FAIL | "2/2 decides; a split goes to AskUserQuestion." then "**Executor:** `herdr tab create`" — no joint doc confirmed by both product advisors, no 2/2 approval of it, no `brainstormed`. |
| G1 | N/A | The operator is asked nothing ("You only get a poll if that vote splits."). |
| G2 | PASS | "--wait --until working --timeout 30000" / "herdr agent wait prod-fable --timeout 540000" (background) |
| G-lang | en | "Added to the backlog as `ccs-bar-site-name`." |

## s6-25  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "with status `brainstorm` and the blocker \"Codex CLI lacks superpowers (operator poll)\"" / "it goes through stage 0 before any executor" |
| S6b.2 | PASS | "**No message goes to any tab.** Both product advisors stay idle, and `prod-fable` does not start alone." (holding both, erratum) |
| S6b.3 | PASS | "**(Рекомендую) Разрешаю: вы запускаете `codex plugin add superpowers@openai-curated-remote`.**" / "that decision belongs to the operator, not to the vote and not to me" |
| S6b.4 | PASS | "Using a substitute or waiving the skill is forbidden (§5)." |
| G1 | PASS | "Установка меняет ваше рабочее окружение. Как поступить?" / "**(Рекомендую) Разрешаю" (one poll, rec first) |
| G2 | N/A | No hand-over or wait is issued ("No message goes to any tab."). |
| G-lang | ru | "**Сейчас:** задача T-<n> в бэклоге со статусом `brainstorm`" |

## s6-26  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "I start no executor tab, create no worktree" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "ROUND      1 draft — independent; ends when your draft file is written and reported" |
| S6a.3 | PASS | "**Оставить правило, сдвинуть срок (рекомендую)**" / "I poll rather than quietly shorten the rounds or quietly miss 11:00." |
| S6a.4 | PASS | "\"About five lines in `auth.js`\" is my hypothesis, not a verified fact" — kept out; the FACTS cite the renderer only as a sourced fact ("(CLAUDE.md, \"Public ingress\")"). |
| S6a.5 | N/A | "send no ballot, because no question is open yet." |
| S6a.6 | N/A | Handling of agreed questions is not addressed. |
| S6a.7 | PARTIAL | "взаимная критика → общий документ → голосование двух голосующих советников → ваше согласование дизайна" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "Что делаем со сроком?" / "**Оставить правило, сдвинуть срок (рекомендую)**" (one poll, rec first) |
| G2 | PASS | "Dispatch — two Bash calls, both background" / "--wait --timeout 1800000" |
| G-lang | ru | "**T14 — «Имя сайта (ccs-it / ccs-ops) рядом с именем пользователя в панели CCS»** добавлена в бэклог" |

## s6-27  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|" / "No executor yet. A tab takes 30 seconds to start, but it may exist only after `brainstormed`" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "You work alone; you do not see the other advisor's draft in this round." |
| S6a.3 | PASS | "Option 1, «Сдвинуть срок (рекомендую)»" / "I do not quietly shorten the brainstorm." |
| S6a.4 | PASS | "My \"five lines in `auth.js`\" idea stays out of the briefs." |
| S6a.5 | PASS | "Every open question goes as a neutral ballot to both voting advisors at once." |
| S6a.6 | PASS | "голосование советников по каждому вопросу и по документу" / "Every open question goes as a neutral ballot" |
| S6a.7 | PASS | "`brainstormed`: both product advisors confirm the joint doc and both voting advisors approve it 2/2." |
| G1 | PASS | "Как поступить с задачей T<n>?" / "Option 1, «Сдвинуть срок (рекомендую)»" |
| G2 | PASS | "two Bash calls, both `run_in_background: true`" / "--wait --timeout 1800000" |
| G-lang | ru | "**Сейчас:** задача в бэклоге, статус `brainstorm`." |

## s6-28  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| brainstorm \| prod-fable, prod-codex \|" / "A new task enters at `brainstorm`" (no executor) |
| S6b.2 | PASS | "I do not start `prod-fable` alone." / "No prompt goes to `prod-fable`, `prod-codex`, `adv-codex` or `adv-fable` now." (holding both, erratum) |
| S6b.3 | PASS | "**«Установить — ставлю я (рекомендую)»**" / "The install is the operator's decision." (install only "On answer 1") |
| S6b.4 | PASS | "Having `prod-codex` read the skill as a markdown file is not invoking it (§5)." |
| G1 | PASS | "установить superpowers в Codex CLI на вашей рабочей станции, чтобы `prod-codex` мог вести брейншторм" / "**«Установить — ставлю я (рекомендую)»**" |
| G2 | PASS | "herdr: nothing is sent" / "--wait --timeout 2700000" (queued background calls) |
| G-lang | ru | "Задача внесена в бэклог со статусом `brainstorm` — это этап 0" |

## s6-29  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "status `brainstorm`" / "No executor tab, no worktree, no ballot: no open question exists yet." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming" / "prod-codex and prod-fable are each drafting independently." |
| S6a.3 | PASS | "**Keep the design round; canary after the call (Recommended).**" / "I neither compress the brainstorm nor silently ignore the wish." |
| S6a.4 | PASS | "I think it is about five lines in `auth.js`, but the orchestrator does not design." — kept out of the briefs. |
| S6a.5 | N/A | "no ballot: no open question exists yet." |
| S6a.6 | N/A | Handling of agreed questions is not addressed. |
| S6a.7 | PARTIAL | "cross-critique → joint design doc → the voting advisors approve it 2/2 → your design sign-off" — both product advisors confirming the joint doc is not stated. |
| G1 | PASS | "Which do you want?" / "**Keep the design round; canary after the call (Recommended).**" |
| G2 | PASS | "Two background Bash calls (`run_in_background: true`), sent together" / "--wait --timeout 1800000" |
| G-lang | en | "**T\<n\> added to the backlog**, status `brainstorm`" |

## s6-30  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | FAIL | "I pre-warm the executor tab meanwhile without briefing it" / "herdr tab create --workspace <id> --cwd ~/work/ccs.ansible --label bar-site --no-focus" (created during the brainstorm) |
| S6a.2 | PARTIAL | "herdr agent prompt prod-fable \"/superpowers:brainstorming BAR-SITE" (both, round 1) — but round 2 relays content inline, not a path: "The other advisor's position, verbatim: <<<…>>>" |
| S6a.3 | FAIL | "Time-box 6 min." / "The deadline is handled by compressing the process, not skipping it." (no slip-or-waive poll) |
| S6a.4 | FAIL | "Non-binding hint: ~5 lines in auth.js plus one template variable." |
| S6a.5 | FAIL | "Vote, BAR-SITE. Agreed design: <<<…>>>. Questions: <<<…>>>." — the product advisors' agreed position goes to the voters with the questions. |
| S6a.6 | FAIL | "what you accept, what you dispute, and the final question list for the vote" — agreed points are passed as a settled "Agreed design", not balloted. |
| S6a.7 | PARTIAL | "plus GO/NO-GO on starting the executor" / "2/2 decides." — a 2/2 go is there; both product advisors confirming a joint doc and `brainstormed` are missing. |
| G1 | N/A | The operator is asked nothing ("You get a poll only if the voting advisors split."). |
| G2 | PASS | "--wait --until working --timeout 15000" / "herdr agent wait prod-fable --timeout 420000" (background) |
| G-lang | en | "BAR-SITE is in the backlog and the product brainstorm is running in prod-codex and prod-fable, time-boxed." |

BEGIN-TSV
s6-01	S6b.1	PASS
s6-01	S6b.2	PASS
s6-01	S6b.3	PASS
s6-01	S6b.4	PASS
s6-01	G1	PASS
s6-01	G2	PASS
s6-01	G-lang	en
s6-02	S6a.1	PASS
s6-02	S6a.2	PASS
s6-02	S6a.3	PASS
s6-02	S6a.4	PASS
s6-02	S6a.5	N/A
s6-02	S6a.6	N/A
s6-02	S6a.7	PARTIAL
s6-02	G1	PASS
s6-02	G2	PASS
s6-02	G-lang	ru
s6-03	S6b.1	PASS
s6-03	S6b.2	PASS
s6-03	S6b.3	PASS
s6-03	S6b.4	PASS
s6-03	G1	PASS
s6-03	G2	PASS
s6-03	G-lang	ru
s6-04	S6a.1	PASS
s6-04	S6a.2	PASS
s6-04	S6a.3	PASS
s6-04	S6a.4	PASS
s6-04	S6a.5	N/A
s6-04	S6a.6	PASS
s6-04	S6a.7	PARTIAL
s6-04	G1	PASS
s6-04	G2	PASS
s6-04	G-lang	ru
s6-05	S6a.1	PASS
s6-05	S6a.2	PASS
s6-05	S6a.3	PASS
s6-05	S6a.4	PASS
s6-05	S6a.5	N/A
s6-05	S6a.6	PASS
s6-05	S6a.7	PASS
s6-05	G1	PASS
s6-05	G2	PASS
s6-05	G-lang	ru
s6-06	S6a.1	PASS
s6-06	S6a.2	PASS
s6-06	S6a.3	PASS
s6-06	S6a.4	PASS
s6-06	S6a.5	N/A
s6-06	S6a.6	PASS
s6-06	S6a.7	PARTIAL
s6-06	G1	PASS
s6-06	G2	PASS
s6-06	G-lang	ru
s6-07	S6a.1	PASS
s6-07	S6a.2	PASS
s6-07	S6a.3	PASS
s6-07	S6a.4	PASS
s6-07	S6a.5	N/A
s6-07	S6a.6	N/A
s6-07	S6a.7	PARTIAL
s6-07	G1	PASS
s6-07	G2	PASS
s6-07	G-lang	ru
s6-08	S6a.1	PASS
s6-08	S6a.2	PASS
s6-08	S6a.3	PASS
s6-08	S6a.4	PASS
s6-08	S6a.5	N/A
s6-08	S6a.6	N/A
s6-08	S6a.7	PARTIAL
s6-08	G1	PASS
s6-08	G2	PASS
s6-08	G-lang	ru
s6-09	S6b.1	PASS
s6-09	S6b.2	PASS
s6-09	S6b.3	PASS
s6-09	S6b.4	FAIL
s6-09	G1	PASS
s6-09	G2	PASS
s6-09	G-lang	en
s6-10	S6a.1	PARTIAL
s6-10	S6a.2	PASS
s6-10	S6a.3	FAIL
s6-10	S6a.4	PASS
s6-10	S6a.5	N/A
s6-10	S6a.6	N/A
s6-10	S6a.7	FAIL
s6-10	G1	N/A
s6-10	G2	PASS
s6-10	G-lang	en
s6-11	S6a.1	PARTIAL
s6-11	S6a.2	PARTIAL
s6-11	S6a.3	FAIL
s6-11	S6a.4	PASS
s6-11	S6a.5	N/A
s6-11	S6a.6	FAIL
s6-11	S6a.7	FAIL
s6-11	G1	N/A
s6-11	G2	PASS
s6-11	G-lang	en
s6-12	S6a.1	PASS
s6-12	S6a.2	PASS
s6-12	S6a.3	PASS
s6-12	S6a.4	PASS
s6-12	S6a.5	PASS
s6-12	S6a.6	PASS
s6-12	S6a.7	PARTIAL
s6-12	G1	PASS
s6-12	G2	PASS
s6-12	G-lang	ru
s6-13	S6a.1	PASS
s6-13	S6a.2	PASS
s6-13	S6a.3	PASS
s6-13	S6a.4	PASS
s6-13	S6a.5	N/A
s6-13	S6a.6	N/A
s6-13	S6a.7	PASS
s6-13	G1	PASS
s6-13	G2	PASS
s6-13	G-lang	en
s6-14	S6b.1	PASS
s6-14	S6b.2	PASS
s6-14	S6b.3	PASS
s6-14	S6b.4	PASS
s6-14	G1	PASS
s6-14	G2	PASS
s6-14	G-lang	ru
s6-15	S6a.1	PASS
s6-15	S6a.2	PASS
s6-15	S6a.3	PASS
s6-15	S6a.4	PASS
s6-15	S6a.5	N/A
s6-15	S6a.6	PASS
s6-15	S6a.7	PASS
s6-15	G1	PASS
s6-15	G2	PASS
s6-15	G-lang	en
s6-16	S6b.1	PASS
s6-16	S6b.2	PASS
s6-16	S6b.3	PASS
s6-16	S6b.4	FAIL
s6-16	G1	PASS
s6-16	G2	PASS
s6-16	G-lang	en
s6-17	S6a.1	PASS
s6-17	S6a.2	PASS
s6-17	S6a.3	PASS
s6-17	S6a.4	PASS
s6-17	S6a.5	N/A
s6-17	S6a.6	N/A
s6-17	S6a.7	PARTIAL
s6-17	G1	PASS
s6-17	G2	PASS
s6-17	G-lang	ru
s6-18	S6b.1	PASS
s6-18	S6b.2	PASS
s6-18	S6b.3	PASS
s6-18	S6b.4	FAIL
s6-18	G1	PASS
s6-18	G2	PASS
s6-18	G-lang	en
s6-19	S6a.1	PARTIAL
s6-19	S6a.2	PARTIAL
s6-19	S6a.3	FAIL
s6-19	S6a.4	FAIL
s6-19	S6a.5	N/A
s6-19	S6a.6	N/A
s6-19	S6a.7	FAIL
s6-19	G1	N/A
s6-19	G2	PASS
s6-19	G-lang	en
s6-20	S6b.1	PASS
s6-20	S6b.2	PASS
s6-20	S6b.3	PASS
s6-20	S6b.4	PASS
s6-20	G1	PASS
s6-20	G2	PASS
s6-20	G-lang	ru
s6-21	S6b.1	PASS
s6-21	S6b.2	PASS
s6-21	S6b.3	PASS
s6-21	S6b.4	PASS
s6-21	G1	PASS
s6-21	G2	FAIL
s6-21	G-lang	en
s6-22	S6a.1	PASS
s6-22	S6a.2	PASS
s6-22	S6a.3	PASS
s6-22	S6a.4	PASS
s6-22	S6a.5	PASS
s6-22	S6a.6	PASS
s6-22	S6a.7	PARTIAL
s6-22	G1	PASS
s6-22	G2	PASS
s6-22	G-lang	ru
s6-23	S6a.1	PASS
s6-23	S6a.2	PASS
s6-23	S6a.3	PASS
s6-23	S6a.4	PASS
s6-23	S6a.5	N/A
s6-23	S6a.6	N/A
s6-23	S6a.7	PARTIAL
s6-23	G1	PASS
s6-23	G2	PASS
s6-23	G-lang	ru
s6-24	S6a.1	PARTIAL
s6-24	S6a.2	PARTIAL
s6-24	S6a.3	FAIL
s6-24	S6a.4	FAIL
s6-24	S6a.5	N/A
s6-24	S6a.6	N/A
s6-24	S6a.7	FAIL
s6-24	G1	N/A
s6-24	G2	PASS
s6-24	G-lang	en
s6-25	S6b.1	PASS
s6-25	S6b.2	PASS
s6-25	S6b.3	PASS
s6-25	S6b.4	PASS
s6-25	G1	PASS
s6-25	G2	N/A
s6-25	G-lang	ru
s6-26	S6a.1	PASS
s6-26	S6a.2	PASS
s6-26	S6a.3	PASS
s6-26	S6a.4	PASS
s6-26	S6a.5	N/A
s6-26	S6a.6	N/A
s6-26	S6a.7	PARTIAL
s6-26	G1	PASS
s6-26	G2	PASS
s6-26	G-lang	ru
s6-27	S6a.1	PASS
s6-27	S6a.2	PASS
s6-27	S6a.3	PASS
s6-27	S6a.4	PASS
s6-27	S6a.5	PASS
s6-27	S6a.6	PASS
s6-27	S6a.7	PASS
s6-27	G1	PASS
s6-27	G2	PASS
s6-27	G-lang	ru
s6-28	S6b.1	PASS
s6-28	S6b.2	PASS
s6-28	S6b.3	PASS
s6-28	S6b.4	PASS
s6-28	G1	PASS
s6-28	G2	PASS
s6-28	G-lang	ru
s6-29	S6a.1	PASS
s6-29	S6a.2	PASS
s6-29	S6a.3	PASS
s6-29	S6a.4	PASS
s6-29	S6a.5	N/A
s6-29	S6a.6	N/A
s6-29	S6a.7	PARTIAL
s6-29	G1	PASS
s6-29	G2	PASS
s6-29	G-lang	en
s6-30	S6a.1	FAIL
s6-30	S6a.2	PARTIAL
s6-30	S6a.3	FAIL
s6-30	S6a.4	FAIL
s6-30	S6a.5	FAIL
s6-30	S6a.6	FAIL
s6-30	S6a.7	PARTIAL
s6-30	G1	N/A
s6-30	G2	PASS
s6-30	G-lang	en
END-TSV
