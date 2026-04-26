# Tech Plan: Add OK2Ship Confluence template + wire `/product-doc` Tab 8

**Author**: Ethan Binder

**Objective**: Add a polished, generalized Confluence template for an OK2Ship / Critical-Launch-Checklist (Tab 8 of `/product-doc`) and extend `/product-doc`'s Confluence output path so users can publish a Tab 8 page via the `confluence` CLI alongside the existing Tab 2 (Product Spec) and Tab 7 (Experimentation Plan) pages.

**PRD & Design Link**:

---

## Problem Statement

`/product-doc`'s Confluence output now handles Tab 2 (Product Spec) and Tab 7 (Experimentation Plan, in the prior PR). Launch readiness still has to be hand-built in the tracker. Adding a generalized OK2Ship template + wiring it into the Confluence path lets `/product-doc` publish Tab 8 with the same one-shot polish — without baking any single company's identity into the template.

## Changes Made

- **`references/confluence-ok2ship-template.md`** (new) — generic OK2Ship template. Sections: Feature Summary (with beta-status questions) · Links (Product Spec, Figma, Tech Plan, tracker tickets) · status blocks each with a reviewer table for QA, Design QA, AI, Security, Privacy, Customer Support · Accounting · Survey Results (with `[Company Name]` placeholder in the rating-criteria column) · Analytics / Metric Tracking · Load Testing / Scalability · Stakeholder Checkpoints · Release Schedule (Minimum app build, Minimum hardware / firmware version) · Appendix · Approvals table (Product / Engineering / Data Science / Growth approvers, all blanked) · PM Stack attribution footer. Every default human name is blanked; every internal-tool URL stripped; every `mailto:` replaced with a generic placeholder.
- **`skills/product-doc/SKILL.md`** — Confluence path extended from "Tabs 2 and 7" (the prior PR's framework) to "Tabs 2, 7, and 8 (one page each)." Adds a new row to the per-tab template + title mapping for Tab 8 with title `<Product Name> — OK2Ship`. Adds Tab 8 populate-time substitution: ground Feature Summary from One Pager High-Level Requirements; pre-fill the Links block with local Product Spec / Tech Plan / Figma references; substitute `[Company Name]` in the Survey Results header from the persisted `Company:` learning when it exists; leave reviewer / approver cells blank for the writer to fill in.
- **`README.md`** — workflow row at line 27 now reads "for the Product Spec, Experimentation Plan, and Critical Launch Checklist (OK2Ship) specifically." Per-skill description in the `/product-doc` block enumerates the new template's section roster and its file path, in lockstep.

## Testing

N/A — template / skill-doc change, no runtime behavior. Manual smoke tests after merge: (1) run `/product-doc` for a dummy initiative requesting Tab 2 + Tab 7 + Tab 8 on the Confluence path; confirm three pages get created in the same space under the same parent (Product Spec + Experimentation Plan + OK2Ship). (2) Re-run for Tab 8 only; confirm a single OK2Ship page is created with reviewer placeholder rows blanked. (3) Grep the new template for any company-specific terms (default platform names, default human names, internal-tool URLs, `mailto:` addresses) and confirm zero hits.

## Risks

- **PR depends on the prior A/B Test Confluence PR landing first.** This branch is based on that PR (which itself depends on the Confluence Product Spec generalization PR). The chain is: Product Spec generalization → A/B Test → OK2Ship. After the prior PR merges to `main`, GitHub auto-retargets this PR's base. If the prior PR is closed, this PR's `SKILL.md` and `README.md` diffs may conflict and need a rebase.
