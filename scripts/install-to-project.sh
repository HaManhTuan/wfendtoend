#!/usr/bin/env bash
# Install cursor-workflow into a target git repo (copy, not symlink by default).
set -euo pipefail

KIT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-}"

if [[ -z "$TARGET" ]]; then
  echo "Usage: $0 /path/to/target-repo" >&2
  exit 1
fi

mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"

if [[ ! -d "$TARGET/.git" ]]; then
  echo "Warning: $TARGET is not a git repo — continuing anyway." >&2
fi

mkdir -p "$TARGET/.cursor" \
  "$TARGET/artifacts"/{research,specs,plans,tickets,reviews,handoffs,teach} \
  "$TARGET/docs/agents" "$TARGET/docs/adr" "$TARGET/templates" "$TARGET/scripts/wizards"

# Core agent surfaces
cp -R "$KIT_ROOT/.cursor/rules" "$TARGET/.cursor/"
cp -R "$KIT_ROOT/.cursor/skills" "$TARGET/.cursor/"
cp -R "$KIT_ROOT/.cursor/commands" "$TARGET/.cursor/"
cp "$KIT_ROOT/AGENTS.md" "$TARGET/AGENTS.md"

if [[ ! -f "$TARGET/GLOSSARY.md" ]]; then
  cp "$KIT_ROOT/GLOSSARY.md" "$TARGET/GLOSSARY.md"
fi

# Templates + docs (don't overwrite existing tracker notes)
cp -n "$KIT_ROOT/templates/"*.md "$TARGET/templates/" 2>/dev/null || true
if [[ ! -f "$TARGET/docs/agents/issue-tracker.md" ]]; then
  cp "$KIT_ROOT/docs/agents/issue-tracker.md" "$TARGET/docs/agents/issue-tracker.md"
fi

# Keep a pointer to the kit version
{
  echo "# cursor-workflow"
  echo
  echo "Installed from: \`$KIT_ROOT\`"
  echo "Date: $(date -Iseconds)"
} > "$TARGET/docs/agents/cursor-workflow-install.md"

echo "Installed cursor-workflow into $TARGET"
echo "Next: open the project in Cursor and run /feature or /ask"
