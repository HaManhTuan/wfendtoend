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
2. Prefer a dry-run, then install (from the kit clone):

```bash
./scripts/install-to-project.sh "$TARGET_REPO" --dry-run
./scripts/install-to-project.sh "$TARGET_REPO"
# or minimal:
# ./scripts/install-to-project.sh "$TARGET_REPO" --cursor-only
```

Default is **non-destructive**. Existing `.cursor` skills/rules/commands and `AGENTS.md` are kept; conflicts are reported. Use `--force` only with user consent (creates `.wfendtoend-backup/`).

3. Ask:
   - Issue tracker? (GitHub / GitLab / local markdown / other)
   - Where domain docs live? (default `GLOSSARY.md` + `docs/adr/`)
4. If `docs/agents/issue-tracker.md` is still the template, fill it in.
5. Ensure `artifacts/{research,specs,plans,tickets,reviews,handoffs}/` exist (full install creates them).
6. Seed `GLOSSARY.md` with 3–5 real project terms if known.
7. If `docs/agents/AGENTS.wfendtoend.md` exists beside the project’s own `AGENTS.md`, help the user merge or link the kit router.

## Done when

User can run `/feature` or `@discover` and the agent finds the workflow skills (and a usable `AGENTS.md` router).
