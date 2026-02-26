#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0

cd "$repo_root"

tabs_report="$(mktemp)"
trailing_ws_report="$(mktemp)"
target_files_list="$(mktemp)"
trap 'rm -f "$tabs_report" "$trailing_ws_report" "$target_files_list"' EXIT

if [[ "$#" -gt 0 ]]; then
  for file in "$@"; do
    if [[ -f "$file" && "$file" == *.swift ]]; then
      echo "$file" >> "$target_files_list"
    fi
  done
else
  find . -type f -name '*.swift' -not -path './.git/*' -not -path './.build/*' > "$target_files_list"
fi

if [[ ! -s "$target_files_list" ]]; then
  echo "No Swift files found for style check."
  exit 0
fi

while IFS= read -r file; do
  if grep -n $'\t' "$file" > /tmp/codex-style-tabs.$$ 2>/dev/null; then
    sed "s#^#$file:#" /tmp/codex-style-tabs.$$ >> "$tabs_report"
  fi
  if grep -n -E "[[:blank:]]$" "$file" > /tmp/codex-style-trailing.$$ 2>/dev/null; then
    sed "s#^#$file:#" /tmp/codex-style-trailing.$$ >> "$trailing_ws_report"
  fi
done < "$target_files_list"

rm -f /tmp/codex-style-tabs.$$ /tmp/codex-style-trailing.$$

if [[ -s "$tabs_report" ]]; then
  head -n 50 "$tabs_report"
  if [[ "$(wc -l < "$tabs_report")" -gt 50 ]]; then
    echo "...truncated (showing first 50 matches)"
  fi
  echo "Swift style check: tabs found in Swift files." >&2
  errors=1
fi

if [[ -s "$trailing_ws_report" ]]; then
  head -n 50 "$trailing_ws_report"
  if [[ "$(wc -l < "$trailing_ws_report")" -gt 50 ]]; then
    echo "...truncated (showing first 50 matches)"
  fi
  echo "Swift style check: trailing whitespace found in Swift files." >&2
  errors=1
fi

swift_format_cmd=""
if command -v swift-format >/dev/null 2>&1; then
  swift_format_cmd="swift-format"
elif xcrun --find swift-format >/dev/null 2>&1; then
  swift_format_cmd="xcrun swift-format"
fi

if [[ -n "$swift_format_cmd" && -f "$repo_root/.swift-format" ]]; then
  while IFS= read -r file; do
    if ! eval "$swift_format_cmd lint \"$file\""; then
      echo "Swift style check: swift-format lint failed for $file." >&2
      errors=1
    fi
  done < "$target_files_list"
else
  echo "swift-format lint skipped (missing swift-format command or .swift-format config)."
fi

if [[ "$errors" -ne 0 ]]; then
  exit 1
fi

echo "Swift style checks passed."
