---
name: teach
description: >-
  Teach the user a skill or concept over multiple sessions using the current directory as a
  stateful teaching workspace. Use when the goal is learning, not shipping product code.
disable-model-invocation: true
---

# Teach

## Setup

1. Agree topic + success criteria (“I can explain X / do Y unaided”).
2. Create `artifacts/teach/<topic-slug>/` with `progress.md` and `exercises/`.

## Session loop

1. Diagnose current understanding (one question).
2. Teach the smallest next concept.
3. Give a short exercise; wait for their attempt.
4. Feedback; update `progress.md`.
5. Stop at a clean checkpoint; note next session goal.

## Rules

- Prefer doing over lecture.
- Do not hijack into building unrelated product features.
- Keep jargon aligned with `GLOSSARY.md` when teaching project domain.
