#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/<user>/Downloads/LC103"
OUT="/Users/<user>/LC103/software_decompile_2026-02-24/exhaustive"
mkdir -p "$OUT" "$OUT/binwalk_per_file" "$OUT/strings_offsets"

files_list="$OUT/files.txt"
find "$ROOT" -type f | sort > "$files_list"

catalog="$OUT/file_catalog.tsv"
printf 'path\tsize\tsha256\tfile_type\n' > "$catalog"
while IFS= read -r f; do
  rel="${f#${ROOT}/}"
  sz=$(wc -c < "$f" | tr -d ' ')
  hash=$(shasum -a 256 "$f" | awk '{print $1}')
  typ=$(file -b "$f" | tr '\t' ' ' | tr '\n' ' ')
  printf '%s\t%s\t%s\t%s\n' "$rel" "$sz" "$hash" "$typ" >> "$catalog"
done < "$files_list"

# Offset-indexed strings for every file
while IFS= read -r f; do
  rel="${f#${ROOT}/}"
  safe=$(echo "$rel" | tr '/ ' '__')
  strings -a -t x "$f" > "$OUT/strings_offsets/${safe}.txt" || true
done < "$files_list"

# Binwalk signatures for every file
while IFS= read -r f; do
  rel="${f#${ROOT}/}"
  safe=$(echo "$rel" | tr '/ ' '__')
  {
    echo "FILE: $rel"
    binwalk "$f" || true
  } > "$OUT/binwalk_per_file/${safe}.txt"
done < "$files_list"

# Aggregate prompts and tokens
all_strings="$OUT/all_strings.txt"
: > "$all_strings"
while IFS= read -r s; do
  cat "$s" >> "$all_strings"
  echo >> "$all_strings"
done < <(find "$OUT/strings_offsets" -type f | sort)

prompt_pat='(connect|disconnect|insert|remove|press|hold|click|double[ -]?click|select|choose|set |open |close |turn |power|hook|attach|short|lead|fixture|calibration|prompt|next|continue|ok|enter|switch|ringer|flyback|induct|capac|range|start|stop|done|complete|error|warning)'
rg -i "$prompt_pat" "$all_strings" | awk 'length($0)>=8 && length($0)<=280' | sort -u > "$OUT/prompt_candidates_all.txt" || true

# Command token hits
rg -i 'CALON|CALOFF|CALSET|CALCLR|CALF\??|CALCHK|CALDATE\??|SER#\??|VER#\??|BEEP' "$all_strings" | sort -u > "$OUT/command_token_hits.txt" || true

# VI token catalog
rg -oi '[A-Za-z0-9_ +#\-.]{2,}\.vi\b' "$all_strings" | sed 's/\r$//' | sort -fu > "$OUT/vi_names_all.txt" || true

# Top calibration stage labels
rg -i 'Software Rev\. Check|Calibration Reset|Current Source Calibration|Gain Calibration|Capacitance Calibration|ESR Calibration|Inductance Calibration|Leakage Voltage Calibration|Leakage Voltage Test|Leakage Current Test|Calibration Stamp' "$all_strings" \
  | sed 's/^[[:space:]]*//' | sort | uniq -c | sort -nr > "$OUT/stage_label_frequency.txt" || true

# Summary
{
  echo "files_count: $(wc -l < "$files_list" | tr -d ' ')"
  echo "catalog_rows: $(($(wc -l < "$catalog") - 1))"
  echo "strings_files: $(find "$OUT/strings_offsets" -type f | wc -l | tr -d ' ')"
  echo "binwalk_files: $(find "$OUT/binwalk_per_file" -type f | wc -l | tr -d ' ')"
  echo "prompt_candidates: $(wc -l < "$OUT/prompt_candidates_all.txt" | tr -d ' ')"
  echo "vi_names: $(wc -l < "$OUT/vi_names_all.txt" | tr -d ' ')"
  echo "command_token_hits: $(wc -l < "$OUT/command_token_hits.txt" | tr -d ' ')"
} > "$OUT/summary.txt"

cat "$OUT/summary.txt"
