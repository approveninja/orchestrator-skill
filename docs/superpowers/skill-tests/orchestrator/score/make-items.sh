#!/usr/bin/env bash
# Build anonymised scoring sets: for each scenario family, copy every RED and GREEN run of
# that family under a random item id, so the scorer cannot tell the batches apart by name.
# The item -> run mapping stays in score/map.tsv, which scorers are never given.
#
# Usage: bash make-items.sh <green-runs-dir> <out-dir>
set -euo pipefail
shopt -s nullglob

here="$(cd "$(dirname "$0")/.." && pwd)"
green="${1:?green runs dir}"
out="${2:?out dir}"
rm -rf "$out"; mkdir -p "$out"
map="$here/score/map.tsv"
printf 'item\tbatch\trun\tscenario-file\n' > "$map"

scen_file() {  # run basename -> scenario file (relative to the test dir)
  case "$1" in
    open-*)   echo "scenarios/open/${1#open-}.md" ;;
    lowcue-*) echo "scenarios/lowcue/${1#lowcue-}.md" ;;
    s6*)      echo "scenarios/product/$1.md" ;;
  esac
}

for fam in s1 s2 s3 s4 s5 s6; do
  mkdir -p "$out/$fam"
  printf 'item\tscenario-file\n' > "$out/$fam/index.tsv"
  {
    for f in "$here"/runs/open-"$fam"-*.out "$here"/runs/lowcue-"$fam"-*.out "$here"/runs/"$fam"[ab]-*.out; do
      printf 'red\t%s\n' "$f"
    done
    for f in "$green"/open-"$fam"-*.out "$green"/lowcue-"$fam"-*.out "$green"/"$fam"[ab]-*.out; do
      printf 'green\t%s\n' "$f"
    done
  } | while IFS=$'\t' read -r batch f; do
    printf '%s\t%s\t%s\n' "$RANDOM$RANDOM" "$batch" "$f"
  done | sort -n | while IFS=$'\t' read -r _ batch f; do
    n=$(( $(wc -l < "$out/$fam/index.tsv") ))
    item="$fam-$(printf '%02d' "$n")"
    run="$(basename "$f" .out)"
    sid="${run%%.*}"
    sfile="$(scen_file "$sid")"
    cp "$f" "$out/$fam/$item.txt"
    printf '%s\t%s\n' "$item" "$sfile" >> "$out/$fam/index.tsv"
    printf '%s\t%s\t%s\t%s\n' "$item" "$batch" "$run" "$sfile" >> "$map"
  done
done
echo "items: $(tail -n +2 "$map" | wc -l | tr -d ' ') (map: $map)"
