#!/usr/bin/env python3
import json
import os
import re
import textwrap
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path


MARKER = "<!-- ai-pr-assistant -->"


def env(name: str, default: str = "") -> str:
    value = os.getenv(name, default)
    return value.strip()


GITHUB_API_URL = env("GITHUB_API_URL", "https://api.github.com")
REPO = env("GITHUB_REPOSITORY")
PR_NUMBER = env("PR_NUMBER")
TOKEN = env("GITHUB_TOKEN")
OUTPUT_PATH = env("OUTPUT_PATH")
MODELS_ENDPOINT = env(
    "GITHUB_MODELS_ENDPOINT",
    "https://models.inference.ai.azure.com/chat/completions",
)
MODEL_NAME = env("GITHUB_MODELS_MODEL", "openai/gpt-4o-mini")


def gh_get(path: str):
    req = urllib.request.Request(
        f"{GITHUB_API_URL}{path}",
        headers={
            "Authorization": f"Bearer {TOKEN}",
            "Accept": "application/vnd.github+json",
            "User-Agent": "ai-pr-assistant",
        },
    )
    with urllib.request.urlopen(req, timeout=30) as response:
        return json.loads(response.read().decode("utf-8"))


def list_pr_files():
    files = []
    page = 1
    while True:
        data = gh_get(
            f"/repos/{REPO}/pulls/{PR_NUMBER}/files?per_page=100&page={page}"
        )
        if not data:
            break
        files.extend(data)
        page += 1
    return files


def infer_topic(problem_name: str) -> str:
    lowered = problem_name.lower()
    if "linked list" in lowered or "list cycle" in lowered:
        return "Linked List"
    if "tree" in lowered or "bst" in lowered:
        return "Tree"
    if any(x in lowered for x in ["graph", "bfs", "dfs", "topological"]):
        return "Graph"
    if any(x in lowered for x in ["matrix", "grid", "island", "spiral"]):
        return "Matrix"
    if any(x in lowered for x in ["string", "palindrome", "anagram", "substring", "word"]):
        return "String"
    if "sort" in lowered:
        return "Sorting"
    if "search" in lowered:
        return "Searching"
    if any(x in lowered for x in ["array", "subarray", "sum", "two number", "three number"]):
        return "Array"
    if "stack" in lowered or "queue" in lowered:
        return "Stack / Queue"
    return "_"


def changed_problem_dirs(files):
    problems = set()
    pattern = re.compile(r"^(HackerRank|LeetCode|AlgoExpert|GeekForGeeks|Pramp)/([^/]+)/")
    for entry in files:
        filename = entry.get("filename", "")
        match = pattern.match(filename)
        if match:
            problems.add((match.group(1), match.group(2)))
    return sorted(problems)


def load_metadata_entries(repo_root: Path):
    metadata_path = repo_root / "scripts" / "readme-metadata.tsv"
    existing = set()
    if not metadata_path.exists():
        return existing

    for line in metadata_path.read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("#"):
            continue
        parts = line.split("\t")
        if len(parts) >= 2:
            existing.add((parts[0], parts[1]))
    return existing


def build_metadata_suggestions(files, repo_root: Path):
    changed = changed_problem_dirs(files)
    existing = load_metadata_entries(repo_root)

    missing = [(cat, prob) for (cat, prob) in changed if (cat, prob) not in existing]
    if not missing:
        return "No metadata additions needed for changed problem folders."

    lines = []
    for category, problem in missing:
        topic = infer_topic(problem)
        lines.append(f"{category}\t{problem}\t_\t{topic}\t_")
    return "Add these lines to `scripts/readme-metadata.tsv`:\n\n```tsv\n" + "\n".join(lines) + "\n```"


def build_fallback_summary(pr, files):
    top_files = sorted(files, key=lambda item: item.get("changes", 0), reverse=True)[:10]
    file_lines = []
    for entry in top_files:
        file_lines.append(
            f"- `{entry.get('filename', '')}` (+{entry.get('additions', 0)} / -{entry.get('deletions', 0)})"
        )

    return textwrap.dedent(
        f"""
        Could not reach AI model endpoint, so here is a deterministic summary.

        - PR title: {pr.get('title', '')}
        - Files changed: {len(files)}
        - Additions: {pr.get('additions', 0)}, Deletions: {pr.get('deletions', 0)}
        - Suggested manual checks:
          - correctness on edge cases
          - complexity alignment with README notes
          - naming consistency across similar problems

        Top changed files:
        {chr(10).join(file_lines) if file_lines else "- (no files listed)"}
        """
    ).strip()


def model_summary(pr, files):
    # Keep payload compact and focused to avoid token/rate limits.
    file_context = []
    for entry in files[:25]:
        patch = entry.get("patch", "")
        if patch:
            patch = patch[:800]
        file_context.append(
            {
                "file": entry.get("filename", ""),
                "status": entry.get("status", ""),
                "additions": entry.get("additions", 0),
                "deletions": entry.get("deletions", 0),
                "patch_excerpt": patch,
            }
        )

    prompt = {
        "pr_title": pr.get("title", ""),
        "pr_body": pr.get("body", "") or "",
        "changed_files": file_context,
    }

    body = {
        "model": MODEL_NAME,
        "messages": [
            {
                "role": "system",
                "content": (
                    "You are a Swift code reviewer. Be concise and practical. "
                    "Return markdown with sections: 'Summary', 'Potential Risks', "
                    "'Suggested Checks'."
                ),
            },
            {
                "role": "user",
                "content": json.dumps(prompt),
            },
        ],
        "temperature": 0.2,
        "max_tokens": 700,
    }

    req = urllib.request.Request(
        MODELS_ENDPOINT,
        data=json.dumps(body).encode("utf-8"),
        headers={
            "Authorization": f"Bearer {TOKEN}",
            "Content-Type": "application/json",
        },
        method="POST",
    )

    with urllib.request.urlopen(req, timeout=45) as response:
        payload = json.loads(response.read().decode("utf-8"))

    choices = payload.get("choices", [])
    if not choices:
        return None
    message = choices[0].get("message", {})
    content = message.get("content", "")
    return content.strip() if content else None


def build_comment():
    if not REPO or not PR_NUMBER or not TOKEN:
        return (
            f"{MARKER}\n## AI PR Assistant\n"
            "Missing required environment values (`GITHUB_REPOSITORY`, `PR_NUMBER`, `GITHUB_TOKEN`)."
        )

    pr = gh_get(f"/repos/{REPO}/pulls/{PR_NUMBER}")
    files = list_pr_files()
    repo_root = Path(__file__).resolve().parents[1]

    ai_section = ""
    error_note = ""
    try:
        ai_section = model_summary(pr, files) or ""
    except (urllib.error.URLError, urllib.error.HTTPError, TimeoutError) as exc:
        error_note = f"Model endpoint unavailable (`{exc}`); using fallback summary."
    except Exception as exc:  # pragma: no cover - defensive.
        error_note = f"Model call failed (`{exc}`); using fallback summary."

    if not ai_section:
        ai_section = build_fallback_summary(pr, files)

    metadata_section = build_metadata_suggestions(files, repo_root)

    parts = [
        MARKER,
        "## AI PR Assistant",
    ]
    if error_note:
        parts.append(f"_Note: {error_note}_")
    parts.append(ai_section)
    parts.append("## Metadata Suggestions")
    parts.append(metadata_section)
    return "\n\n".join(parts).strip() + "\n"


def main():
    comment = build_comment()
    output = Path(OUTPUT_PATH) if OUTPUT_PATH else Path(".github/ai-pr-comment.md")
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(comment, encoding="utf-8")
    print(f"Wrote AI PR comment to {output}")


if __name__ == "__main__":
    main()
