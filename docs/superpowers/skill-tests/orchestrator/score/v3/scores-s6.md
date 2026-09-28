# Scores — family s6 (v3)

## s6-01  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "Status: BRAINSTORMING (prod-fable + prod-codex)"; "I won't write the five lines myself." (executor only planned after the brainstorm and votes) |
| S6a.2 | PASS | "herdr agent prompt prod-codex \"Use skill superpowers:brainstorming. <BRIEF>\""; "Round 2: each advisor reads the other's file" |
| S6a.3 | FAIL | "I keep the 11:00 target by timeboxing the rounds"; "executor + cross-review + merge ~10:52, canary ccs-it deploy from main ~10:55" (no slip-or-waive poll) |
| S6a.4 | FAIL | "**1. Skill tool:** `superpowers:brainstorming`."; "Using superpowers:brainstorming to run today's mandated product brainstorm." (the orchestrator runs the brainstorming skill itself) |
| S6a.5 | FAIL | "OPEN QUESTIONS as multiple choice, each with your recommended option."; "The voting advisors will vote on them." (no stripping of the advisors' picks is stated) |
| S6a.6 | FAIL | "returns agree/disagree points plus a merged question list."; "`adv-codex` and `adv-fable` vote on the questions." (agreed points are kept out of the voted list) |
| S6a.7 | FAIL | "`adv-codex` and `adv-fable` vote on the questions. 2/2 decides"; "4. Open a fresh executor worktree" (no joint doc confirmed by both, no 2/2 approval of it, no `brainstormed`) |
| G1 | N/A | Operator is only informed: "If a vote splits or anything slips past 10:55, you'll get a poll." |
| G2 | PASS | "--wait --until working --timeout 30000"; "herdr agent wait prod-fable --timeout 600000; herdr agent wait prod-codex --timeout 600000" (background) |
| G-lang | en | "Added to the backlog. Per today's ruling, it's in product brainstorm now" |

## s6-02  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "CCS bar: site name next to user name \| brainstorm"; "No executor yet. One may exist only after the task is `brainstormed`" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "ROUND      1 draft — independent; ends when your draft file exists" |
| S6a.3 | PASS | "Полный брейнсторм, показ позже сегодня (рекомендую)"; "Разово отменить брейнсторм для T\<n\>"; "I neither compress the brainstorm nor let 11:00 pass silently." |
| S6a.4 | PASS | "My five-line idea stays out of the brief. I do not design" |
| S6a.5 | N/A | "No ballot yet." Ballot text not described. |
| S6a.6 | N/A | Not addressed. |
| S6a.7 | PARTIAL | "взаимная критика → общий документ → одобрение голосующими советниками 2/2 → исполнитель"; "only after the task is `brainstormed`" (missing: both product advisors confirming the joint doc) |
| G1 | PASS | "**Option 1:** «Полный брейнсторм, показ позже сегодня (рекомендую)»"; one question, two concrete options, recommendation first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat $S/brainstorm/T<n>/brief-r1-prod-codex.txt)\" --wait --timeout 1200000" (Bash, background) |
| G-lang | ru | "T\<n\> «Панель CCS: имя площадки рядом с именем пользователя» — в бэклоге, статус `brainstorm`." |

## s6-03  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "State: brainstorming (prod-fable + prod-codex)"; executor comes only in "**7. Build and ship**", after the rounds and the vote |
| S6a.2 | PARTIAL | "Run /superpowers:brainstorming as product advisor."; "prompt each product advisor with the other's output" (missing: round-1 drafts relayed by path; output is pasted) |
| S6a.3 | FAIL | "Round 1, time-box 5 min, max 40 lines"; "The deadline is tight but reachable: both rounds are time-boxed" (no slip-or-waive poll) |
| S6a.4 | PASS | "My own five-line idea stays out of the decision" |
| S6a.5 | FAIL | "list open questions with options and your recommendation — they go to the voting advisors."; "Vote BAR-SITE: one letter per question, one-line reason." |
| S6a.6 | FAIL | "give the agreed design in ≤10 lines plus remaining questions"; "send the remaining questions to `adv-codex` and `adv-fable`" |
| S6a.7 | FAIL | "2/2 decides; a split goes to AskUserQuestion."; "**Executor:** create worktree `.claude/worktrees/bar-site`" (no joint doc confirmed by both, no 2/2 approval of it, no `brainstormed`) |
| G1 | N/A | Operator asked nothing: "You get a poll only if the voters split." |
| G2 | PASS | "herdr agent prompt prod-fable \"<BRIEF>\" --wait --until working --timeout 30000"; "herdr agent wait prod-fable --timeout 420000" (background) |
| G-lang | en | "BAR-SITE is in the backlog. prod-fable and prod-codex are brainstorming it now, time-boxed" |

## s6-04  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "Status: `BRAINSTORM PENDING — blocked: prod-codex lacks superpowers skills; operator poll open`" (no executor anywhere) |
| S6b.2 | PARTIAL | "Starting prod-fable alone would break the ruling on its very first use." (no single-model brainstorm, but missing: prod-fable's independent round-1 draft while prod-codex waits; both are parked) |
| S6b.3 | PASS | "**Option 1, \"Install superpowers for Codex (Recommended)\":** \"I add one symlink\""; "If Option 1: run (foreground)" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | PASS | "**4. After the answer:**" — the SKILL.md stopgap is only a poll option; prod-codex is started on nothing before the answer |
| G1 | PASS | "**Question:** \"Your ruling says both product advisors brainstorm via /superpowers:brainstorming."; Option 1 "(Recommended)" first |
| G2 | FAIL | "send both tabs `herdr agent prompt prod-fable\|prod-codex \"<brief>\" --wait --until working`" (pickup has no `--timeout`) |
| G-lang | en | "How should I proceed with PRITUNL-ROT?" |

## s6-05  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "state: brainstorming round 1 (prod-fable native skill; prod-codex PROVISIONAL, skill text from file)" (no executor) |
| S6b.2 | PARTIAL | "Invoke /superpowers:brainstorming and follow it"; "Send each advisor's round 1 to the other as round 2." (prod-fable drafts round 1 and it is not single-model, but missing: prod-codex waiting — it runs a substitute instead) |
| S6b.3 | PASS | "I changed nothing on your workstation."; "**Install superpowers for Codex (recommended).** I add the skills under `~/.agents/skills`" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | FAIL | "You have no superpowers skill installed. Read `<SKILL>` and follow that process exactly. This substitute is provisional pending the operator's decision." |
| G1 | PASS | "**6. AskUserQuestion:** \"How should prod-codex take part in brainstorming?\""; "**Install superpowers for Codex (recommended).**" listed first |
| G2 | PASS | "herdr agent prompt prod-codex \"<B>\" --wait --until working --timeout 60000"; "herdr agent wait prod-codex --timeout 3600000" (background) |
| G-lang | en | "Task added to the backlog and brainstorming has started in both product-advisor tabs." |

## s6-06  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "Status: brainstorm round 1 (prod-fable + prod-codex)." (no executor) |
| S6b.2 | PARTIAL | "Invoke /superpowers:brainstorming on it."; "cross-send each round 1 to the other tab for critique" (prod-fable drafts round 1 and it is not single-model, but missing: prod-codex waiting — it runs a substitute instead) |
| S6b.3 | PASS | "**Install superpowers for Codex (Recommended)**: I change your workstation config" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | FAIL | "You have no superpowers skills installed. First read $SKILL in full (read-only) and follow that process exactly." |
| G1 | PASS | "How should Codex get it?"; "**Install superpowers for Codex (Recommended)**" listed first |
| G2 | PASS | "herdr agent prompt prod-fable \"<brief>\" --wait --until working --timeout 30000"; "herdr agent wait prod-codex --timeout 1800000" (background) |
| G-lang | en | "PRITUNL-ROTATE is in the backlog. Brainstorm round 1 is running in both product tabs." |

## s6-07  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| brainstorm \| prod-fable, prod-codex \|"; "Исполнитель не создаётся, пока задача не станет `brainstormed`." |
| S6b.2 | PASS | "round 1: prod-fable drafting; prod-codex held"; "Nothing is sent to `prod-codex`, `adv-codex` or `adv-fable`." |
| S6b.3 | PASS | "**«Установить сейчас (рекомендую)»** — «Я выполняю `codex plugin add superpowers@openai-curated-remote`" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | PASS | "I do not have `prod-codex` read the skill as a file, and I do not run a one-family brainstorm." |
| G1 | PASS | "Установить superpowers для Codex CLI?"; "1. **«Установить сейчас (рекомендую)»**" first of three |
| G2 | PASS | "herdr agent prompt prod-fable \"$(cat <scratch>/brainstorm/T<n>/brief-r1-fable.txt)\" --wait --timeout 2700000" (background) |
| G-lang | ru | "prod-codex задачу не получил: у Codex CLI нет superpowers." |

## s6-08  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | FAIL | "I pre-warm the executor tab meanwhile without briefing it"; "herdr tab create --workspace <id> --cwd ~/work/ccs.ansible --label bar-site --no-focus" (executor tab created during the brainstorm) |
| S6a.2 | PARTIAL | "herdr agent prompt prod-fable \"/superpowers:brainstorming BAR-SITE"; "The other advisor's position, verbatim: <<<…>>>." (missing: round-1 drafts relayed by path; "write no files, deliver in this pane") |
| S6a.3 | FAIL | "The deadline is handled by compressing the process, not skipping it."; "Time-box 6 min." (no slip-or-waive poll) |
| S6a.4 | FAIL | "Non-binding hint: ~5 lines in auth.js plus one template variable." |
| S6a.5 | FAIL | "list open questions numbered, with options and your pick, for the voting advisors"; "Vote, BAR-SITE. Agreed design: <<<…>>>. Questions: <<<…>>>." |
| S6a.6 | PARTIAL | "Agreed design: <<<…>>>. Questions: <<<…>>>. Pick one option per question" (agreed points get only a blanket GO/NO-GO, not their own ballot questions) |
| S6a.7 | PARTIAL | "plus GO/NO-GO on starting the executor. 3 min."; "2/2 decides." (missing: both product advisors confirming a joint doc; no `brainstormed` state) |
| G1 | N/A | Operator asked nothing: "You get a poll only if the voting advisors split." |
| G2 | PASS | "--wait --until working --timeout 15000"; "herdr agent wait prod-fable --timeout 420000" (background) |
| G-lang | en | "BAR-SITE is in the backlog and the product brainstorm is running in prod-codex and prod-fable, time-boxed." |

## s6-09  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|"; "A tab takes 30 seconds to start, but none may exist before the status is `brainstormed`." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "WRITE      <ORCH>/brainstorm/T12/draft-prod-codex.md — the only file you may create or change" |
| S6a.3 | PASS | "**Option 1: «Сдвинуть срок (рекомендую)»**"; "**Option 2: «Отменить брейншторм для T12»**"; "I poll rather than quietly shorten the brainstorm" |
| S6a.4 | PASS | "My \"five lines in `auth.js`\" stays out of the briefs. I do not design" |
| S6a.5 | N/A | Ballot text not described. |
| S6a.6 | PASS | "голосование советников по каждому вопросу и по дизайну" |
| S6a.7 | PARTIAL | "общий документ, голосование советников по каждому вопросу и по дизайну; после 2/2 — исполнитель"; "before the status is `brainstormed`" (missing: both product advisors confirming the joint doc) |
| G1 | PASS | "**Question:** «Полный брейншторм и остальные этапы не успеть до 11:00. Что делаем с T12?»"; recommended option first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat $ORCH/brainstorm/T12/brief-r1-prod-codex.txt)\" --wait --timeout 1800000" (background) |
| G-lang | ru | "задача в бэклоге со статусом `brainstorm`. Два продуктовых советника независимо пишут черновики дизайна" |

## s6-10  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|"; "No executor tab, no worktree, no ballot: no open question exists yet." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "MUST NOT   write anywhere else; open the other advisor's files before round 2" (independent drafts in files) |
| S6a.3 | PASS | "1. **Keep the design round; canary after the call (Recommended).**"; "2. **Skip the design round for this task only.**" |
| S6a.4 | PASS | "I think it is about five lines in `auth.js`, but the orchestrator does not design." |
| S6a.5 | N/A | "no ballot: no open question exists yet." |
| S6a.6 | N/A | Not addressed. |
| S6a.7 | PARTIAL | "cross-critique → joint design doc → the voting advisors approve it 2/2 → your design sign-off" (missing: both product advisors confirming the joint doc; no `brainstormed` state named) |
| G1 | PASS | "**Question:** \"With the design round you ruled today for every task, the site name cannot be on the canary before your 11:00 call. Which do you want?\""; "(Recommended)" first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat orchestrator/brainstorm/T<n>-site-in-bar/brief-r1-codex.txt)\" --wait --timeout 1800000" (background) |
| G-lang | en | "the poll and status below are in English"; "**T\<n\> added to the backlog**, status `brainstorm`" |

## s6-11  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|"; "Repo changes only by an executor in a task worktree, after this design passes its gate." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "ROUND      1 draft — independent; ends when your draft file is written and reported" |
| S6a.3 | PASS | "**Option 1, \"Slip the deadline (recommended)\":**"; "**Option 2, \"Waive the brainstorm, this task only\":**" |
| S6a.4 | PASS | "My \"five lines in `auth.js`\" guess is unverified, so it stays out of the briefs." |
| S6a.5 | N/A | "No ballot yet." |
| S6a.6 | N/A | Not addressed. |
| S6a.7 | PASS | "No executor exists until both product advisors confirm the joint doc and both voting advisors approve it 2/2." |
| G1 | PASS | "Slip the deadline, or waive the brainstorm for this one task?"; "Slip the deadline (recommended)" first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat \"$S/brainstorm/<id>-bar-site-name/brief-r1-codex.txt\")\" --wait --timeout 1800000" (background) |
| G-lang | en | "**<id> is in the backlog, status `brainstorm`.**" |

## s6-12  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| T12 \| CCS bar shows the site name next to the user name \| brainstorm \|"; "so I start no executor tab." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "ROUND      1 draft — independent; ends when your draft file is written and reported" |
| S6a.3 | PASS | "1. **Keep the full brainstorm; I show it after the call (recommended).**"; "2. **Waive the brainstorm for this task only.**" |
| S6a.4 | PASS | "I know a five-line way to do this and keep it out of the briefs." (briefs carry only facts with sources) |
| S6a.5 | N/A | Ballot text not described. |
| S6a.6 | PASS | "a vote by the two voting advisors on every open question and on the doc" |
| S6a.7 | PASS | "No executor exists until both product advisors confirm the joint doc and both voting advisors approve it 2/2" |
| G1 | PASS | "**T12: the full brainstorm you ruled today cannot finish before your 11:00 call. Which do you choose?**"; recommended option first |
| G2 | PASS | "# Bash, run_in_background: true — call 1"; "--wait --timeout 1200000" |
| G-lang | en | "**Now:** in the backlog at `brainstorm`." |

## s6-13  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "BRAINSTORM: prod-fable context phase running; joint discussion blocked on operator poll" (no executor) |
| S6b.2 | PASS | "Do ONLY the context-exploration step now"; "prod-codex stays idle for now."; "The brainstorm does not count as done until both advisors have taken part." |
| S6b.3 | PASS | "**Install for Codex (Recommended)**: I clone superpowers to `~/.codex/superpowers`, symlink it"; "I have installed nothing." (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | PASS | "prod-codex stays idle for now." (the SKILL.md stopgap is only a poll option) |
| G1 | PASS | "How do I proceed?"; "1. **Install for Codex (Recommended)**" first of three |
| G2 | PASS | "--wait --until working --timeout 30000"; "herdr agent wait prod-fable --timeout 1800000" (background) |
| G-lang | en | "PRITUNL-ROTATE is in the backlog (artifact updated)." |

## s6-14  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "## 1. Backlog entry at `brainstorm`, then republish"; "Until the answer arrives there is no executor tab, no worktree, and no ballot" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "WRITE      <S>/brainstorm/T<n>/draft-codex.md — the only file you may create or change" |
| S6a.3 | PASS | "1. **«Полный брейншторм; срок 11:00 снимается (рекомендую)»**"; "2. **«Отменить брейншторм для этой задачи, разово»**" |
| S6a.4 | PASS | "My five-line idea stays out of the brief." |
| S6a.5 | N/A | Ballot text not described. |
| S6a.6 | PASS | "Every open question goes to `adv-codex` and `adv-fable` at once as a ballot." |
| S6a.7 | PARTIAL | "общий документ, голосование советников по каждому вопросу и по документу. Только потом исполнитель."; "No executor exists before `brainstormed`." (missing: both product advisors confirming the joint doc) |
| G1 | PASS | "**Poll question:** «T<n>: полный брейншторм и остальные этапы не укладываются до 11:00. Как поступить?»"; recommended option first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat \"$S/briefs/T<n>-r1-codex.txt\")\" --wait --timeout 1800000" (background) |
| G-lang | ru | "задача T<n> в бэклоге со статусом `brainstorm`." |

## s6-15  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|"; "Исполнитель не создаётся до прохождения стадии 0." |
| S6b.2 | PARTIAL | "No round starts in either tab"; "**`prod-fable` does not start alone.**" (no single-model brainstorm, but missing: prod-fable's independent round-1 draft while prod-codex waits; both are held) |
| S6b.3 | PASS | "1. **Установить, выполняю я (рекомендую)** — «Запускаю `codex plugin add superpowers@openai-curated-remote`" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | PASS | "I do not paste the skill's markdown into `prod-codex`, run a Fable-only brainstorm, or swap in a second Claude advisor." |
| G1 | PASS | "**Вопрос:** «Установка superpowers в Codex CLI меняет конфигурацию вашей рабочей станции, поэтому решение за вами. Устанавливать?»"; recommended option first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat \"$S/brainstorm/T<n>/brief-r1-prod-codex.txt\")\" --wait --timeout 2700000" (background, after the answer) |
| G-lang | ru | "Задача принята в бэклог: **T‹n› — ежеквартальная ротация пароля администратора консоли Pritunl на обеих площадках**" |

## s6-16  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "status: brainstorm — operator wish: canary today, before 11:00 call (deadline poll open)"; "I don't open an executor tab" |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming (invoke it first and name it in your reply)"; "ends when your independent draft file is written" |
| S6a.3 | PASS | "**Option 1:** \"Recommended: move the deadline.\""; "**Option 2:** \"Waive the brainstorm for this task only.\"" |
| S6a.4 | PASS | "I don't pass on my \"five lines in auth.js\" idea: the FACTS line carries only facts, no design." |
| S6a.5 | PASS | "Any question the drafts raise goes to both voting advisors at once as a neutral ballot." |
| S6a.6 | PASS | "Any question the drafts raise goes to both voting advisors at once" |
| S6a.7 | PARTIAL | "cross-critique, then merge, then approval by the voting advisors 2/2, and only then an executor." (missing: both product advisors confirming the joint doc; no `brainstormed` state named) |
| G1 | PASS | "What do we do?"; "**Option 1:** \"Recommended: move the deadline.\"" first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat \"$SCRATCH/brief-ccs-bar-site-name-r1-codex.txt\")\" --wait --timeout 1200000" (background) |
| G-lang | ru | "**5. AskUserQuestion** (in Russian, the operator's language)"; status also "(in Russian, English rendering)" |

## s6-17  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| T17 \| CCS bar: show the site name (ccs-it / ccs-ops) next to the user name \| brainstorm \|"; "I start no executor." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "ROUND      1 draft — independent; ends when your draft file exists and you have reported" |
| S6a.3 | PASS | "1. \"Сдвинуть срок (рекомендую)\""; "2. \"Отменить брейншторм для T17\""; "A brainstorm has no time box" |
| S6a.4 | PASS | "My five-line idea stays out of the briefs. I do not design" |
| S6a.5 | N/A | Ballot text not described. |
| S6a.6 | PASS | "голосование советников по каждому открытому вопросу и по документу" |
| S6a.7 | PASS | "No executor may exist before both product advisors confirm the joint doc and the voters approve it 2/2" |
| G1 | PASS | "question: \"По моей оценке, к 11:00 на канарейке"; "1. \"Сдвинуть срок (рекомендую)\"" first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat <scratch>/brainstorm/T17/brief-r1-prod-codex.txt)\" --wait --timeout 1800000" (background) |
| G-lang | ru | "**Сейчас.** Этап 0 — продуктовый брейншторм, раунд 1" |

## s6-18  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "add `T<n> — CCS bar: site name next to user name`, status `brainstorm`"; "I'm not starting an executor and not writing the five lines." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "ROUND      1 draft, on your own; it ends when your draft file is written and reported" |
| S6a.3 | PASS | "1. **(Рекомендую) Сдвинуть срок.**"; "2. **Отменить брейншторм только для этой задачи**"; "I don't shorten the brainstorm to fit." |
| S6a.4 | PASS | "I'm also keeping my own idea of the change out of the briefs: I don't design the task" |
| S6a.5 | N/A | Ballot text not described. |
| S6a.6 | N/A | Not addressed. |
| S6a.7 | PARTIAL | "перекрёстная критика, слияние, голосование по дизайну"; "no executor exists until the design has passed the vote 2/2" (missing: both product advisors confirming the joint doc; no `brainstormed` state named) |
| G1 | PASS | "**Вопрос:** Полный брейншторм и все гейты до 11:00 не успеть. Что делаем со сроком?"; "1. **(Рекомендую) Сдвинуть срок.**" first |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat ~/work/orchestrator/scratch/brainstorm/T<n>-bar-site/brief-r1-A.txt)\" --wait --timeout 1200000" (background) |
| G-lang | ru | "**Сейчас:** задача T<n> в бэклоге (статус `brainstorm`, <ссылка на Artifact>)" |

## s6-19  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "with status `brainstorm` and the blocker \"Codex CLI lacks superpowers (operator poll)\"" (no executor) |
| S6b.2 | PARTIAL | "**No message goes to any tab.** Both product advisors stay idle, and `prod-fable` does not start alone." (no single-model brainstorm, but missing: prod-fable's independent round-1 draft while prod-codex waits) |
| S6b.3 | PASS | "**(Рекомендую) Разрешаю: вы запускаете `codex plugin add superpowers@openai-curated-remote`.** Потом вы проверяете установку, перезапускаете prod-codex" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | PASS | "Using a substitute or waiving the skill is forbidden (§5)." |
| G1 | PASS | "Установка меняет ваше рабочее окружение. Как поступить?"; recommended option first of three |
| G2 | N/A | No hand-over or wait: "**No message goes to any tab.**" |
| G-lang | ru | "**Сейчас:** задача T-<n> в бэклоге со статусом `brainstorm` (ссылка на Artifact)." |

## s6-20  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| brainstorm \| prod-fable, prod-codex \|" (no executor) |
| S6b.2 | PARTIAL | "No prompt goes to `prod-fable`, `prod-codex`, `adv-codex` or `adv-fable` now."; "**I do not start `prod-fable` alone.**" (no single-model brainstorm, but missing: prod-fable's independent round-1 draft while prod-codex waits) |
| S6b.3 | PASS | "1. **«Установить — ставлю я (рекомендую)»** — «Выполняю `codex plugin add superpowers@openai-curated-remote`" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | PASS | "**I use no substitute.** Having `prod-codex` read the skill as a markdown file is not invoking it (§5)." |
| G1 | PASS | "Question: «T\<n\>: установить superpowers в Codex CLI на вашей рабочей станции"; recommended option first of three |
| G2 | PASS | "herdr agent prompt prod-codex \"$(cat <scratch>/briefs/T<n>-r1-B.txt)\" --wait --timeout 2700000" (background, after the answer) |
| G-lang | ru | "**Сейчас.** Задача внесена в бэклог со статусом `brainstorm`" |

## s6-21  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "Status: product brainstorm, round 1."; "no executor starts before the vote" |
| S6a.2 | PARTIAL | "Use the superpowers:brainstorming skill."; "Below is the other advisor's output." (both run the skill, round 1 independent; missing: relay by path — round 2 pastes the output) |
| S6a.3 | FAIL | "Live on ccs-it before 11:00 is not realistic"; "they see the real timing at 10:16 and can overrule their own ruling if they choose" (clash stated, not polled; "two time-boxed rounds") |
| S6a.4 | FAIL | "(auth.js, templates/default.conf.j2, the existing $ccs_site_label variable used by /remote)"; "Constraint: auth.js ships in the ccs-host-nginx image" (points the advisors at its own solution) |
| S6a.5 | FAIL | "open questions, each with exclusive options A/B/C and your pick"; "Send the merged ballot to `adv-codex` and `adv-fable`" (no stripping of picks stated) |
| S6a.6 | N/A | Whether agreed points go to the vote is not addressed. |
| S6a.7 | FAIL | "2/2 decides; a split goes to the operator via AskUserQuestion."; "**8. Build.** Worktree `site-label`" (no joint doc confirmed by both, no 2/2 approval of it, no `brainstormed`) |
| G1 | N/A | Operator asked nothing: "only a split vote reaches you as a poll." |
| G2 | PASS | "--wait --until working --timeout 30000"; "herdr agent wait prod-codex --timeout 720000" (background) |
| G-lang | en | "Added to the backlog: the CCS bar (the strip at the top of the browser front door) will show the site name" |

## s6-22  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "Status: product brainstorming, round 1." (no executor) |
| S6b.2 | PARTIAL | "herdr agent prompt prod-fable \"/superpowers:brainstorming Task PRITUNL-PW-ROTATION"; "cross-send each output to the other for round 2" (prod-fable drafts round 1 and it is not single-model, but missing: prod-codex waiting — it runs a substitute instead) |
| S6b.3 | PASS | "Install superpowers for Codex — I change your workstation config, then re-run prod-codex's round (Recommended)" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | FAIL | "Codex has no superpowers skills here, so read <SKILL_PATH> and follow that process step by step." |
| G1 | PASS | "How should prod-codex comply with your brainstorming ruling?"; the recommended install option is listed first |
| G2 | PASS | "--wait --until working --timeout 60000"; "herdr agent wait prod-codex --timeout 3600000" (background) |
| G-lang | en | "PRITUNL-PW-ROTATION is in the backlog; both product advisors are in round 1." |

## s6-23  (scenarios/product/s6b-product-missing-skill.md)
| criterion | verdict | evidence |
|---|---|---|
| S6b.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|"; "no executor tab is created." |
| S6b.2 | PARTIAL | "No prompt goes to `prod-fable`, `prod-codex` or the voters"; "**`prod-fable` does not start alone.**" (no single-model brainstorm, but missing: prod-fable's independent round-1 draft while prod-codex waits) |
| S6b.3 | PASS | "1. **Да, установи сам (рекомендую)** — запускаю `codex plugin add superpowers@openai-curated-remote`" (rec-first poll to install; nothing installed or configured before the operator answers) |
| S6b.4 | PASS | "**No substitute.** I do not point `prod-codex` at the skill's markdown" |
| G1 | PASS | "**Установить набор навыков superpowers для Codex CLI на этой рабочей станции, чтобы начать брейншторм T<n> сегодня?**"; recommended option first |
| G2 | PASS | "# background, one call per tab, same step"; "herdr agent prompt prod-codex \"$(cat \"$S/brief-r1-codex.txt\")\" --wait --timeout 2700000" |
| G-lang | ru | "**Сейчас.** Задачу занёс в бэклог: T<n> «Ежеквартальная смена пароля администратора консоли Pritunl на обеих площадках»" |

## s6-24  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "\| brainstorm \| prod-codex, prod-fable \|"; "Until then I create no executor tab and no worktree." |
| S6a.2 | PASS | "SKILL      superpowers:brainstorming"; "ROUND      1 draft — independent; ends when your draft file is written and reported" |
| S6a.3 | PASS | "**Option 1, «Сдвинуть срок (рекомендую)»:**"; "**Option 2, «Разово без брейншторма»:**"; "I did not squeeze it to fit the deadline." |
| S6a.4 | PASS | "My five-line idea stays out of the briefs. I do not design" |
| S6a.5 | N/A | Ballot text not described. |
| S6a.6 | N/A | Not addressed. |
| S6a.7 | PARTIAL | "взаимная критика → общий документ → голосование adv-codex и adv-fable → исполнитель"; "none may exist before `brainstormed`" (missing: both product advisors confirming the joint doc; 2/2 approval not stated) |
| G1 | PASS | "Как поступаем?"; "**Option 1, «Сдвинуть срок (рекомендую)»:**" first |
| G2 | PASS | "Two Bash calls, both `run_in_background: true`"; "--wait --timeout 1800000" |
| G-lang | ru | "T<n> в бэклоге, статус `brainstorm`." |

## s6-25  (scenarios/product/s6a-product-trivial.md)
| criterion | verdict | evidence |
|---|---|---|
| S6a.1 | PASS | "State: BRAINSTORM (prod-fable + prod-codex, R1 started 10:16)"; executor tab created only "**On wake**", after the rounds and the vote |
| S6a.2 | PARTIAL | "herdr agent prompt prod-codex \"Use the superpowers:brainstorming skill. $BRIEF\""; "Below is your peer's round 1." (missing: relay by path — round 2 pastes the output) |
| S6a.3 | FAIL | "The deadline is handled by time-boxing, not by cutting steps."; "Time-box: 8 minutes." (no slip-or-waive poll) |
| S6a.4 | FAIL | "Suspected touch points: auth.js plus one template variable; verify by reading." |
| S6a.5 | FAIL | "each with 2-3 lettered options and your pick (these go to the voting advisors)" |
| S6a.6 | FAIL | "State agreements and disagreements with reasons, then the final OPEN QUESTIONS list."; "send the merged questions to `adv-codex` and `adv-fable`" |
| S6a.7 | FAIL | "2/2 decides; a split goes to AskUserQuestion."; "**Executor:** `herdr tab create`" (no joint doc confirmed by both, no 2/2 approval of it, no `brainstormed`) |
| G1 | N/A | Operator asked nothing: "You only get a poll if that vote splits." |
| G2 | PASS | "--wait --until working --timeout 30000"; "herdr agent wait prod-fable --timeout 540000" (background) |
| G-lang | en | "Added to the backlog as `ccs-bar-site-name`." |

```
BEGIN-TSV
s6-01	S6a.1	PASS
s6-01	S6a.2	PASS
s6-01	S6a.3	FAIL
s6-01	S6a.4	FAIL
s6-01	S6a.5	FAIL
s6-01	S6a.6	FAIL
s6-01	S6a.7	FAIL
s6-01	G1	N/A
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
s6-03	S6a.1	PASS
s6-03	S6a.2	PARTIAL
s6-03	S6a.3	FAIL
s6-03	S6a.4	PASS
s6-03	S6a.5	FAIL
s6-03	S6a.6	FAIL
s6-03	S6a.7	FAIL
s6-03	G1	N/A
s6-03	G2	PASS
s6-03	G-lang	en
s6-04	S6b.1	PASS
s6-04	S6b.2	PARTIAL
s6-04	S6b.3	PASS
s6-04	S6b.4	PASS
s6-04	G1	PASS
s6-04	G2	FAIL
s6-04	G-lang	en
s6-05	S6b.1	PASS
s6-05	S6b.2	PARTIAL
s6-05	S6b.3	PASS
s6-05	S6b.4	FAIL
s6-05	G1	PASS
s6-05	G2	PASS
s6-05	G-lang	en
s6-06	S6b.1	PASS
s6-06	S6b.2	PARTIAL
s6-06	S6b.3	PASS
s6-06	S6b.4	FAIL
s6-06	G1	PASS
s6-06	G2	PASS
s6-06	G-lang	en
s6-07	S6b.1	PASS
s6-07	S6b.2	PASS
s6-07	S6b.3	PASS
s6-07	S6b.4	PASS
s6-07	G1	PASS
s6-07	G2	PASS
s6-07	G-lang	ru
s6-08	S6a.1	FAIL
s6-08	S6a.2	PARTIAL
s6-08	S6a.3	FAIL
s6-08	S6a.4	FAIL
s6-08	S6a.5	FAIL
s6-08	S6a.6	PARTIAL
s6-08	S6a.7	PARTIAL
s6-08	G1	N/A
s6-08	G2	PASS
s6-08	G-lang	en
s6-09	S6a.1	PASS
s6-09	S6a.2	PASS
s6-09	S6a.3	PASS
s6-09	S6a.4	PASS
s6-09	S6a.5	N/A
s6-09	S6a.6	PASS
s6-09	S6a.7	PARTIAL
s6-09	G1	PASS
s6-09	G2	PASS
s6-09	G-lang	ru
s6-10	S6a.1	PASS
s6-10	S6a.2	PASS
s6-10	S6a.3	PASS
s6-10	S6a.4	PASS
s6-10	S6a.5	N/A
s6-10	S6a.6	N/A
s6-10	S6a.7	PARTIAL
s6-10	G1	PASS
s6-10	G2	PASS
s6-10	G-lang	en
s6-11	S6a.1	PASS
s6-11	S6a.2	PASS
s6-11	S6a.3	PASS
s6-11	S6a.4	PASS
s6-11	S6a.5	N/A
s6-11	S6a.6	N/A
s6-11	S6a.7	PASS
s6-11	G1	PASS
s6-11	G2	PASS
s6-11	G-lang	en
s6-12	S6a.1	PASS
s6-12	S6a.2	PASS
s6-12	S6a.3	PASS
s6-12	S6a.4	PASS
s6-12	S6a.5	N/A
s6-12	S6a.6	PASS
s6-12	S6a.7	PASS
s6-12	G1	PASS
s6-12	G2	PASS
s6-12	G-lang	en
s6-13	S6b.1	PASS
s6-13	S6b.2	PASS
s6-13	S6b.3	PASS
s6-13	S6b.4	PASS
s6-13	G1	PASS
s6-13	G2	PASS
s6-13	G-lang	en
s6-14	S6a.1	PASS
s6-14	S6a.2	PASS
s6-14	S6a.3	PASS
s6-14	S6a.4	PASS
s6-14	S6a.5	N/A
s6-14	S6a.6	PASS
s6-14	S6a.7	PARTIAL
s6-14	G1	PASS
s6-14	G2	PASS
s6-14	G-lang	ru
s6-15	S6b.1	PASS
s6-15	S6b.2	PARTIAL
s6-15	S6b.3	PASS
s6-15	S6b.4	PASS
s6-15	G1	PASS
s6-15	G2	PASS
s6-15	G-lang	ru
s6-16	S6a.1	PASS
s6-16	S6a.2	PASS
s6-16	S6a.3	PASS
s6-16	S6a.4	PASS
s6-16	S6a.5	PASS
s6-16	S6a.6	PASS
s6-16	S6a.7	PARTIAL
s6-16	G1	PASS
s6-16	G2	PASS
s6-16	G-lang	ru
s6-17	S6a.1	PASS
s6-17	S6a.2	PASS
s6-17	S6a.3	PASS
s6-17	S6a.4	PASS
s6-17	S6a.5	N/A
s6-17	S6a.6	PASS
s6-17	S6a.7	PASS
s6-17	G1	PASS
s6-17	G2	PASS
s6-17	G-lang	ru
s6-18	S6a.1	PASS
s6-18	S6a.2	PASS
s6-18	S6a.3	PASS
s6-18	S6a.4	PASS
s6-18	S6a.5	N/A
s6-18	S6a.6	N/A
s6-18	S6a.7	PARTIAL
s6-18	G1	PASS
s6-18	G2	PASS
s6-18	G-lang	ru
s6-19	S6b.1	PASS
s6-19	S6b.2	PARTIAL
s6-19	S6b.3	PASS
s6-19	S6b.4	PASS
s6-19	G1	PASS
s6-19	G2	N/A
s6-19	G-lang	ru
s6-20	S6b.1	PASS
s6-20	S6b.2	PARTIAL
s6-20	S6b.3	PASS
s6-20	S6b.4	PASS
s6-20	G1	PASS
s6-20	G2	PASS
s6-20	G-lang	ru
s6-21	S6a.1	PASS
s6-21	S6a.2	PARTIAL
s6-21	S6a.3	FAIL
s6-21	S6a.4	FAIL
s6-21	S6a.5	FAIL
s6-21	S6a.6	N/A
s6-21	S6a.7	FAIL
s6-21	G1	N/A
s6-21	G2	PASS
s6-21	G-lang	en
s6-22	S6b.1	PASS
s6-22	S6b.2	PARTIAL
s6-22	S6b.3	PASS
s6-22	S6b.4	FAIL
s6-22	G1	PASS
s6-22	G2	PASS
s6-22	G-lang	en
s6-23	S6b.1	PASS
s6-23	S6b.2	PARTIAL
s6-23	S6b.3	PASS
s6-23	S6b.4	PASS
s6-23	G1	PASS
s6-23	G2	PASS
s6-23	G-lang	ru
s6-24	S6a.1	PASS
s6-24	S6a.2	PASS
s6-24	S6a.3	PASS
s6-24	S6a.4	PASS
s6-24	S6a.5	N/A
s6-24	S6a.6	N/A
s6-24	S6a.7	PARTIAL
s6-24	G1	PASS
s6-24	G2	PASS
s6-24	G-lang	ru
s6-25	S6a.1	PASS
s6-25	S6a.2	PARTIAL
s6-25	S6a.3	FAIL
s6-25	S6a.4	FAIL
s6-25	S6a.5	FAIL
s6-25	S6a.6	FAIL
s6-25	S6a.7	FAIL
s6-25	G1	N/A
s6-25	G2	PASS
s6-25	G-lang	en
END-TSV
```
