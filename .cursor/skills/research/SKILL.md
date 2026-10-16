---
name: research
description: >-
  Investigate a question against high-trust primary sources; write a cited Markdown research file.
  Use for RFCs, library docs, API contracts — not binary RE (use evidence-research for that).
---

# Research

## Steps

1. Clarify the question in one sentence.
2. Prefer primary sources: official docs, RFCs, source code, standards.
3. Prefer recent versions; note dates.
4. Write `artifacts/research/<slug>-research.md`:
   - Question
   - Sources (links + what was taken)
   - Findings
   - Recommendations
   - Open unknowns
5. Do not implement product code here unless asked to spike.

## Quality

- Every non-obvious claim has a citation.
- Separate fact vs inference.
- If sources conflict, say so explicitly.
