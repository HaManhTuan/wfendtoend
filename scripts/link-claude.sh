#!/usr/bin/env bash
# link-claude.sh — make Claude Code (terminal) load the same skills and commands as Cursor.
# Symlinks only. The files under .cursor/ stay the source.
set -euo pipefail

ROOT=""
DRY_RUN=0
FORCE=0

usage() {
  echo "Usage: $(basename "$0") <project-root> [--dry-run] [--force]" >&2
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --force) FORCE=1; shift ;;
    -h|--help) usage; exit 0 ;;
    -*) echo "Unknown option: $1" >&2; usage; exit 1 ;;
    *)
      if [[ -n "$ROOT" ]]; then
        echo "Unexpected argument: $1" >&2
        usage
        exit 1
      fi
      ROOT="$1"
      shift
      ;;
  esac
done

if [[ -z "$ROOT" ]]; then
  usage
  exit 1
fi

ROOT="$(cd "$ROOT" && pwd)"

if [[ ! -d "$ROOT/.cursor/skills" || ! -d "$ROOT/.cursor/commands" ]]; then
  echo "link-claude: $ROOT has no .cursor/skills or .cursor/commands" >&2
  exit 1
fi

link_one() {
  local dest="$1" target="$2" label="$3"
  if [[ -L "$dest" && "$(readlink "$dest")" == "$target" ]]; then
    echo "  identical  $label"
    return 0
  fi
  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ "$FORCE" -ne 1 ]]; then
      echo "  skip       $label  (exists)"
      return 0
    fi
    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "  update     $label"
      return 0
    fi
    rm -rf "$dest"
  fi
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "  add        $label -> $target"
    return 0
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$target" "$dest"
  echo "  add        $label -> $target"
}

echo "link-claude: $ROOT"

while IFS= read -r -d '' skill_dir; do
  name="$(basename "$skill_dir")"
  link_one "$ROOT/.claude/skills/$name" "../../.cursor/skills/$name" ".claude/skills/$name"
done < <(find "$ROOT/.cursor/skills" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

while IFS= read -r -d '' cmd; do
  base="$(basename "$cmd")"
  name="${base%.md}"
  if [[ -d "$ROOT/.cursor/skills/$name" ]]; then
    echo "  skip       .claude/commands/$base  (slash owned by skill /$name)"
    continue
  fi
  link_one "$ROOT/.claude/commands/$base" "../../.cursor/commands/$base" ".claude/commands/$base"
done < <(find "$ROOT/.cursor/commands" -maxdepth 1 -type f -name '*.md' -print0 | sort -z)
