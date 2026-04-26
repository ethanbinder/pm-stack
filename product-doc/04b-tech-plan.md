# Tech Plan: Define the S/M/L/XL effort scale

**Author**: Ethan Binder

**Objective**: Anchor the Strategic One Pager's Effort Estimate to concrete calendar-time bounds (scoped to a 1–2 SWE staffing assumption), surface the scale at intake so the user picks informedly, and substitute the size letter *plus* its descriptor into the rendered doc so reviewers don't need a separate legend.

**PRD & Design Link**:

---

## Problem Statement
PR #38 added an `**Effort Estimate:** [S/M/L/XL]` bullet to the Strategic One Pager and an intake question to populate it, but never *defined* what the four sizes meant. The user typed a letter without a scale; reviewers read a letter without context. Anchoring the scale to "1–2 SWEs" calendar time turns it from a guess into a meaningful signal:

- **S** — days for 1–2 SWEs (<5 days)
- **M** — weeks for 1–2 SWEs (<8 weeks)
- **L** — months for 1–2 SWEs (<6 months)
- **XL** — more than 6 months for 1–2 SWEs

## Changes Made
- `skills/product-doc/SKILL.md` (line 31, Effort estimate intake bullet) — extended the *Phrasing:* sub-clause to render the four scale definitions on the lines after the question, so the user sees the scale next to the prompt.
- `skills/product-doc/SKILL.md` (line 50, Generate step) — expanded the `[S/M/L/XL]` substitution rule with the four `<key>` → `<key> (<descriptor>)` mappings. The rendered doc now shows e.g. `**Effort Estimate:** M (weeks for 1–2 SWEs, <8 weeks)` instead of just `**Effort Estimate:** M`. The skip-fallback ("leave the literal placeholder if unknown") is unchanged.

Tab 1 template (`- **Effort Estimate:** [S/M/L/XL]`) is intentionally untouched. The descriptor is added at substitution time, not baked into the placeholder, to keep the unsubstituted form short and scan-able. Tabs 2–10 are unchanged. The Tab 5 Eng Estimates effort table also uses S/M/L/XL but at the per-component level — a different shape, intentionally not rescoped here.

## Testing
N/A — pure SKILL.md instruction edit, no runtime behavior in this repo. Verified by:
- `git diff --stat` shows only `skills/product-doc/SKILL.md` (+2 lines, net) and `product-doc/04b-tech-plan.md`.
- The Effort estimate intake bullet now contains the four `S/M/L/XL` scale definitions inline.
- The Generate step now spells out the four `<key>` → `<key> (<descriptor>)` mappings.
- The Tab 1 template (`- **Effort Estimate:** [S/M/L/XL]`) is byte-identical to `main`.

## Risks
- None — purely an instruction edit. No conditionals or logic outside the skill's runtime. Existing one pagers already on disk are not back-filled (they keep the bare size letter without the descriptor); only net-new docs generated after this ships will carry the descriptor. Tab 5's per-component effort sizing is unaffected.
