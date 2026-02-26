#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0

cd "$repo_root"

tabs_report="$(mktemp)"
trailing_ws_report="$(mktemp)"
trap 'rm -f "$tabs_report" "$trailing_ws_report"' EXIT

if command -v rg >/dev/null 2>&1; then
  rg -n $'\t' --glob '*.swift' --glob '!**/.git/**' --glob '!**/.build/**' . > "$tabs_report" || true
  if [[ -s "$tabs_report" ]]; then
    head -n 50 "$tabs_report"
    if [[ "$(wc -l < "$tabs_report")" -gt 50 ]]; then
      echo "...truncated (showing first 50 matches)"
    fi
    echo "Swift style check: tabs found in Swift files." >&2
    errors=1
  fi

  rg -n "[[:blank:]]$" --glob '*.swift' --glob '!**/.git/**' --glob '!**/.build/**' . > "$trailing_ws_report" || true
  if [[ -s "$trailing_ws_report" ]]; then
    head -n 50 "$trailing_ws_report"
    if [[ "$(wc -l < "$trailing_ws_report")" -gt 50 ]]; then
      echo "...truncated (showing first 50 matches)"
    fi
    echo "Swift style check: trailing whitespace found in Swift files." >&2
    errors=1
  fi
else
  grep -RIn --include='*.swift' $'\t' . > "$tabs_report" || true
  if [[ -s "$tabs_report" ]]; then
    head -n 50 "$tabs_report"
    if [[ "$(wc -l < "$tabs_report")" -gt 50 ]]; then
      echo "...truncated (showing first 50 matches)"
    fi
    echo "Swift style check: tabs found in Swift files." >&2
    errors=1
  fi

  grep -RIn --include='*.swift' -E "[[:blank:]]$" . > "$trailing_ws_report" || true
  if [[ -s "$trailing_ws_report" ]]; then
    head -n 50 "$trailing_ws_report"
    if [[ "$(wc -l < "$trailing_ws_report")" -gt 50 ]]; then
      echo "...truncated (showing first 50 matches)"
    fi
    echo "Swift style check: trailing whitespace found in Swift files." >&2
    errors=1
  fi
fi

swift_format_cmd=""
if command -v swift-format >/dev/null 2>&1; then
  swift_format_cmd="swift-format"
elif xcrun --find swift-format >/dev/null 2>&1; then
  swift_format_cmd="xcrun swift-format"
fi

if [[ -n "$swift_format_cmd" && -f "$repo_root/.swift-format" ]]; then
  if ! eval "$swift_format_cmd lint --recursive ."; then
    echo "Swift style check: swift-format lint failed." >&2
    errors=1
  fi
else
  echo "swift-format lint skipped (missing swift-format command or .swift-format config)."
fi

if [[ "$errors" -ne 0 ]]; then
  exit 1
fi

echo "Swift style checks passed."
