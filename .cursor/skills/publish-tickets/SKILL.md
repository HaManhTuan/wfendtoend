---
name: publish-tickets
description: >-
  Mirror an existing tickets file to GitHub issues after a preview. Use only from
  to-tickets when docs/agents/issue-tracker.md says type github. Not for planning,
  bug filing, or repos that keep tickets in markdown.
---

# Publish tickets

`artifacts/tickets/<slug>.md` stays the source of truth. This skill copies that graph to GitHub. It does not invent the breakdown.

## When

- The tickets file exists and the user approved the plan.
- `docs/agents/issue-tracker.md` has **Type:** `github`.
- The user answered yes to the preview below.

## When not

- Type is `local-markdown`, `gitlab`, `other`, or the file is missing. Stop. Markdown remains the tracker.
- No tickets file yet. Do not create issues from chat.
- A bug report. `/bug` goes through `diagnose` first.
- `gh` is missing or unauthenticated. Stop and say so. Do not draft a second plan under `docs/plans`.

## Steps

1. Read the tickets file and the tracker file (repo, labels, sub-issues yes/no).
2. Run `gh repo view --json nameWithOwner` and `gh label list`.
3. Show one preview, then wait:

   | Ticket | Title | Kind | Blocked by |
   |--------|-------|------|------------|
   | T1 | | | — |

   Ask: create these GitHub issues? Unknown labels are listed as “create” or “drop”.
4. On no, stop.
5. On yes, create issues in dependency order with `gh issue create`. Title is the ticket title. Body includes Kind, Goal, Done when, Verify, `Source: artifacts/tickets/<slug>.md`, and `Blocked by: T1` using ticket ids.
6. Write a **Tracker** section in the tickets file: `T1 → #n`. Do not delete the ticket bodies.
7. Edit issue bodies so `Blocked by` uses the real numbers. If the tracker says sub-issues yes, link each child to its blocker with the GitHub `addSubIssue` mutation. If that call fails, keep the `#n` lines and record the failure.
8. On a failure mid-batch, stop. Name which ticket ids already have numbers. Do not re-run the whole batch.

## Do not

- Estimate points or draw a Gantt.
- Replace the SPEC or the plan.
- Push issue creation onto `main` as a code change. The tickets file edit is the only repo write.
