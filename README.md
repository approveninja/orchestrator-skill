# orchestrator-skill

A Claude Code skill, and the manifest it is built from, for running several AI agents
(Claude Code, Codex, ...) from one orchestrator session. The agents live in
herdr tabs. The orchestrator sequences their work, supervises it,
verifies the results and puts every decision to a vote or a ballot. It does not implement
anything itself.

This is a **private** repository. The manifest's operator profile (section 15) and the
test campaign contain host names and logins of the operator's projects.

## Layout

| Path | What it is |
|---|---|
| `docs/orchestrator-manifest.md` | The orchestrator manifest (rev 3.3), the source of truth. Sections 1-14 are general. Section 15 (Operator profile) and section 16 (Project hook) are specific to the operator and the project. |
| `.claude/skills/orchestrating-herdr-agents/SKILL.md` | The Claude Code skill built from the manifest. |
| `.claude/skills/orchestrating-herdr-agents/references/` | Eight topic files, each a verbatim cut of the manifest. Generated, never edited by hand. |
| `.claude/skills/orchestrating-herdr-agents/build-references.sh` | Generates `references/` from the manifest. `--check` fails if they have drifted. |
| `docs/superpowers/skill-tests/orchestrator/` | The `superpowers:writing-skills` pressure-test campaign: RED baseline, GREEN, REFACTOR, with scenarios, prompts, runs and blind scoring. Results are in `green-results.md` and `refactor-results.md`. |
| `scripts/check.sh` | Offline check: `bash -n` on the build script, then `build-references.sh --check`. |

Test results (clean runs, out of 60 scored items): without the skill 1/60, skill v2 38/60,
v5 47/60, v6 49/60. The v6 figure is a composite: five scenario families on v5, plus s3
re-run on v6.

## Changing the manifest

1. Edit `docs/orchestrator-manifest.md`.
2. Regenerate the references:
   `bash .claude/skills/orchestrating-herdr-agents/build-references.sh`
3. Verify: `bash scripts/check.sh` (must print `RESULT: PASS`).
4. Commit the manifest and the regenerated `references/` together.

If `SKILL.md` itself needs to change (not only the manifest), re-run the relevant scenarios
from the test campaign before proposing the change.

## Using the skill

- **Inside one project:** copy or symlink `.claude/skills/orchestrating-herdr-agents/` into
  that project's `.claude/skills/`.
- **Globally:** symlink the same directory into `~/.claude/skills/`. Whether to do this is a
  separate decision that the operator makes.

The skill is project-agnostic. The project binds it through its own rules (manifest
section 16), which the orchestrator reads before anything else.

## Provenance

Split out, with history preserved (18 commits), from `approveninja/ccs.ansible` on
2026-10-21 at the operator's request, so that the skill can later be linked globally. The
project-specific bindings (hard rules, working agreement) stay in that repository's
`CLAUDE.md`; only the general manifest and the skill live here.

## Rules for changes

- A change to the manifest or the skill changes what agents may do. It is therefore merged
  **only by the operator**, never by an agent, even when the diff is "just documentation".
- Every change keeps `scripts/check.sh` passing.
- No session links and no secrets in anything committed here.
