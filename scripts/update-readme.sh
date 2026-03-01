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

category_repo_url() {
  local category="$1"

  case "$category" in
    HackerRank)
      printf 'https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/HackerRank/'
      ;;
    LeetCode)
      printf 'https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/LeetCode/'
      ;;
    AlgoExpert)
      printf 'https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/AlgoExpert/'
      ;;
    GeekForGeeks)
      printf 'https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/GeekForGeeks/'
      ;;
    Pramp)
      printf 'https://github.com/boudhayan/Algorithm-Solutions-In-Swift/tree/main/Pramp/'
      ;;
    *)
      printf '%s' "$repo_url_base"
      ;;
  esac
}

generate_solution_cards_html() {
  local category section_url platform_slug index=1
  local dir problem_raw problem_name encoded_path solution_link
  local metadata_problem_url file_problem_url problem_url
  local difficulty topic search_blob problem_url_attr solution_url_attr

  for category in HackerRank LeetCode AlgoExpert GeekForGeeks Pramp; do
    section_url="$(category_repo_url "$category")"
    platform_slug="$(printf '%s' "$category" | tr '[:upper:]' '[:lower:]')"
    index=1

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
      if [[ -z "$difficulty" || "$difficulty" == "_" ]]; then
        difficulty="Unknown"
      fi

      topic="$(trim_whitespace "$(metadata_lookup "$category" "$problem_raw" "topic")")"
      if [[ -z "$topic" ]]; then
        topic="$(infer_topic "$problem_raw")"
      fi
      if [[ "$topic" == "_" ]]; then
        topic="General"
      fi

      search_blob="$(printf '%s %s %s %s' "$problem_raw" "$category" "$difficulty" "$topic" | tr '[:upper:]' '[:lower:]')"

      printf '<article class="solution-card" data-platform="%s" data-search="%s">\n' \
        "$(html_escape "$platform_slug")" "$(html_escape "$search_blob")"
      printf '  <div class="solution-card-top">\n'
      printf '    <a class="platform-pill platform-%s" href="%s">%s</a>\n' \
        "$(html_escape "$platform_slug")" "$(html_escape "$section_url")" "$(html_escape "$category")"
      printf '    <span class="serial-pill">#%d</span>\n' "$index"
      printf '  </div>\n'
      printf '  <h3>%s</h3>\n' "$problem_name"
      printf '  <p class="solution-card-meta"><span>%s</span><span>%s</span></p>\n' \
        "$(html_escape "$difficulty")" "$(html_escape "$topic")"
      printf '  <div class="solution-card-actions">\n'
      if [[ -n "$problem_url" ]]; then
        problem_url_attr="$(html_escape "$problem_url")"
        printf '    <a class="card-link" href="%s">Problem</a>\n' "$problem_url_attr"
      else
        printf '    <span class="card-link card-link-muted">Problem N/A</span>\n'
      fi
      printf '    <a class="card-link card-link-primary" href="%s">Solution</a>\n' "$solution_url_attr"
      printf '  </div>\n'
      printf '</article>\n'

      index=$((index + 1))
    done < <(
      find "$repo_root/$category" -mindepth 1 -maxdepth 1 -type d | LC_ALL=C sort
    )
  done
}

generate_pages_html() {
  cat <<'EOF'
<h1>Algorithms Solutions in Swift</h1>
<p>This repository contains Swift solutions from AlgoExpert, LeetCode, HackerRank, GeekForGeeks, and Pramp.</p>
<p>Suggestions and contributions are welcome.</p>

<h2>How to Use</h2>
<ul>
  <li>Use search and platform filters to quickly find a problem.</li>
  <li>Open <strong>Problem</strong> for the original prompt and <strong>Solution</strong> for this repository implementation.</li>
  <li>Update <code>Difficulty</code>, <code>Topic/Pattern</code>, or <code>Problem Link</code> overrides in <code>scripts/readme-metadata.tsv</code>.</li>
</ul>

<section class="solutions-toolbar" aria-label="Solution filters">
  <div class="solutions-search-wrap">
    <label for="solution-search">Search solutions</label>
    <input id="solution-search" type="search" placeholder="Type problem, topic, or platform..." autocomplete="off" />
  </div>
  <div class="platform-filters" role="group" aria-label="Platform filters">
    <button class="platform-filter is-active" type="button" data-platform-filter="all">All</button>
    <button class="platform-filter" type="button" data-platform-filter="hackerrank">HackerRank</button>
    <button class="platform-filter" type="button" data-platform-filter="leetcode">LeetCode</button>
    <button class="platform-filter" type="button" data-platform-filter="algoexpert">AlgoExpert</button>
    <button class="platform-filter" type="button" data-platform-filter="geeksforgeeks">GeekForGeeks</button>
    <button class="platform-filter" type="button" data-platform-filter="pramp">Pramp</button>
  </div>
  <p id="results-count" class="results-count"></p>
</section>

<section id="solution-cards" class="solution-card-grid">
EOF

  generate_solution_cards_html

  cat <<'EOF'
</section>

<script>
(() => {
  const searchInput = document.getElementById("solution-search");
  const cards = Array.from(document.querySelectorAll(".solution-card"));
  const resultCount = document.getElementById("results-count");
  const platformButtons = Array.from(document.querySelectorAll("[data-platform-filter]"));
  let activePlatform = "all";

  if (!searchInput || cards.length === 0 || !resultCount) {
    return;
  }

  const renderCount = (visible, total) => {
    resultCount.textContent = `Showing ${visible} of ${total} solutions`;
  };

  const applyFilters = () => {
    const query = searchInput.value.trim().toLowerCase();
    let visibleCount = 0;

    cards.forEach((card) => {
      const cardPlatform = card.dataset.platform || "";
      const cardSearch = card.dataset.search || "";
      const matchesPlatform = activePlatform === "all" || cardPlatform === activePlatform;
      const matchesQuery = query.length === 0 || cardSearch.includes(query);
      const isVisible = matchesPlatform && matchesQuery;
      card.hidden = !isVisible;
      if (isVisible) {
        visibleCount += 1;
      }
    });

    renderCount(visibleCount, cards.length);
  };

  platformButtons.forEach((button) => {
    button.addEventListener("click", () => {
      activePlatform = button.dataset.platformFilter || "all";
      platformButtons.forEach((otherButton) => {
        otherButton.classList.toggle("is-active", otherButton === button);
      });
      applyFilters();
    });
  });

  searchInput.addEventListener("input", applyFilters);
  renderCount(cards.length, cards.length);
})();
</script>
EOF
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
