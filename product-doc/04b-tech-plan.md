# Tech Plan: Refresh Strategic One Pager top-of-doc

**Author**: Ethan Binder

**Objective**: Update the `/product-doc` Strategic One Pager template (Tab 1) so every generated one pager opens with `**Title:**` and `**Contributors:**` metadata, and so the first content section reads `## Context` instead of `## Summary`.

**PRD & Design Link**:

---

## Problem Statement
The `/product-doc` Strategic One Pager template opens with an H1 derived from `[Product/Feature Name]` and jumps straight into `## Summary`. There's no field for a working title distinct from the product name, and no field for tagging contributors — both routinely needed when a one pager gets shared, reviewed, or reused across teams. The leading `## Summary` heading also reads as a recap when the section is actually framing/setup; `## Context` describes the section's role more accurately.

## Changes Made
- `skills/product-doc/SKILL.md` — Tab 1 template: insert `**Title:** [insert title]` and `**Contributors:** [tag contributors]` between the H1 and the first content section. Tabs 2–10 unchanged.
- `skills/product-doc/SKILL.md` — Tab 1 template: rename `## Summary` to `## Context`. The bullet underneath ("What is this, why does it matter, what's the expected outcome") is unchanged.

## Testing
N/A — single-file template / wording change in a SKILL.md, no runtime behavior. Verified by:
- `git diff` shows only `skills/product-doc/SKILL.md` (template change) and `product-doc/04b-tech-plan.md` (this file).
- The Tab 1 template now reads `**Title:** [insert title]` and `**Contributors:** [tag contributors]` directly under the H1, followed by `## Context`.

## Risks
- None — purely a template edit. No conditionals, no logic, no behavior shift. Other 9 tabs unaffected. Existing one pagers already on disk are not rewritten; the change only affects net-new docs generated after this ships.
