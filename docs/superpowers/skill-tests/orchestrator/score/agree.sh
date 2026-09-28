#!/usr/bin/env bash
# Inter-rater agreement between two scoring rounds of the same runs. Item ids differ between
# rounds, so each round's verdicts are joined to batch:run through its own map (RED and GREEN
# runs share basenames, so the batch label is part of the key). Compares every
# (run, criterion) pair both rounds scored; G-lang and the void S2.4 are left out.
#
# Usage: bash agree.sh <map-a> <scores-a> <map-b> <scores-b> [<batch>]
#   <batch>  only runs of this batch label in map-b (for example v2)
#   prints agreed/total, then every disagreement: run, criterion, verdict a, verdict b
set -euo pipefail
[ "$#" -ge 4 ] || { echo "usage: bash agree.sh <map-a> <scores-a> <map-b> <scores-b> [<batch>]" >&2; exit 2; }

verdicts() {  # <map> <scores> [<batch>] -> "batch:run<TAB>criterion<TAB>verdict"
  awk '/^BEGIN-TSV/{on=1; next} /^END-TSV/{on=0} on && NF' "$2" \
    | awk -F'\t' -v map="$1" -v want="${3:-}" '
      BEGIN { while ((getline l < map) > 0) { split(l, m, "\t"); run[m[1]] = m[3]; batch[m[1]] = m[2] } }
      { c = $2; v = $3; gsub(/^ +| +$/, "", c); gsub(/^ +| +$/, "", v)
        if (!($1 in run) || c == "G-lang" || c == "S2.4") next
        if (want != "" && batch[$1] != want) next
        print batch[$1] ":" run[$1] "\t" c "\t" v }' | sort
}

join -t $'\t' -j 1 \
  <(verdicts "$1" "$2" | awk -F'\t' '{print $1 "|" $2 "\t" $3}' | sort) \
  <(verdicts "$3" "$4" "${5:-}" | awk -F'\t' '{print $1 "|" $2 "\t" $3}' | sort) \
  | awk -F'\t' '{ n++; if ($2 == $3) a++; else d[++nd] = $1 "\t" $2 "\t" $3 }
      END { printf "agreement: %d/%d (%.0f%%)\n", a, n, n ? 100 * a / n : 0
            for (i = 1; i <= nd; i++) { sub(/\|/, "\t", d[i]); print d[i] } }'
