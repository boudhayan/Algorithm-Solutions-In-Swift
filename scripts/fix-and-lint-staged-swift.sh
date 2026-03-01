#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

staged_swift_files="$(mktemp)"
tabs_report="$(mktemp)"
trailing_ws_report="$(mktemp)"
tabs_tmp="$(mktemp)"
trailing_tmp="$(mktemp)"
trap 'rm -f "$staged_swift_files" "$tabs_report" "$trailing_ws_report" "$tabs_tmp" "$trailing_tmp"' EXIT

git diff --cached --name-only --diff-filter=ACMR -- '*.swift' > "$staged_swift_files" || true

if [[ ! -s "$staged_swift_files" ]]; then
  echo "No staged Swift files to format/lint."
  exit 0
fi

swift_format_available=0
if command -v swift-format >/dev/null 2>&1; then
  swift_format_available=1
elif xcrun --find swift-format >/dev/null 2>&1; then
  swift_format_available=2
fi

run_swift_format() {
  local mode="$1"
  local file="$2"

  if [[ "$swift_format_available" -eq 1 ]]; then
    swift-format "$mode" "$file"
  elif [[ "$swift_format_available" -eq 2 ]]; then
    xcrun swift-format "$mode" "$file"
  fi
}

# Auto-fix pass for staged Swift files.
while IFS= read -r file; do
  [[ -z "$file" ]] && continue
  [[ -f "$file" ]] || continue

  perl -i -pe 's/[ \t]+$//' "$file"
  if [[ "$swift_format_available" -ne 0 ]]; then
    run_swift_format format "$file"
  fi

  git add "$file"
done < "$staged_swift_files"

# Lint pass for staged Swift files.
errors=0
while IFS= read -r file; do
  [[ -z "$file" ]] && continue
  [[ -f "$file" ]] || continue

  if grep -n $'\t' "$file" > "$tabs_tmp" 2>/dev/null; then
    sed "s#^#$file:#" "$tabs_tmp" >> "$tabs_report"
  fi

  if grep -n -E "[[:blank:]]$" "$file" > "$trailing_tmp" 2>/dev/null; then
    sed "s#^#$file:#" "$trailing_tmp" >> "$trailing_ws_report"
  fi
done < "$staged_swift_files"

if [[ -s "$tabs_report" ]]; then
  head -n 30 "$tabs_report" >&2
  echo "Swift lint failed: tabs detected in staged files." >&2
  errors=1
fi

if [[ -s "$trailing_ws_report" ]]; then
  head -n 30 "$trailing_ws_report" >&2
  echo "Swift lint failed: trailing whitespace detected in staged files." >&2
  errors=1
fi

if [[ "$swift_format_available" -ne 0 ]]; then
  while IFS= read -r file; do
    [[ -z "$file" ]] && continue
    [[ -f "$file" ]] || continue
    if ! run_swift_format lint "$file"; then
      echo "Swift-format lint failed for $file." >&2
      errors=1
    fi
  done < "$staged_swift_files"
else
  echo "swift-format not found; format/lint step skipped for swift-format."
fi

if [[ "$errors" -ne 0 ]]; then
  exit 1
fi

echo "Staged Swift format/lint checks passed."
