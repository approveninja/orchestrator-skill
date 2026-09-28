# Derivation audit of SKILL.md v1 against manifest rev 3.1 (e56bb79)

An independent reviewer (Opus, fresh session, read-only) checked every normative statement
in SKILL.md v1 against the manifest. The findings are condensed below; each has a
disposition for v2.

The reviewer confirmed that `references/` is the current cut: its header blob `0861140…`
matches the manifest.

| # | Finding | v2 disposition |
|---|---|---|
| U1 | "Violating the letter of these rules is violating their spirit." has no manifest source | Removed |
| S1 | "report nothing you have not verified" is stronger than §12 ("say what was verified, how, and what was not") | Reworded to §11/§12 |
| S2 | "before your first dispatch" is weaker than §16 "before anything else" | Reworded |
| S3 | "the canary go" dropped §8 stage 11's exception: the operator decides it when that rollout is the task's release | Exception added |
| S4 | The list of voted decisions left out "vault" and "an exception to a plan" | Added |
| S5 | "every choice between alternatives" left out §10's "that changes the outcome" | Qualifier added |
| S6 | The list of questions for the operator left out "a question that would revise an operator ruling" and "where a project hard rule reserves the action" | Added |
| S7 | "read-only inspection" left out "the orchestrator's alone, announced in the next status"; "PRs" should say "opening PRs" | Fixed |
| S8 | Stage-0 gate left out "every blocking question has a recorded ballot result or operator ruling" and the caveat that a project hard rule reserving design sign-off still binds | Added |
| S9 | "every task the operator adds" should be "every task added to the backlog". The working test had become a definition: it lost the borderline-case ballot and the "same task" cases | Fixed |
| S10 | "advisor's or executor's CLI" should be "executor's or product advisor's". The red-flag row dropped "or give it to an agent that has them" | Fixed |
| S11 | "Deploy only from merged main" dropped the emergency clause | Added |
| S12 | Cleanup dropped "never force-remove a worktree with uncommitted work" | Added |
| S13 | The screen/HEAD red flag pointed at the queued stop message in general. §4 allows it only when compaction is due | Reworded |
| C1 | The operator's-words rows treat operator words as never enough. §10 lets the operator decide any ballot directly, recorded verbatim with its date, and §15 changes a rule on one sentence. The rows were right only for an inferred wish | Explicit-ruling branch added. The manifest gap on conflicting instructions is ballot proposal B5 |
| W1-W3 | Citations: the "verified" rule is §11/§12, not §1; the evidence rule also needs §5; the snapshot row also needs §2 | Fixed |
| — | The page's own "## 1.–5." headings collide with manifest §1–§5 | Recipes renamed A–E |
| O1-O5 | Hot-path omissions: see the list below | Short pointers added |

The five omissions:

- **O1** — the §8 deploy sequence: a dry run where the tool has one, then the real run, a
  read-only check, and a re-run with zero changes; enablement persisted in versioned
  configuration; merge dark, then arm the canary in a separate change.
- **O2** — a later commit voids the review and the checks (§8).
- **O3** — a PR that changes what agents may do counts as a final PR (§8, §10).
- **O4** — the status: what was verified and what was not; what changed on live machines;
  an Artifact before a poll (§12).
- **O5** — the hand-over guards: a stalled prompt or a timeout means read before re-sending;
  never send to a focused tab (§2, §3).
