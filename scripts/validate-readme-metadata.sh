#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
metadata_path="$repo_root/scripts/readme-metadata.tsv"

if [[ ! -f "$metadata_path" ]]; then
  echo "Missing metadata file: $metadata_path" >&2
  exit 1
fi

errors=0
line_no=0
seen_keys_file="$(mktemp)"
trap 'rm -f "$seen_keys_file"' EXIT

is_allowed_category() {
  case "$1" in
    AlgoExpert|HackerRank|LeetCode|GeekForGeeks|Pramp) return 0 ;;
    *) return 1 ;;
  esac
}

while IFS= read -r line || [[ -n "$line" ]]; do
  line_no=$((line_no + 1))

  if [[ -z "$line" || "$line" =~ ^# ]]; then
    continue
  fi

  tab_count="$(awk -F '\t' '{print NF-1}' <<< "$line")"
  if [[ "$tab_count" -ne 4 ]]; then
    echo "Line $line_no: expected 5 tab-separated columns, found $((tab_count + 1))." >&2
    errors=1
    continue
  fi

  IFS=$'\t' read -r category problem difficulty topic problem_url <<< "$line"

  if ! is_allowed_category "$category"; then
    echo "Line $line_no: invalid category '$category'." >&2
    errors=1
  fi

  if [[ -z "$problem" ]]; then
    echo "Line $line_no: problem must not be empty." >&2
    errors=1
  fi

  key="$(printf '%s|%s' "$category" "$problem" | tr '[:upper:]' '[:lower:]')"
  if grep -Fqx "$key" "$seen_keys_file"; then
    echo "Line $line_no: duplicate metadata entry for '$category / $problem'." >&2
    errors=1
  else
    echo "$key" >> "$seen_keys_file"
  fi

  if [[ -n "$difficulty" && "$difficulty" != "_" ]]; then
    case "$(printf '%s' "$difficulty" | tr '[:upper:]' '[:lower:]')" in
      easy|medium|hard) ;;
      *)
        echo "Line $line_no: difficulty '$difficulty' should be Easy, Medium, Hard, or '_'." >&2
        errors=1
        ;;
    esac
  fi

  if [[ -n "$problem_url" && "$problem_url" != "_" ]]; then
    if [[ ! "$problem_url" =~ ^https?:// ]]; then
      echo "Line $line_no: problem_url must start with http:// or https://." >&2
      errors=1
    fi
  fi

  if [[ -n "$category" && -n "$problem" && ! -d "$repo_root/$category/$problem" ]]; then
    echo "Line $line_no: referenced directory '$category/$problem' does not exist." >&2
    errors=1
  fi
done < "$metadata_path"

if [[ "$errors" -ne 0 ]]; then
  echo "Metadata validation failed." >&2
  exit 1
fi

echo "Metadata validation passed."
