# Tech Plan: Allow video clips in /release Before/After sections

**Author**: Ethan Binder

**Objective**: Update the `/release` PR body template so the Before/After placeholder explicitly invites a video clip, not only a screenshot.

**PRD & Design Link**:

---

## Problem Statement
The `### Before` / `### After` placeholders in `/release`'s PR body template say `[Insert Screenshot]`, which implicitly steers users toward a static image even when a short video clip would be the better way to show the change (e.g. animations, multi-step UI flows, hover/transition states).

## Changes Made
- `skills/release/SKILL.md` — both `### Before` and `### After` placeholders updated from `[Insert Screenshot]` to `[Insert Screenshot / Video]`.
- `skills/release/SKILL.md` — Rules entry "Before/After are visual-only" extended to call out video clips alongside screenshots and side-by-side snippets/diffs, so the rule and the placeholder stay coherent.

## Testing
N/A — single-file template / wording change in a SKILL.md, no runtime behavior. Verified by:
- `git diff` shows only `skills/release/SKILL.md`, +3 / −3 lines.
- The two placeholder occurrences in the template now read `[Insert Screenshot / Video]`.
- The Rules entry now reads "Drop a screenshot, a short video clip, or a side-by-side snippet/diff..."

## Risks
- None — purely a placeholder/wording change. No conditionals, no logic, no behavior shift.
