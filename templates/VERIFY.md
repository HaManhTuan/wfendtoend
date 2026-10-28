# Verify: <title>

- **Slug:** `<slug>`
- **SHA:** `<git rev-parse HEAD>`
- **Tree:** `<worktree path or "integration">`
- **Status:** pass | fail | waiver
- **Environment:** `<OS, runtime version, how the app was started>`

A green suite with no acceptance row is not a pass. Integration verify runs on the merged tree. A green worktree does not count after a merge.

## Commands

| Command | Exit | Excerpt |
|---------|------|---------|
| `<exact command>` | `<0>` | `<the line that shows the claim>` |

## Not run

| Check | Why |
|-------|-----|
| `<lint, browser, CI, …>` | `<not in the repo / tool missing / waived below>` |

## Browser smoke

skipped — `<tool missing or no UI>` | ran — `<URL, what was clicked, what was confirmed>`

## Acceptance evidence

One row per FR, in-scope NFR, and ticket **Done when**. Use `no AC in spec` only when the SPEC really has none.

| AC / Done when | Evidence | Result |
|----------------|----------|--------|
| `<FR1>` | `<command, waiver name, or “no AC in spec”>` | pass / fail / waived |

## Sensitive surface

none | threat note path | security-audit report path | waiver (who, when)

`<Match the SPEC. Auth, PII, payment, upload, multi-tenant, and public API are sensitive.>`

## CI

absent | `<cited run URL or id>` | local-only pre-check (do not claim CI is green)

## Integration verify

n/a — `<single tree>` | yes — `<this SHA is the merge result>` | no — `<do not mark pass>`

## Waivers

| Check | Reason | Approver | When |
|-------|--------|----------|------|
| `<check>` | `<why skipping is honest>` | `<name>` | `<YYYY-MM-DD>` |

## Result

`<One sentence: what is now safe to claim, and what is not.>`
