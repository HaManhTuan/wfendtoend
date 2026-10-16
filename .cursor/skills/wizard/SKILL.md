---
name: wizard
description: >-
  Generate an interactive bash wizard for steps only a human can perform —
  provisioning, credentials, third-party dashboards, one-off cutovers.
  Use when automation cannot finish alone.
disable-model-invocation: true
---

# Wizard

## Steps

1. List human-only steps (secrets, console clicks, approvals).
2. Write `scripts/wizards/<slug>.sh` that:
   - Prints each step clearly
   - Waits for Enter / pasted values
   - Validates simple inputs when possible
   - Never prints secrets back in full
   - Records completion checklist to `artifacts/handoffs/<slug>-wizard.md`
3. Run it with the user (or hand them the script).
4. Do not pretend the agent completed human steps.

## Safety

- No hardcoded production secrets in the repo.
- Prefer env vars / secret managers.
- Mark destructive steps with an explicit typed confirmation.
