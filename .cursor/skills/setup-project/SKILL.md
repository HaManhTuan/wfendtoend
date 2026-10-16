---
name: setup-project
description: >-
  One-time setup: install kit into a repo, choose issue tracker notes, seed GLOSSARY and artifacts.
  Use once per target repository before the engineering flow.
disable-model-invocation: true
---

# Setup project

## Steps

1. Confirm target repo root.
2. Run (from the kit):

```bash
/var/www/ai-tools/cursor-workflow/scripts/install-to-project.sh "$TARGET_REPO"
```

3. Ask:
   - Issue tracker? (GitHub / GitLab / local markdown / other)
   - Where domain docs live? (default `GLOSSARY.md` + `docs/adr/`)
4. Write `docs/agents/issue-tracker.md` in the **target** repo (copy from kit template).
5. Ensure `artifacts/{research,specs,plans,tickets,reviews,handoffs}/` exist.
6. Seed `GLOSSARY.md` with 3–5 real project terms if known.

## Done when

User can run `/feature` or `@discover` and the agent finds `AGENTS.md` + skills.
