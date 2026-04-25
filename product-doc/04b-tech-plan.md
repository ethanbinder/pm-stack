# Tech Plan: Add Value framing to Strategic One Pager Goal section

**Author**: Ethan Binder

**Objective**: Restructure the `/product-doc` Strategic One Pager Goal section so it leads with two value statements — Value for End User and Value for [Company Name] — before the existing metrics bullets, and prompt the user for the company name during intake (with persistence in `.pm-stack/learnings.md` so future runs don't re-ask).

**PRD & Design Link**:

---

## Problem Statement
The Strategic One Pager Goal section jumped straight to metrics with no framing of *why* those metrics matter — to the end user, or to the business. PMs writing one pagers had to invent that framing each time, and there was no consistent place for the "value to user / value to company" narrative that exec reviewers expect.

## Changes Made
- `skills/product-doc/SKILL.md` — Tab 1 Goal template: replaced the flat 3-bullet block with three H3 subsections: `### Value for End User`, `### Value for [Company Name]`, `### Metrics`. Existing metrics bullets are preserved verbatim under the new `### Metrics` heading.
- `skills/product-doc/SKILL.md` — Workflow intake (`## Workflow` step 1): added a conditional company-name question. Skill only asks when the requested tabs include the Strategic One Pager AND `.pm-stack/learnings.md` does not already contain a `Company:` line under `## Project Facts`. Once answered, the value is appended to `.pm-stack/learnings.md` so future runs skip the question.
- `skills/product-doc/SKILL.md` — Generate step (`## Workflow` step 5): instructs the skill to substitute `[Company Name]` in the Tab 1 Goal heading with the resolved company name; falls back to leaving the literal placeholder if unknown.

Tabs 2–10 are unchanged. The H3-subsection pattern reuses the convention already established in Tab 2's Product Spec (`### [Requirement Name]` blocks). Persistence reuses the `.pm-stack/learnings.md` file already maintained by `/memory` — no new file format introduced.

## Testing
N/A — pure SKILL.md template + workflow-instruction edit, no runtime behavior in this repo. Verified by:
- `git diff --stat` shows only `skills/product-doc/SKILL.md` and `product-doc/04b-tech-plan.md`.
- The Tab 1 `## Goal` block in `skills/product-doc/SKILL.md` now contains `### Value for End User`, `### Value for [Company Name]`, and `### Metrics` in that order.
- The intake list in `## Workflow` step 1 includes the new conditional company-name bullet.
- The Generate step in `## Workflow` step 5 mentions `[Company Name]` substitution.

## Risks
- None — purely a template + workflow-instruction edit. No conditionals or logic outside the skill's own runtime behavior; existing `.pm-stack/learnings.md` files won't be corrupted because the skill only appends a `Company:` line under `## Project Facts` (creating the section if absent). Other 9 tabs unaffected. Existing one pagers already on disk are not back-filled.
