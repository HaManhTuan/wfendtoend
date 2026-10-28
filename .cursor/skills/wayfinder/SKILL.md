---
name: wayfinder
description: >-
  Plan work larger than one agent session as a map of decision tickets; resolve one at a time
  until the path is clear. Use for epics, migrations, multi-week initiatives.
disable-model-invocation: true
---

# Wayfinder

Huge work fails when you pretend it fits in one PLAN. Navigate with a **decision map**.

## Steps

1. State the destination (one paragraph).
2. List unknown decisions blocking the path (architecture, vendor, data model, rollout…).
3. Write `artifacts/plans/<slug>-wayfinder.md` (see `templates/WAYFINDER.md`):
   - Decision tickets D1…Dn, each marked one-way or two-way
   - Dependencies between decisions
   - Suggested order
   - Delete nothing the template marks required; leave parking lot as `none` if empty
4. Resolve **one** decision per session (use `grill-me` / `grilling` / `prototype` / `research` as needed).
5. Update the map; spawn normal feature tickets only for the **cleared** stretch of road.

## Rules

- Do not implement production code for unresolved decisions.
- Prefer reversible decisions first (two-way doors).
- When the map is clear enough for an MVP slice → `write-plan` + `to-tickets`.
