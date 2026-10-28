# Issue tracker (per project)

Filled by `setup-project`. Skills that create tickets read this file.

## Tracker

- **Type:** local-markdown | github | gitlab | other
- **Notes:**

### Local markdown

- Tickets file: `artifacts/tickets/<slug>.md`
- No CLI required

### GitHub

Filled when this project mirrors tickets to GitHub. `publish-tickets` reads these fields. Leave them blank to keep markdown only.

- **Repo:** auto | `owner/name`
- **Sub-issues:** yes | no
- **Labels:** `<kind or ticket label the repo already has>`

### GitLab

- Use `glab` as agreed
- Labels:

## Triage labels (optional)

| Label | Meaning |
|-------|---------|
| needs-triage | Not classified |
| ready | Unblocked |
| blocked | Waiting on dependency |
| wontfix | Declined |

## Domain docs

- Glossary: `GLOSSARY.md`
- ADRs: `docs/adr/`
