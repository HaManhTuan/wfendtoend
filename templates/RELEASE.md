# Release: <title>

- **Slug:** `<slug>`
- **Verify:** `artifacts/reviews/<slug>-verify.md`
- **Verify SHA:** `<SHA from that file>`
- **Status:** draft | ready | released | waived
- **Audience:** `<users, staging, package tag, or internal devs>`
- **Version or tag:** none | `<name>`

Ship put the change in git. This file is how that audience receives it. Do not mark `released` without an owner name. Do not deploy a command the repo does not already document.

## Changelog

User-facing or operator-facing. One bullet per behavior change.

- `<who can do what they could not do before>`

## Migration

none | `<commands in order>`

- **Reversible:** yes | no
- **If no:** `<waiver name and date, or the restore path>`

## Flag / default

none | `<flag name>`

- **Default this release ships:** `<on or off>`
- **Who flips it:** `<role>`

## Rollback

`<Exact command or documented steps.>`

“No rollback” is allowed only with the approver’s name and the date.

- **Approver if there is no rollback:** `<name or n/a>`

## Deploy

| Command | Exit | When | Where |
|---------|------|------|-------|
| `<repo-documented command, or "not run">` | `<code or —>` | `<YYYY-MM-DDThh:mm>` | `<environment>` |

## How we will know it worked

`<metric, log line, or smoke the owner will look at in the first hour>`

## Sensitive surface

none | threat note path | security-audit report path | waiver (who, when)

## Human steps

none | `<wizard output path, or the human-only steps: DNS, credentials, store listing>`

## Owner sign-off

- **Name:** `<the user, or the named owner>`
- **When:** `<YYYY-MM-DDThh:mm>`
- **Statement:** `<I accept this audience receiving SHA …>`
