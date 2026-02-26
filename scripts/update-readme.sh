#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readme_path="$repo_root/README.md"
pages_html_path="$repo_root/README.pages.html"
metadata_path="$repo_root/scripts/readme-metadata.tsv"
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

escape_table_text() {
  printf '%s' "$1" | sed 's/|/\\|/g'
}

html_escape() {
  printf '%s' "$1" \
    | sed -e 's/&/\&amp;/g' \
          -e 's/</\&lt;/g' \
          -e 's/>/\&gt;/g' \
          -e 's/"/\&quot;/g' \
          -e "s/'/\&#39;/g"
}

metadata_lookup() {
  local category="$1"
  local problem="$2"
  local field="$3"
  local col

  if [[ ! -f "$metadata_path" ]]; then
    printf ''
    return 0
  fi

  case "$field" in
    difficulty) col=3 ;;
    topic) col=4 ;;
    problem_url) col=5 ;;
    *)
      printf ''
      return 0
      ;;
  esac

  awk -F '\t' -v c="$category" -v p="$problem" -v col="$col" '
    $0 ~ /^#/ || NF == 0 { next }
    $1 == c && $2 == p {
      print $col
      found = 1
      exit
    }
    END {
      if (!found) {
        print ""
      }
    }
  ' "$metadata_path"
}

extract_problem_url_from_files() {
  local dir="$1"
  local url

  if command -v rg >/dev/null 2>&1; then
    url="$(rg -o --no-filename -m 1 "https?://[^[:space:]\\\"'<>)]+" "$dir" 2>/dev/null | head -n 1 || true)"
  else
    url="$(grep -RhoE "https?://[^[:space:]\\\"'<>)]+" "$dir" 2>/dev/null | head -n 1 || true)"
  fi

  url="$(printf '%s' "$url" | sed 's/[.,;:]*$//')"

  printf '%s' "$url"
}

default_problem_link() {
  local category="$1"
  local problem="$2"
  local encoded_problem

  encoded_problem="$(url_encode "$problem")"

  case "$category" in
    LeetCode)
      printf 'https://leetcode.com/problemset/all/?search=%s' "$encoded_problem"
      ;;
    HackerRank)
      printf 'https://www.hackerrank.com/search?search=%s' "$encoded_problem"
      ;;
    GeekForGeeks)
      printf 'https://www.geeksforgeeks.org/?s=%s' "$encoded_problem"
      ;;
    Pramp)
      printf 'https://www.pramp.com/#/?q=%s' "$encoded_problem"
      ;;
    *)
      printf ''
      ;;
  esac
}

infer_topic() {
  local problem="$1"
  local lowered

  lowered="$(printf '%s' "$problem" | tr '[:upper:]' '[:lower:]')"

  case "$lowered" in
    *"linked list"*|*"list cycle"*)
      printf 'Linked List'
      ;;
    *"tree"*|*"bst"*|*"binary search tree"*)
      printf 'Tree'
      ;;
    *"graph"*|*"bfs"*|*"dfs"*|*"topological"*)
      printf 'Graph'
      ;;
    *"matrix"*|*"grid"*|*"island"*|*"spiral"*)
      printf 'Matrix'
      ;;
    *"string"*|*"palindrome"*|*"anagram"*|*"substring"*|*"word"*)
      printf 'String'
      ;;
    *"sort"*)
      printf 'Sorting'
      ;;
    *"search"*)
      printf 'Searching'
      ;;
    *"array"*|*"subarray"*|*"sum"*|*"two number"*|*"three number"*)
      printf 'Array'
      ;;
    *"stack"*|*"queue"*)
      printf 'Stack / Queue'
      ;;
    *)
      printf '_'
      ;;
  esac
}

generate_table() {
  local category="$1"
  local index=1
  local dir problem_raw problem_name encoded_path solution_link
  local metadata_problem_url file_problem_url problem_url
  local difficulty topic problem_link_cell solution_link_cell

  printf '| Serial No. | Problem | Problem Link | Solution | Difficulty | Topic/Pattern | Notes |\n'
  printf '|---|---|---|---|---|---|---|\n'

  while IFS= read -r dir; do
    problem_raw="$(basename "$dir")"
    problem_raw="$(trim_whitespace "$problem_raw")"
    problem_name="$(escape_table_text "$problem_raw")"

    encoded_path="$(url_encode "${dir#$repo_root/}")"
    solution_link="${repo_url_base}/${encoded_path}"
    solution_link_cell="[Solution](${solution_link})"

    metadata_problem_url="$(trim_whitespace "$(metadata_lookup "$category" "$problem_raw" "problem_url")")"
    file_problem_url="$(extract_problem_url_from_files "$dir")"

    if [[ -n "$metadata_problem_url" ]]; then
      problem_url="$metadata_problem_url"
    elif [[ -n "$file_problem_url" ]]; then
      problem_url="$file_problem_url"
    else
      problem_url="$(default_problem_link "$category" "$problem_raw")"
    fi

    if [[ -n "$problem_url" ]]; then
      problem_link_cell="[Problem](${problem_url})"
    else
      problem_link_cell="_"
    fi

    difficulty="$(trim_whitespace "$(metadata_lookup "$category" "$problem_raw" "difficulty")")"
    if [[ -z "$difficulty" ]]; then
      difficulty="_"
    fi
    difficulty="$(escape_table_text "$difficulty")"

    topic="$(trim_whitespace "$(metadata_lookup "$category" "$problem_raw" "topic")")"
    if [[ -z "$topic" ]]; then
      topic="$(infer_topic "$problem_raw")"
    fi
    topic="$(escape_table_text "$topic")"

    printf '|%d|%s|%s|%s|%s|%s|_|\n' \
      "$index" "$problem_name" "$problem_link_cell" "$solution_link_cell" "$difficulty" "$topic"

    index=$((index + 1))
  done < <(
    find "$repo_root/$category" -mindepth 1 -maxdepth 1 -type d | LC_ALL=C sort
  )
}

generate_html_section() {
  local category="$1"
  local section_url="$2"
  local index=1
  local dir problem_raw problem_name encoded_path solution_link
  local metadata_problem_url file_problem_url problem_url
  local difficulty topic problem_url_attr solution_url_attr

  printf '<h3><a href="%s">%s</a></h3>\n' "$(html_escape "$section_url")" "$(html_escape "$category")"
  printf '<table>\n'
  printf '  <thead>\n'
  printf '    <tr><th>Serial No.</th><th>Problem</th><th>Problem Link</th><th>Solution</th><th>Difficulty</th><th>Topic/Pattern</th><th>Notes</th></tr>\n'
  printf '  </thead>\n'
  printf '  <tbody>\n'

  while IFS= read -r dir; do
    problem_raw="$(basename "$dir")"
    problem_raw="$(trim_whitespace "$problem_raw")"
    problem_name="$(html_escape "$problem_raw")"

    encoded_path="$(url_encode "${dir#$repo_root/}")"
    solution_link="${repo_url_base}/${encoded_path}"
    solution_url_attr="$(html_escape "$solution_link")"

    metadata_problem_url="$(trim_whitespace "$(metadata_lookup "$category" "$problem_raw" "problem_url")")"
    file_problem_url="$(extract_problem_url_from_files "$dir")"

    if [[ -n "$metadata_problem_url" ]]; then
      problem_url="$metadata_problem_url"
    elif [[ -n "$file_problem_url" ]]; then
      problem_url="$file_problem_url"
    else
      problem_url="$(default_problem_link "$category" "$problem_raw")"
    fi

    difficulty="$(trim_whitespace "$(metadata_lookup "$category" "$problem_raw" "difficulty")")"
    if [[ -z "$difficulty" ]]; then
      difficulty="_"
    fi
    difficulty="$(html_escape "$difficulty")"

    topic="$(trim_whitespace "$(metadata_lookup "$category" "$problem_raw" "topic")")"
    if [[ -z "$topic" ]]; then
      topic="$(infer_topic "$problem_raw")"
    fi
    topic="$(html_escape "$topic")"

    printf '    <tr>'
    printf '<td>%d</td>' "$index"
    printf '<td>%s</td>' "$problem_name"

    if [[ -n "$problem_url" ]]; then
      problem_url_attr="$(html_escape "$problem_url")"
      printf '<td><a href="%s">Problem</a></td>' "$problem_url_attr"
    else
      printf '<td>_</td>'
    fi

    printf '<td><a href="%s">Solution</a></td>' "$solution_url_attr"
    printf '<td>%s</td>' "$difficulty"
    printf '<td>%s</td>' "$topic"
    printf '<td>_</td>'
    printf '</tr>\n'

    index=$((index + 1))
  done < <(
    find "$repo_root/$category" -mindepth 1 -maxdepth 1 -type d | LC_ALL=C sort
  )

  printf '  </tbody>\n'
  printf '</table>\n\n'
}

generate_pages_html() {
  cat <<'EOF'
<h1>Algorithms Solutions in Swift</h1>
<p>This repository contains Swift solutions from AlgoExpert, LeetCode, HackerRank, GeekForGeeks, and Pramp.</p>
<p>Suggestions and contributions are welcome.</p>

<h2>How to Use</h2>
<ul>
  <li>Browse by platform section and open <strong>Problem Link</strong> for the original prompt.</li>
  <li>Open <strong>Solution</strong> to view the implementation in this repository.</li>
  <li>Update <code>Difficulty</code>, <code>Topic/Pattern</code>, or <code>Problem Link</code> overrides in <code>scripts/readme-metadata.tsv</code>.</li>
</ul>

EOF

  generate_html_section "HackerRank" "https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/HackerRank/"
  generate_html_section "LeetCode" "https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/LeetCode/"
  generate_html_section "AlgoExpert" "https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/AlgoExpert/"
  generate_html_section "GeekForGeeks" "https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/GeekForGeeks/"
  generate_html_section "Pramp" "https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/Pramp/"
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
geeksforgeeks_table="$(mktemp)"
pramp_table="$(mktemp)"

trap 'rm -f "$hackerrank_table" "$leetcode_table" "$algoexpert_table" "$geeksforgeeks_table" "$pramp_table"' EXIT

generate_table "HackerRank" > "$hackerrank_table"
generate_table "LeetCode" > "$leetcode_table"
generate_table "AlgoExpert" > "$algoexpert_table"
generate_table "GeekForGeeks" > "$geeksforgeeks_table"
generate_table "Pramp" > "$pramp_table"

replace_section "HACKERRANK" "$hackerrank_table"
replace_section "LEETCODE" "$leetcode_table"
replace_section "ALGOEXPERT" "$algoexpert_table"
replace_section "GEEKSFORGEEKS" "$geeksforgeeks_table"
replace_section "PRAMP" "$pramp_table"

# Pages uses this HTML copy for stable table rendering.
generate_pages_html > "$pages_html_path"

echo "README.md updated from directory structure."
