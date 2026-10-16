#!/usr/bin/env bash
# install-to-project.sh — merge cursor-workflow (wfendtoend) into an app repo.
#
# Default: full surface, never overwrite (skip conflicts, report clearly).
# Premium UX: dry-run, force+backup, cursor-only, per-file merge, manifest.
set -euo pipefail

KIT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
KIT_NAME="wfendtoend"
KIT_VERSION="$(git -C "$KIT_ROOT" rev-parse --short HEAD 2>/dev/null || echo "dev")"

TARGET=""
MODE="full" # full | cursor-only
DRY_RUN=0
FORCE=0
SYMLINK=0

ADDED=0
SKIPPED=0
UPDATED=0
IDENTICAL=0
BACKED_UP=0

ADDED_LIST=()
SKIPPED_LIST=()
UPDATED_LIST=()
BACKUP_ROOT=""
AGENTS_CONFLICT=0

usage() {
  cat <<EOF
Usage: $(basename "$0") <target-repo> [options]

Merge this kit into an application repository without clobbering by default.

Options:
  --full           Install .cursor + AGENTS + glossary + artifacts + templates (default)
  --cursor-only    Only .cursor/{rules,skills,commands} + manifest (+ AGENTS tip if needed)
  --force          Overwrite conflicts (backs up originals under .wfendtoend-backup/)
  --dry-run        Print the plan; write nothing
  --symlink        Prefer symlinks into the kit when creating new skills/rules/commands
  -h, --help       Show this help

Examples:
  $(basename "$0") ~/code/my-app
  $(basename "$0") ~/code/my-app --dry-run
  $(basename "$0") ~/code/my-app --cursor-only
  $(basename "$0") ~/code/my-app --force
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --full) MODE="full"; shift ;;
    --cursor-only) MODE="cursor-only"; shift ;;
    --force) FORCE=1; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    --symlink) SYMLINK=1; shift ;;
    -h|--help) usage; exit 0 ;;
    -*)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
    *)
      if [[ -n "$TARGET" ]]; then
        echo "Unexpected argument: $1" >&2
        usage >&2
        exit 1
      fi
      TARGET="$1"
      shift
      ;;
  esac
done

if [[ -z "$TARGET" ]]; then
  usage >&2
  exit 1
fi

mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"

if [[ ! -d "$TARGET/.git" ]]; then
  echo "⚠  Warning: $TARGET is not a git repo — continuing anyway." >&2
fi

rel_from_target() {
  local abs="$1"
  echo "${abs#"$TARGET"/}"
}

ensure_backup_root() {
  if [[ -z "$BACKUP_ROOT" ]]; then
    BACKUP_ROOT="$TARGET/.wfendtoend-backup/$(date +%Y%m%dT%H%M%S)"
  fi
}

backup_path() {
  local dest="$1"
  ensure_backup_root
  local rel
  rel="$(rel_from_target "$dest")"
  local bp="$BACKUP_ROOT/$rel"
  mkdir -p "$(dirname "$bp")"
  cp -a "$dest" "$bp"
  BACKED_UP=$((BACKED_UP + 1))
}

same_content() {
  local src="$1" dest="$2"
  if [[ -L "$dest" ]]; then
    [[ "$(readlink "$dest")" == "$src" ]] && return 0
    return 1
  fi
  [[ -f "$src" && -f "$dest" ]] && cmp -s "$src" "$dest"
}

place_file() {
  local src="$1" dest="$2" link_ok="${3:-0}"
  local rel
  rel="$(rel_from_target "$dest")"

  if [[ -e "$dest" || -L "$dest" ]]; then
    if same_content "$src" "$dest"; then
      IDENTICAL=$((IDENTICAL + 1))
      return 0
    fi
    if [[ "$FORCE" -eq 1 ]]; then
      if [[ "$DRY_RUN" -eq 1 ]]; then
        echo "  update  $rel  (would backup + overwrite)"
        UPDATED=$((UPDATED + 1))
        UPDATED_LIST+=("$rel")
        return 0
      fi
      backup_path "$dest"
      rm -rf "$dest"
      mkdir -p "$(dirname "$dest")"
      if [[ "$link_ok" -eq 1 && "$SYMLINK" -eq 1 ]]; then
        ln -s "$src" "$dest"
      else
        cp -a "$src" "$dest"
      fi
      UPDATED=$((UPDATED + 1))
      UPDATED_LIST+=("$rel")
      return 0
    fi
    SKIPPED=$((SKIPPED + 1))
    SKIPPED_LIST+=("$rel")
    return 0
  fi

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "  add     $rel"
    ADDED=$((ADDED + 1))
    ADDED_LIST+=("$rel")
    return 0
  fi

  mkdir -p "$(dirname "$dest")"
  if [[ "$link_ok" -eq 1 && "$SYMLINK" -eq 1 ]]; then
    ln -s "$src" "$dest"
  else
    cp -a "$src" "$dest"
  fi
  ADDED=$((ADDED + 1))
  ADDED_LIST+=("$rel")
}

ensure_dir() {
  local dir="$1"
  local rel
  rel="$(rel_from_target "$dir")"
  if [[ -d "$dir" ]]; then
    return 0
  fi
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "  mkdir   $rel"
    return 0
  fi
  mkdir -p "$dir"
}

echo
echo "┌─────────────────────────────────────────────────────────┐"
echo "│  $KIT_NAME install                                      │"
echo "├─────────────────────────────────────────────────────────┤"
echo "│  kit:     $KIT_ROOT"
echo "│  version: $KIT_VERSION"
echo "│  target:  $TARGET"
echo "│  mode:    $MODE"
echo "│  force:   $FORCE   dry-run: $DRY_RUN   symlink: $SYMLINK"
echo "└─────────────────────────────────────────────────────────┘"
echo

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "Plan (dry-run):"
fi

ensure_dir "$TARGET/.cursor"
ensure_dir "$TARGET/.cursor/rules"
ensure_dir "$TARGET/.cursor/skills"
ensure_dir "$TARGET/.cursor/commands"

while IFS= read -r -d '' src; do
  base="$(basename "$src")"
  place_file "$src" "$TARGET/.cursor/rules/$base" 1
done < <(find "$KIT_ROOT/.cursor/rules" -maxdepth 1 -type f -print0 | sort -z)

while IFS= read -r -d '' skill_dir; do
  name="$(basename "$skill_dir")"
  dest_dir="$TARGET/.cursor/skills/$name"
  if [[ -e "$dest_dir" || -L "$dest_dir" ]]; then
    if [[ -d "$dest_dir" && ! -L "$dest_dir" && -d "$skill_dir" ]]; then
      while IFS= read -r -d '' src; do
        rel_inside="${src#"$skill_dir"/}"
        place_file "$src" "$dest_dir/$rel_inside" 0
      done < <(find "$skill_dir" -type f -print0 | sort -z)
    else
      if [[ "$FORCE" -eq 1 ]]; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
          echo "  update  .cursor/skills/$name/  (would replace)"
          UPDATED=$((UPDATED + 1))
          UPDATED_LIST+=(".cursor/skills/$name/")
        else
          backup_path "$dest_dir"
          rm -rf "$dest_dir"
          if [[ "$SYMLINK" -eq 1 ]]; then
            ln -s "$skill_dir" "$dest_dir"
          else
            cp -a "$skill_dir" "$dest_dir"
          fi
          UPDATED=$((UPDATED + 1))
          UPDATED_LIST+=(".cursor/skills/$name/")
        fi
      else
        SKIPPED=$((SKIPPED + 1))
        SKIPPED_LIST+=(".cursor/skills/$name/")
      fi
    fi
  else
    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "  add     .cursor/skills/$name/"
      ADDED=$((ADDED + 1))
      ADDED_LIST+=(".cursor/skills/$name/")
    else
      if [[ "$SYMLINK" -eq 1 ]]; then
        ln -s "$skill_dir" "$dest_dir"
      else
        cp -a "$skill_dir" "$dest_dir"
      fi
      ADDED=$((ADDED + 1))
      ADDED_LIST+=(".cursor/skills/$name/")
    fi
  fi
done < <(find "$KIT_ROOT/.cursor/skills" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

while IFS= read -r -d '' src; do
  base="$(basename "$src")"
  place_file "$src" "$TARGET/.cursor/commands/$base" 1
done < <(find "$KIT_ROOT/.cursor/commands" -maxdepth 1 -type f -print0 | sort -z)

if [[ "$MODE" == "full" ]]; then
  ensure_dir "$TARGET/docs/agents"

  if [[ -f "$TARGET/AGENTS.md" ]] && ! same_content "$KIT_ROOT/AGENTS.md" "$TARGET/AGENTS.md"; then
    AGENTS_CONFLICT=1
    place_file "$KIT_ROOT/AGENTS.md" "$TARGET/docs/agents/AGENTS.wfendtoend.md" 0
    if [[ "$FORCE" -eq 1 ]]; then
      place_file "$KIT_ROOT/AGENTS.md" "$TARGET/AGENTS.md" 0
    else
      SKIPPED=$((SKIPPED + 1))
      SKIPPED_LIST+=("AGENTS.md (kept yours; kit → docs/agents/AGENTS.wfendtoend.md)")
    fi
  else
    place_file "$KIT_ROOT/AGENTS.md" "$TARGET/AGENTS.md" 0
  fi

  place_file "$KIT_ROOT/GLOSSARY.md" "$TARGET/GLOSSARY.md" 0

  ensure_dir "$TARGET/artifacts/research"
  ensure_dir "$TARGET/artifacts/specs"
  ensure_dir "$TARGET/artifacts/plans"
  ensure_dir "$TARGET/artifacts/tickets"
  ensure_dir "$TARGET/artifacts/reviews"
  ensure_dir "$TARGET/artifacts/handoffs"
  ensure_dir "$TARGET/artifacts/teach"
  ensure_dir "$TARGET/docs/adr"
  ensure_dir "$TARGET/templates"
  ensure_dir "$TARGET/scripts/wizards"

  while IFS= read -r -d '' src; do
    base="$(basename "$src")"
    place_file "$src" "$TARGET/templates/$base" 0
  done < <(find "$KIT_ROOT/templates" -maxdepth 1 -type f -name '*.md' -print0 | sort -z)

  place_file "$KIT_ROOT/docs/agents/issue-tracker.md" "$TARGET/docs/agents/issue-tracker.md" 0
  place_file "$KIT_ROOT/docs/agents/README.md" "$TARGET/docs/agents/README.md" 0

  # Ensure app can commit workflow markdown + ignore installer backups
  if [[ "$DRY_RUN" -eq 0 ]]; then
    touch "$TARGET/.gitignore"
    if ! grep -qF "# cursor-workflow / wfendtoend" "$TARGET/.gitignore" 2>/dev/null; then
      {
        echo ""
        echo "# cursor-workflow / wfendtoend"
        echo "artifacts/**"
        echo "!artifacts/**/"
        echo "!artifacts/**/.gitkeep"
        echo "!artifacts/**/*.md"
        echo ".wfendtoend-backup/"
      } >> "$TARGET/.gitignore"
      ADDED=$((ADDED + 1))
      ADDED_LIST+=(".gitignore (wfendtoend artifact patterns)")
    fi
  else
    echo "  note    .gitignore  (would append artifact *.md track + .wfendtoend-backup/)"
  fi
else
  ensure_dir "$TARGET/docs/agents"
  if [[ ! -f "$TARGET/AGENTS.md" ]]; then
    place_file "$KIT_ROOT/AGENTS.md" "$TARGET/AGENTS.md" 0
  else
    AGENTS_CONFLICT=1
    place_file "$KIT_ROOT/AGENTS.md" "$TARGET/docs/agents/AGENTS.wfendtoend.md" 0
  fi
fi

# Manifest via Python for clean JSON
MANIFEST="$TARGET/.cursor/wfendtoend-manifest.json"
if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "  write   .cursor/wfendtoend-manifest.json"
else
  _tmp="$(mktemp -d)"
  printf '%s\n' "${ADDED_LIST[@]:-}" >"$_tmp/added.txt"
  printf '%s\n' "${UPDATED_LIST[@]:-}" >"$_tmp/updated.txt"
  printf '%s\n' "${SKIPPED_LIST[@]:-}" >"$_tmp/skipped.txt"
  python3 - "$MANIFEST" "$KIT_NAME" "$KIT_VERSION" "$KIT_ROOT" "$MODE" "$FORCE" "$SYMLINK" \
    "$ADDED" "$UPDATED" "$SKIPPED" "$IDENTICAL" "$BACKED_UP" "$BACKUP_ROOT" "$_tmp" <<'PY'
import json, datetime, pathlib, sys
(
    manifest, kit, version, source, mode, force, symlink,
    added, updated, skipped, identical, backed_up, backup_root, tmp,
) = sys.argv[1:]

def lines(name):
    p = pathlib.Path(tmp) / name
    if not p.exists():
        return []
    return [l for l in p.read_text(encoding="utf-8").splitlines() if l]

data = {
    "kit": kit,
    "version": version,
    "source": source,
    "mode": mode,
    "installed_at": datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
    "force": force == "1",
    "symlink": symlink == "1",
    "counts": {
        "added": int(added),
        "updated": int(updated),
        "skipped": int(skipped),
        "identical": int(identical),
        "backed_up": int(backed_up),
    },
    "added": lines("added.txt"),
    "updated": lines("updated.txt"),
    "skipped": lines("skipped.txt"),
    "backup_root": backup_root or None,
}
pathlib.Path(manifest).parent.mkdir(parents=True, exist_ok=True)
pathlib.Path(manifest).write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
PY
  rm -rf "$_tmp"
fi

INSTALL_NOTE="$TARGET/docs/agents/cursor-workflow-install.md"
if [[ "$DRY_RUN" -eq 0 ]]; then
  mkdir -p "$(dirname "$INSTALL_NOTE")"
  {
    echo "# cursor-workflow / $KIT_NAME"
    echo
    echo "- **Installed at:** $(date -Iseconds)"
    echo "- **Source:** \`$KIT_ROOT\`"
    echo "- **Version:** \`$KIT_VERSION\`"
    echo "- **Mode:** \`$MODE\`"
    echo "- **Force:** \`$FORCE\`"
    echo "- **Counts:** added=$ADDED updated=$UPDATED skipped=$SKIPPED identical=$IDENTICAL"
    if [[ -n "$BACKUP_ROOT" ]]; then
      echo "- **Backup:** \`$BACKUP_ROOT\`"
    fi
    echo
    echo "## Gitignore"
    echo
    echo "Add this line to the app \`.gitignore\`:"
    echo
    echo '```'
    echo '.wfendtoend-backup/'
    echo '```'
    if [[ "$AGENTS_CONFLICT" -eq 1 && "$FORCE" -eq 0 ]]; then
      echo
      echo "## AGENTS.md"
      echo
      echo "Your existing \`AGENTS.md\` was kept. Kit router is at"
      echo "\`docs/agents/AGENTS.wfendtoend.md\` — merge or point your root \`AGENTS.md\` at it."
    fi
    if [[ "$SKIPPED" -gt 0 ]]; then
      echo
      echo "## Skipped (already present — use --force to overwrite)"
      echo
      for x in "${SKIPPED_LIST[@]:-}"; do
        [[ -n "$x" ]] && echo "- \`$x\`"
      done
    fi
  } > "$INSTALL_NOTE"
fi

echo
echo "Summary"
echo "───────"
echo "  added:     $ADDED"
echo "  updated:   $UPDATED"
echo "  skipped:   $SKIPPED   (conflicts kept yours)"
echo "  identical: $IDENTICAL"
if [[ "$BACKED_UP" -gt 0 ]]; then
  echo "  backed up: $BACKED_UP → $BACKUP_ROOT"
fi
echo

if [[ "$SKIPPED" -gt 0 ]]; then
  echo "Skipped (use --force to replace after backup):"
  for x in "${SKIPPED_LIST[@]:-}"; do
    [[ -n "$x" ]] && echo "  • $x"
  done
  echo
fi

if [[ "$AGENTS_CONFLICT" -eq 1 && "$FORCE" -eq 0 ]]; then
  echo "Note: root AGENTS.md already exists."
  echo "      Kit router saved as docs/agents/AGENTS.wfendtoend.md"
  echo "      Merge when ready — do not lose your project-specific agent notes."
  echo
fi

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "Dry-run complete — no files written."
else
  echo "Done. Manifest: .cursor/wfendtoend-manifest.json"
  echo "Open the app in Cursor → type /greenfield or /feature (agent will grill first)."
fi
echo
