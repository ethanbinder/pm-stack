# Tech Plan: Add A/B Test Confluence template + wire `/product-doc` Tab 7

**Author**: Ethan Binder

**Objective**: Add a polished, generalized Confluence template for A/B test plans (Experimentation Plan, Tab 7 of `/product-doc`) and extend `/product-doc`'s Confluence output path so users can publish a Tab 7 page via the `confluence` CLI alongside the existing Tab 2 (Product Spec) page. Lays the multi-tab Confluence framework that subsequent PRs (agentic A/B variant; OK2Ship for Tab 8) will build on.

**PRD & Design Link**:

---

## Problem Statement

`/product-doc`'s Confluence output today only handles Tab 2 (Product Spec). PMs who run experiments still have to hand-build the Experimentation Plan in their tracker. Adding a generalized A/B-test template + wiring it into the Confluence path lets `/product-doc` publish Tab 7 with the same one-shot polish we get for Tab 2 — without baking any single company's identity into the template.

## Changes Made

- **`references/confluence-ab-test-template.md`** (new) — generic, polished A/B-test plan template. Sections: Overview · Step 1 Proposal (with public Medium reference) · Step 2 Test Scope (Must / Nice / Not In Scope across Product · Analytics · Software · Other Contributors) · Step 3 Test Design + Build (Variants, User Enrollment, Enrollment vs Entry Points, Experiment Assignment) · Step 4 Test Details (Duration & Sample Sizing, Measurement, Go/No-Go, Data Quality, Tracking) · Reviews table · Study Wrap Up · Standardized Read-out · Final Action Items · PM Stack attribution footer. All platform / tooling / human references are bracketed placeholders or generic prose so any company can use it.
- **`skills/product-doc/SKILL.md`** — extends the Confluence path from "Tab 2 only" to "Tabs 2 and 7 (one page each)." Adds a per-tab template-and-title mapping table inside the Confluence-path generate step; adds Tab 7 populate-time grounding (Hypothesis from One Pager Vision, Primary Metric from One Pager Metrics, variant scope from Product Spec Requirements). Adds an explicit note that the same `space-key` and `parent-id` apply across all Confluence pages created in a single run.
- **`README.md`** — workflow row at line 27 now reads "for the Product Spec and Experimentation Plan specifically" (was "Product Spec specifically"). Per-skill description in the `/product-doc` block enumerates the new template's section roster and its file path, in lockstep with the SKILL.md change.

## Testing

N/A — template / skill-doc change, no runtime behavior. Manual smoke tests after merge: (1) run `/product-doc` for a dummy initiative requesting Tab 2 + Tab 7 on the Confluence path; confirm two Confluence pages get created (Product Spec + Experimentation Plan), each with their template's structure, in the same space under the same parent. (2) Re-run for Tab 7 only; confirm a single Experimentation Plan page is created. (3) Grep the new template for any company-specific terms (default platform names, default human names, internal-tool URLs) and confirm zero hits.

## Risks

- **PR depends on the prior Confluence Product Spec generalization PR landing first.** This branch is based on that PR to avoid a `README.md` merge conflict on the per-skill description block. If the prior PR is closed without merging, this PR's README diff may conflict and need a rebase.
