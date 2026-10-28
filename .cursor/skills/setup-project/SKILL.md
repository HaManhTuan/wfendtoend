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

3. Ensure app `.gitignore` tracks workflow markdown:

```gitignore
artifacts/**
!artifacts/**/
!artifacts/**/.gitkeep
!artifacts/**/*.md
.wfendtoend-backup/
```

4. Ask:
   - Issue tracker? (GitHub / GitLab / local markdown / other)
   - Where domain docs live? (default `GLOSSARY.md` + `docs/adr/`)
   - Is this a **FE / UI** app? If yes, recommend (do not force into core kit):

```bash
npx skills add https://github.com/vercel-labs/skills --skill find-skills
npx skills add anthropics/skills --skill frontend-design
# optional browser smoke later:
# npm i -g agent-browser && agent-browser install
# npx skills add https://github.com/vercel-labs/agent-browser --skill agent-browser
```

5. If `docs/agents/issue-tracker.md` is still the template, fill it in.
6. Ensure `artifacts/{research,specs,plans,tickets,reviews,handoffs}/` exist.
7. Seed `GLOSSARY.md` with 3–5 real project terms if known.
8. If `docs/agents/AGENTS.wfendtoend.md` exists beside the project’s own `AGENTS.md`, help merge/link.
9. Create empty run log: copy `templates/RUN-LOG.md` → `artifacts/reviews/<first-slug>-run-log.md` when the first task starts (or note that `/feature` will create it).
10. **`run-log`:** record setup-project.

## Done when

User can type **`/feature`** or **`/greenfield`** and the agent finds skills + will grill before coding. **`ship`** is git. **`/release`** is how an audience receives the build.
