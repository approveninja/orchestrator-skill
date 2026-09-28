#!/usr/bin/env bash
# Clean-run count: a run is clean when every scored criterion is PASS. N/A, the info
# criteria (*-info, G-lang) and the void S2.4 are left out. Reads the BEGIN-TSV blocks of
# the given score files and the map file; prints clean/total per batch and scenario, the
# totals per batch, and every verdict other than PASS with the run it belongs to.
#
# Usage: [MAP=<map.tsv>] bash clean.sh <score-file>...   default map: score/map.tsv
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
[ "$#" -ge 1 ] || { echo "usage: [MAP=…] bash clean.sh <score-file>..." >&2; exit 2; }

for f in "$@"; do
  awk '/^BEGIN-TSV/{on=1; next} /^END-TSV/{on=0} on && NF' "$f"
done | awk -F'\t' -v map="${MAP:-$here/map.tsv}" '
  BEGIN {
    while ((getline line < map) > 0) {
      split(line, m, "\t"); if (m[1] == "item") continue
      batch[m[1]] = m[2]; run[m[1]] = m[3]
      scen = m[3]; sub(/\..*/, "", scen); scenario[m[1]] = scen
    }
  }
  {
    item = $1; crit = $2; v = $3
    gsub(/^ +| +$/, "", crit); gsub(/^ +| +$/, "", v)
    if (!(item in batch)) { print "unknown item: " item > "/dev/stderr"; next }
    seen[item] = 1
    if (crit ~ /-info$/ || crit == "G-lang" || crit == "S2.4" || v == "N/A") next
    if (v != "PASS") { dirty[item] = 1; bad[++nb] = batch[item] "\t" run[item] "\t" item "\t" crit "\t" v }
  }
  END {
    for (i in seen) {
      k = batch[i] "\t" scenario[i]; tot[k]++; if (!(i in dirty)) cl[k]++
      bt[batch[i]]++; if (!(i in dirty)) bc[batch[i]]++
    }
    print "== clean runs per batch and scenario"
    for (k in tot) printf "%s\t%d/%d\n", k, cl[k] + 0, tot[k] | "sort"
    close("sort")
    print "== clean runs per batch"
    for (b in bt) printf "%s\t%d/%d\n", b, bc[b] + 0, bt[b] | "sort"
    close("sort")
    print "== verdicts other than PASS (batch, run, item, criterion, verdict)"
    for (i = 1; i <= nb; i++) print bad[i] | "sort"
    close("sort")
  }'
