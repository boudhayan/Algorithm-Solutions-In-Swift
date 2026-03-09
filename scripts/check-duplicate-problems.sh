#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
allowlist_path="$repo_root/scripts/duplicate-problem-allowlist.tsv"
entries_file="$(mktemp)"
trap 'rm -f "$entries_file"' EXIT

normalize_problem() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/&/ and /g; s/[^a-z0-9]+/ /g; s/^ +| +$//g; s/ +//g'
}

for category in HackerRank LeetCode AlgoExpert GeekForGeeks Pramp; do
  while IFS= read -r dir; do
    name="$(basename "$dir")"
    key="$(normalize_problem "$name")"
    [[ -z "$key" ]] && continue
    printf '%s\t%s\t%s\n' "$category" "$key" "$name" >> "$entries_file"
  done < <(find "$repo_root/$category" -mindepth 1 -maxdepth 1 -type d | LC_ALL=C sort)
done

awk -F '\t' -v allowlist="$allowlist_path" '
  BEGIN {
    if ((getline line < allowlist) >= 0) {
      close(allowlist)
      while ((getline line < allowlist) > 0) {
        if (line ~ /^#/ || line == "") {
          continue
        }
        split(line, parts, "\t")
        if (length(parts[1]) > 0 && length(parts[2]) > 0) {
          allow[parts[1] "|" parts[2]] = 1
        }
      }
      close(allowlist)
    }
  }
  {
    id = $1 "|" $2
    if (!(id in first_name)) {
      first_name[id] = $3
      next
    }

    if ($3 != first_name[id] && !(id in allow)) {
      printf "Potential duplicate in %s: '\''%s'\'' and '\''%s'\'' (normalized key: %s).\n", $1, first_name[id], $3, $2 > "/dev/stderr"
      has_error = 1
    }
  }
  END {
    if (has_error) {
      print "Duplicate problem check failed." > "/dev/stderr"
      exit 1
    }
    print "Duplicate problem check passed."
  }
' "$entries_file"
