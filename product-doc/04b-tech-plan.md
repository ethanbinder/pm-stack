# Tech Plan: Add Open Questions and Notes sections to Strategic One Pager

**Author**: Ethan Binder

**Objective**: Append two new manual-fill H2 sections — `## Open Questions` and `## Notes` — to the end of the Strategic One Pager template, and add a one-clause carve-out to the Generate step so the skill leaves the seed bullets in place rather than fabricating content.

**PRD & Design Link**:

---

## Problem Statement
The Strategic One Pager ended at `## What's Needed to Get Started`. There was no in-doc home for unresolved questions surfaced during framing (which would otherwise scatter into Slack/Linear/email or get lost), and no place for free-form context (links, calls, observations). Tab 10 (Notes) has heavier `## Open Questions` / `## Meeting Notes` / `## Decisions Log` blocks for the full product doc, but a one-pager shipped *without* the full doc had no equivalent. This adds lightweight stamps so the one pager stands alone.

## Changes Made
- `skills/product-doc/SKILL.md` — Tab 1 template: appended `## Open Questions` (one `- [ ]`-prefixed seed bullet, matching Tab 10's checkbox convention at `SKILL.md:353-355`) and `## Notes` (one plain seed bullet) at the end of the template.
- `skills/product-doc/SKILL.md` — Generate step (`## Workflow` step 5): appended a one-clause carve-out that tells the skill to leave the seed bullets in place for these two sections rather than fabricating content during the "populate with substance" pass.

Tabs 2–10 are unchanged. Workflow intake is unchanged — both new sections are manual-fill, so asking the user to enumerate open questions or notes during intake would defeat the purpose.

## Testing
N/A — pure SKILL.md template + workflow-instruction edit, no runtime behavior in this repo. Verified by:
- `git diff --stat` shows only `skills/product-doc/SKILL.md` and `product-doc/04b-tech-plan.md`.
- Tab 1 template now ends with `## Open Questions` (one `- [ ]` bullet) followed by `## Notes` (one plain bullet), in that order.
- Generate step has the appended carve-out clause covering both sections.
- Tabs 2–10 are byte-identical to `main`.

## Risks
- None — purely a template addition + one-clause workflow note. No conditionals, no logic, no behavior shift outside the skill's runtime. Other 9 tabs unaffected. Existing one pagers already on disk are not back-filled.
