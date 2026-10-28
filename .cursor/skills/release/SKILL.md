---
name: release
description: >-
  Put a verified change in front of its audience — changelog, migration, flag, rollback, owner.
  Use when the user asks to deploy, publish, or hand a build to users. Not for commit or PR
  (`ship` does that).
disable-model-invocation: true
---

# Release

Ship put the change in git. Release makes an audience able to use it.

## Preconditions

- `artifacts/reviews/<slug>-verify.md` exists and status is pass or waiver.
- That file has an **Acceptance evidence** table. If it does not, go back to `verify`.
- User asked to release, deploy, publish, or hand the build to people.

## Steps

1. Append **`run-log`**.
2. Copy `templates/RELEASE.md` to `artifacts/reviews/<slug>-release.md`.
3. Fill audience, changelog, migration, flag default, and a **rollback** command or an named “no rollback” waiver.
4. **Sensitive surface** (auth, PII, payment, upload, multi-tenant, public API), from the SPEC:
   - none, or
   - path to a threat note in the plan/risks, or
   - path to a security-audit report, or
   - waiver with who and when.
5. Human-only cutover (DNS, credentials, store listing) → `wizard`. Do not invent those steps.
6. Run a deploy or publish command **only** when the user asked and the repo already documents that command. Record the command and exit code in the release file.
7. Ask the owner to sign the release file. Do not mark status `released` without that name, unless the user is the owner and just confirmed.

## Do not

- Call `ship` a release.
- Deploy a stack the repo has no command for.
- Skip rollback with a blank line.
