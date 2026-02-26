#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readme_path="$repo_root/README.md"
repo_url_base="https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main"

url_encode() {
  local raw="$1"
  local length i char
  length=${#raw}
  for ((i = 0; i < length; i++)); do
    char="${raw:i:1}"
    case "$char" in
      [a-zA-Z0-9.~_/-]) printf '%s' "$char" ;;
      *) printf '%%%02X' "'$char" ;;
    esac
  done
}

trim_whitespace() {
  local value="$1"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  printf '%s' "$value"
}

generate_table() {
  local category="$1"
  local index=1
  local dir problem encoded_path link

  printf '| Serial No. | Problem | Solution | Time Complexity | Space Complexity | Notes |\n'
  printf '|---|---|---|---|---|---|\n'

  while IFS= read -r dir; do
    problem="$(basename "$dir")"
    problem="$(trim_whitespace "$problem")"
    encoded_path="$(url_encode "${dir#$repo_root/}")"
    link="${repo_url_base}/${encoded_path}"

    printf '|%d|%s|<a href="%s">Link</a>|_|_|_|\n' "$index" "$problem" "$link"
    index=$((index + 1))
  done < <(
    find "$repo_root/$category" -mindepth 1 -maxdepth 1 -type d | LC_ALL=C sort
  )
}

replace_section() {
  local section="$1"
  local rows_file="$2"
  local temp_file

  temp_file="$(mktemp)"

  awk -v section="$section" -v rows_file="$rows_file" '
    BEGIN {
      start_tag = "<!-- AUTO:START:" section " -->"
      end_tag = "<!-- AUTO:END:" section " -->"
      in_block = 0
      found_start = 0
      found_end = 0
    }

    $0 == start_tag {
      print
      while ((getline row < rows_file) > 0) {
        print row
      }
      close(rows_file)
      in_block = 1
      found_start = 1
      next
    }

    $0 == end_tag {
      in_block = 0
      found_end = 1
      print
      next
    }

    !in_block {
      print
    }

    END {
      if (!found_start || !found_end) {
        exit 2
      }
    }
  ' "$readme_path" > "$temp_file" || {
    rm -f "$temp_file"
    echo "Failed to update section $section in README.md" >&2
    exit 1
  }

  mv "$temp_file" "$readme_path"
}

hackerrank_table="$(mktemp)"
leetcode_table="$(mktemp)"
algoexpert_table="$(mktemp)"

trap 'rm -f "$hackerrank_table" "$leetcode_table" "$algoexpert_table"' EXIT

generate_table "HackerRank" > "$hackerrank_table"
generate_table "LeetCode" > "$leetcode_table"
generate_table "AlgoExpert" > "$algoexpert_table"

replace_section "HACKERRANK" "$hackerrank_table"
replace_section "LEETCODE" "$leetcode_table"
replace_section "ALGOEXPERT" "$algoexpert_table"

echo "README.md updated from directory structure."
