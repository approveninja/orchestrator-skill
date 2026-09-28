#!/usr/bin/env bash
# Build anonymised scoring sets: for each scenario family, copy every RED and GREEN run of
# that family under a random item id, so the scorer cannot tell the batches apart by name.
# The item -> run mapping stays in the map file, which scorers are never given.
#
# Usage: bash make-items.sh <green-runs-dir> <out-dir> [<family>:<label>:<runs-dir>]...
#   Each extra argument adds that family's runs from another directory under its own batch
#   label, e.g. s5:v1:green-1/runs to re-score the v1 S5 runs beside RED and v2.
# Env: MAP          the map file to write (default score/map.tsv)
#      GREEN_LABEL  the batch label of <green-runs-dir> (default green)
set -euo pipefail
shopt -s nullglob

here="$(cd "$(dirname "$0")/.." && pwd)"
green="${1:?green runs dir}"
out="${2:?out dir}"
shift 2
extras=( "$@" )
rm -rf "$out"; mkdir -p "$out"
map="${MAP:-$here/score/map.tsv}"
mkdir -p "$(dirname "$map")"
printf 'item\tbatch\trun\tscenario-file\n' > "$map"

scen_file() {  # run basename -> scenario file (relative to the test dir)
  case "$1" in
    open-*)   echo "scenarios/open/${1#open-}.md" ;;
    lowcue-*) echo "scenarios/lowcue/${1#lowcue-}.md" ;;
    s6*)      echo "scenarios/product/$1.md" ;;
  esac
}

runs_of() {  # <batch> <dir> <family> -> "batch<TAB>file" lines
  local f
  for f in "$2"/open-"$3"-*.out "$2"/lowcue-"$3"-*.out "$2"/"$3"[ab]-*.out; do
    printf '%s\t%s\n' "$1" "$f"
  done
}

for fam in s1 s2 s3 s4 s5 s6; do
  mkdir -p "$out/$fam"
  printf 'item\tscenario-file\n' > "$out/$fam/index.tsv"
  {
    runs_of red "$here/runs" "$fam"
    runs_of "${GREEN_LABEL:-green}" "$green" "$fam"
    for x in ${extras[@]+"${extras[@]}"}; do
      IFS=: read -r xfam xlabel xdir <<< "$x"
      if [ "$xfam" = "$fam" ]; then runs_of "$xlabel" "$xdir" "$fam"; fi
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
