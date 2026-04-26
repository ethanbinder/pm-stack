# Tech Plan: Generalize Confluence Product Spec template to match polished PRD format

**Author**: Ethan Binder

**Objective**: Replace `references/confluence-product-spec-template.md` with a generalized version that visually matches a polished tracker-PRD layout — same section order, single-column key/value tables, `+++` collapsible guidance blocks, MLP / In-Scope / Bonus / Out-of-Scope row categorization, and a Plan/Tier Availability + Region/Localization layout — but stripped of any single company's identity so PM Stack users at any company can produce specs that look the same shape.

**PRD & Design Link**:

---

## Problem Statement

The current Confluence Product Spec template renders as a passable spec, but it's structurally lighter than the polished PRD layout PM Builders are used to seeing in their tracker — Overview key/value table, expand/collapse guidance blocks, a 5-column Requirements table with In-Scope / Out-of-Scope / Bonus category rows, and a Plan/Tier Availability matrix. We want generated Confluence specs to match that polish out of the box, without baking any single company's identity into the repo template.

## Changes Made

- **`references/confluence-product-spec-template.md`** — full rewrite. Section order now: Overview · Assumptions & Constraints · Product Overview · User Stories (`+++` collapsible guidance + 5-col MLP table with In-Scope / Out-of-Scope / Bonus rows under Onboarding / All States / AI Assistant section dividers) · Designs & Copy · Notes for Execution · Dependencies · Plan / Tier Availability · Region/Localization callout · Stakeholders · Reporting · Data Requirements / Privacy · Notes/Open Questions · Spec Approval(s) · Footer. All identity is generic: `[Company Name]`-style placeholders, "User" not "Member", no default OKR / stakeholder / approver names, no device/SKU/team-acronym specifics. `+++ ... +++` collapsibles replace `>` blockquote intros so Confluence renders expand/collapse macros. PM Stack attribution footer preserved.
- **`README.md`** — one-line touch-up at line 109. The per-skill description for `/product-doc` now lists the new section roster (User Stories collapsible · Plan/Tier Availability · Region/Localization · the rest) so README stays in lockstep with the template per `CLAUDE.md`.

## Testing

N/A — template / docs change, no runtime behavior. Manual smoke tests after merge: (1) run `/product-doc` for a dummy initiative on the Confluence path, confirm the rendered Confluence page shows the Overview key/value table, the `+++` expand/collapse blocks, the 5-col Requirements table with category-row dividers, and the empty Plan/Tier Availability table; (2) grep `references/confluence-product-spec-template.md` for any company-specific terms (default OKR names, default stakeholder/approver human names, internal team acronyms, internal-tool URLs) and confirm zero hits.

## Risks
