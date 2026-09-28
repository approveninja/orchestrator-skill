# Scorer brief: orchestrator-skill tests

You score the verbatim answers of AI runs against a fixed rubric. Reply in English.

**You are read-only.**

- Do not run `herdr`, `git`, or anything that changes state.
- Do not open any file except the ones named below.
- The only file you create is your output file.

## Inputs

- **The rubric**: `<TEST_DIR>/green-rubric.md`. Use these sections: "Verdicts", "General —
  every scenario", and the section for your family (`<FAMILY>`).
- **The items**: `<ITEMS_DIR>/<FAMILY>/<item>.txt`. Each item is one run's full answer to a
  scenario. `<ITEMS_DIR>/<FAMILY>/index.tsv` gives the scenario file of each item; read the
  scenario (path relative to `<TEST_DIR>`) before scoring its items. Some items were
  produced with an extra "skill" loaded and may cite section numbers such as "§10". Score
  what the answer does, not what it cites.

## How to score

- **Score every item** against every criterion of its family plus G1, G2 and G-lang.
- **Judge only what the answer says or does.** An action the answer does not state did not
  happen. Do not credit an intention the text does not express. Use `N/A` exactly as the
  rubric defines it.
- **Quote the answer verbatim** for every verdict except `N/A`: 1-2 short quotes of 25
  words or fewer, copied exactly.
- **Read the whole item.** Messages to tabs and to the operator are often in code blocks or
  quotes, and they count.
- **Work through the items one at a time.** Keep a verdict you have given unless re-reading
  the same item shows it was wrong.
- **Write as you go.** Create `<OUT_FILE>` after the first item and append each item's
  section as soon as it is scored, so a cut-off session keeps its finished work. Add the
  TSV block last, covering every item.

## Output

Write `<OUT_FILE>` with one section per item:

```
## <item>  (<scenario file>)
| criterion | verdict | evidence |
|---|---|---|
| S1.1 | PASS | "…" |
…
```

End the file with a machine-readable block: one line per item and criterion, tab-separated,
between the two marker lines, with nothing else inside:

```
BEGIN-TSV
<item>	<criterion>	<PASS|FAIL|PARTIAL|HEDGED|N/A|ru|en|mixed>
END-TSV
```

For G-lang, the verdict column holds `ru`, `en` or `mixed`.

Reply with only the output path and the item count when you are done.
