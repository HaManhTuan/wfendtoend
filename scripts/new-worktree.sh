#!/usr/bin/env bash
# Create an isolated git worktree for parallel agents (Orca-lite).
set -euo pipefail

NAME="${1:-}"
BASE_REF="${2:-HEAD}"

if [[ -z "$NAME" ]]; then
  echo "Usage: $0 <name> [base-ref]" >&2
  echo "Example: $0 api-impl main" >&2
  exit 1
fi

ROOT="$(git rev-parse --show-toplevel)"
PARENT="$(dirname "$ROOT")"
REPO_NAME="$(basename "$ROOT")"
WT_PATH="$PARENT/${REPO_NAME}-wt-${NAME}"
BRANCH="feat/${NAME}"

if [[ -d "$WT_PATH" ]]; then
  echo "Worktree path already exists: $WT_PATH" >&2
  exit 1
fi

git worktree add -b "$BRANCH" "$WT_PATH" "$BASE_REF"
echo "Created worktree:"
echo "  path:   $WT_PATH"
echo "  branch: $BRANCH"
echo "Open a Cursor window / agent on that path with a role-specific prompt."
