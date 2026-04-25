# Tech Plan: Restructure /release PR body — Summary first, hyperlinked References block

**Author**: Ethan Binder

**Objective**: Reshape the `/release` PR body template so reviewers see Summary first, with Jira Ticket and Tech Plan rendered as a hyperlinked **References:** block immediately under Summary.

**PRD & Design Link**:

---

## Problem Statement
Today `/release` puts `## Jira Ticket` and `## Tech Plan` as separate top-level sections **above** `## Summary`, which pushes the actual one-line description of the PR below two metadata sections. Reviewers should see the Summary first, with the Jira and tech-plan links grouped as references underneath it.

## Changes Made
- `skills/release/SKILL.md` — Phase 3 step 6 PR body template restructured: Summary is now the first `## ` heading, followed by a `**References:**` block that conditionally renders `[Jira Ticket](URL)` (Jira mode active) and `[Tech Plan](URL)` (tech plan file exists). The whole References block is omitted when neither applies.
- `skills/release/SKILL.md` — Phase 3 step 6 lead-in paragraph rewritten to describe the new layout.
- `skills/release/SKILL.md` — Issue-Tracker Integration → Jira mode → step 5 wording updated from "Add a `## Jira Ticket` section at the top" to "Add a hyperlinked **Jira Ticket** entry to the **References:** block right under Summary."

## Testing
N/A — single-file template / wording change in a SKILL.md, no runtime behavior. Verified by:
- `git diff` shows only `skills/release/SKILL.md` modified, +6 / −8 lines.
- The rewritten template was re-read end-to-end: Summary is the first `## ` heading; the **References:** block immediately follows; Problem → Before → Solution → After → Changes Made → Testing → footer are unchanged.
- Jira mode step 5 no longer references "at the top" or `## Jira Ticket section`.

## Risks
- None — same conditionals (Jira link only in Jira mode; Tech Plan link only when the file exists; the References block omitted when neither applies). No behavior change, only rendering layout.
