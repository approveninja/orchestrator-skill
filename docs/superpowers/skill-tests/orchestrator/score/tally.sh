#!/usr/bin/env bash
# Join the scorers' verdicts (the BEGIN-TSV blocks of score/scores-*.md) with score/map.tsv,
# and count verdicts per criterion, batch (red/green) and format (open/lowcue/product).
#
# Usage: bash tally.sh [scores-glob]      default: score/scores-s*.md
#   prints a table: criterion  format  batch  PASS FAIL PARTIAL HEDGED N/A  (other: lang codes)
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
files=( ${1:-$here/scores-s*.md} )

for f in "${files[@]}"; do
  awk '/^BEGIN-TSV/{on=1; next} /^END-TSV/{on=0} on && NF' "$f"
done | awk -F'\t' -v map="$here/map.tsv" '
  BEGIN {
    while ((getline line < map) > 0) {
      split(line, m, "\t"); if (m[1] == "item") continue
      batch[m[1]] = m[2]
      fmt = m[3]; sub(/-.*/, "", fmt)
      if (fmt ~ /^s6/) fmt = "product"
      format[m[1]] = fmt
    }
  }
  {
    item = $1; crit = $2; v = $3
    gsub(/^ +| +$/, "", v); gsub(/^ +| +$/, "", crit)
    if (!(item in batch)) { print "unknown item: " item > "/dev/stderr"; next }
    key = crit "\t" format[item] "\t" batch[item]
    n[key, v]++; keys[key] = 1; seen[v] = 1
  }
  END {
    split("PASS FAIL PARTIAL HEDGED N/A info ru en mixed", order, " ")
    printf "criterion\tformat\tbatch"; for (i = 1; i <= 9; i++) printf "\t%s", order[i]; printf "\n"
    for (k in keys) {
      line = k
      for (i = 1; i <= 9; i++) line = line "\t" (n[k, order[i]] + 0)
      print line
    }
  }' | { read -r header; echo "$header"; sort -t$'\t' -k1,1V -k2,2 -k3,3r; } | column -t -s$'\t'
