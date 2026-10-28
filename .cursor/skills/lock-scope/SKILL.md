---
name: lock-scope
description: >-
  After discover/research, lock inclusion/exclusion boundaries and assumptions before planning.
  Use when SPEC exists but plan must not start without clear edges.
disable-model-invocation: true
---

# Lock scope

Read `artifacts/research/<slug>.md` and `artifacts/specs/<slug>.md` first.

## Produce

If the SPEC already has **In scope**, **Out of scope**, **Assumptions**, and **Open questions** filled (not left as `<prompts>`), do not write a second file. Confirm those four sections with the user.

Write `artifacts/specs/<slug>-scope.md` only when one of those sections is missing. Copy the filled sections from the SPEC into the gaps. Do not rephrase them into a parallel document.

## Gate

Ask the user to confirm the edges. On approval, next skill is `write-plan`.

Do not draft a full implementation plan here.
