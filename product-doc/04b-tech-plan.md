# Tech Plan: Add Title + Contributors metadata to Strategic One Pager

**Author**: Ethan Binder

**Objective**: Add `**Title:**` and `**Contributors:**` metadata lines to the top of the `/product-doc` Strategic One Pager template (Tab 1) so every generated one pager carries a clear working title and contributor attribution.

**PRD & Design Link**:

---

## Problem Statement
The `/product-doc` Strategic One Pager template opens with an H1 derived from `[Product/Feature Name]` and jumps straight into `## Summary`. There's no field for a working title distinct from the product name, and no field for tagging contributors — both routinely needed when a one pager gets shared, reviewed, or reused across teams.

## Changes Made
- `skills/product-doc/SKILL.md` — Tab 1 template: insert `**Title:** [insert title]` and `**Contributors:** [tag contributors]` between the H1 and `## Summary`. Tabs 2–10 unchanged.

## Testing
N/A — single-file template / wording change in a SKILL.md, no runtime behavior. Verified by:
- `git diff` shows only `skills/product-doc/SKILL.md`, +3 / −0 lines (two metadata lines + one blank line).
- The Tab 1 template now reads `**Title:** [insert title]` and `**Contributors:** [tag contributors]` directly under the H1, before `## Summary`.

## Risks
- None — purely a template addition. No conditionals, no logic, no behavior shift. Other 9 tabs unaffected.
