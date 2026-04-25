# Tech Plan: Add High-Level Requirements section + promote Metrics to H2

**Author**: Ethan Binder

**Objective**: Add a new `## High-Level Requirements` section to the Strategic One Pager between the Value subsections and Metrics, and promote Metrics from an H3 inside `## Goal` to its own top-level H2 section. The new section answers "what are we trying to build, and how does the end user interact with it?"

**PRD & Design Link**:

---

## Problem Statement
The Strategic One Pager had clean framing for *why* (Context, Problem, Vision), *value* (Goal → Value for End User / Value for [Company Name]), *measurement* (Metrics), and *asks/sizing* (What's Needed to Get Started). What was missing: a clear, dedicated section for *what we're actually building* — the high-level shape of the product/feature and how the end user interacts with it. Reviewers got value framing followed immediately by metrics, with no concrete description of the artifact in between. Additionally, Metrics was buried as a third H3 under Goal, which read awkwardly once Goal was reframed as a value-framing section in PR #37.

## Changes Made
- `skills/product-doc/SKILL.md` — Tab 1 template:
  - Removed `### Metrics` from inside `## Goal`. Goal now contains only the two `### Value for ...` subsections.
  - Inserted new `## High-Level Requirements` H2 between Goal and Metrics, with two question-form bullets: "What are we envisioning building? Clearly state what we're trying to build." and "How will the end user interact with this?"
  - Re-added Metrics as a top-level `## Metrics` H2, with the same three bullets as before (primary metric, secondary/guardrails, success criteria) — no content change, just promoted from H3 to H2.

Tabs 2–10 are unchanged. Workflow intake and Generate step are unchanged — the new section has no `[Placeholder]` and is populated from the existing intake (product/feature name, one-line description, additional context) plus CLAUDE.md / codebase knowledge per `## Workflow` step 5.

## Testing
N/A — pure SKILL.md template edit, no runtime behavior in this repo. Verified by:
- `git diff --stat` shows only `skills/product-doc/SKILL.md` and `product-doc/04b-tech-plan.md`.
- Tab 1 section order is now: Context → Problem → Vision → Goal → High-Level Requirements → Metrics → What's Needed to Get Started.
- Goal contains exactly two H3 subsections (Value for End User, Value for [Company Name]) — no `### Metrics` inside.
- New `## High-Level Requirements` H2 has two question-form bullets matching Tab 1's existing voice (cf. `## Problem`'s "What's broken today?" and `## Vision`'s "What does the world look like when this ships?").
- `## Metrics` H2 carries identical bullet copy to the prior `### Metrics`.

## Risks
- None — purely a template edit. No conditionals, no logic, no behavior shift. Other 9 tabs unaffected. Existing one pagers already on disk are not back-filled. The diff shape for downstream tooling (anything that grepped for `### Metrics` in generated one pagers) changes from H3 to H2; no known consumer in this repo relies on the heading level.
