# Tech Plan: Add Effort Estimate to Strategic One Pager

**Author**: Ethan Binder

**Objective**: Add an `**Effort Estimate:**` (S / M / L / XL) field to the Strategic One Pager's `## What's Needed to Get Started` section, and prompt the user for it during `/product-doc` intake whenever the Strategic One Pager is requested. No persistence — effort is task-specific.

**PRD & Design Link**:

---

## Problem Statement
The Strategic One Pager listed asks, dependencies, and next steps, but no effort sizing. Reviewers and PMs routinely want a quick "how big is this?" stamp before deciding whether to invest the time to read deeper. S/M/L/XL t-shirt sizing is already the convention in Tab 5 (Eng Estimates), so adopting it here keeps the doc internally consistent.

## Changes Made
- `skills/product-doc/SKILL.md` — Tab 1 What's Needed to Get Started template: appended `- **Effort Estimate:** [S/M/L/XL]` as the closing bullet of the section. Bolded inline-label pattern matches Tab 2 Product Spec bullets (`SKILL.md:97-103`).
- `skills/product-doc/SKILL.md` — Workflow intake (`## Workflow` step 1): added a conditional effort-estimate question. Skill only asks when the requested tabs include the Strategic One Pager. Phrasing: *"Do you estimate the effort as S, M, L, or XL?"* Accept `S`, `M`, `L`, `XL` (case-insensitive) or `skip`. **No persistence** — unlike `Company:`, the effort answer is task-specific and is asked every run.
- `skills/product-doc/SKILL.md` — Generate step (`## Workflow` step 5): substitution sentence extended to cover `[S/M/L/XL]` alongside `[Company Name]`. Same fallback semantics — if the user skips, the literal placeholder ships.

Tabs 2–10 are unchanged. Tab 5 (Eng Estimates) keeps its component-level effort table — this Tab 1 estimate is intentionally a single high-level number, not a duplicate of that table.

## Testing
N/A — pure SKILL.md template + workflow-instruction edit, no runtime behavior in this repo. Verified by:
- `git diff --stat` shows only `skills/product-doc/SKILL.md` and `product-doc/04b-tech-plan.md`.
- Tab 1's `## What's Needed to Get Started` block now ends with `- **Effort Estimate:** [S/M/L/XL]`.
- Workflow intake list now contains the conditional effort-estimate bullet.
- Generate step now mentions both `[Company Name]` and `[S/M/L/XL]` substitution.

## Risks
- None — purely a template + workflow-instruction edit. No persistence change, no logic change in `.pm-stack/learnings.md`. Other 9 tabs unaffected. Existing one pagers already on disk are not back-filled.
