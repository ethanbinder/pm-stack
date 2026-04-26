# Tech Plan: Add Agentic A/B Test Confluence template + Tab 7 variant choice

**Author**: Ethan Binder

**Objective**: Add a polished, generalized Confluence template for **agentic** A/B experimentation (AI-agent / model evals) as an alternative for `/product-doc` Tab 7, and wire an intake question that lets the user pick between the general A/B test template and the agentic variant when generating Tab 7 on the Confluence path. Built on top of the prior PR's "Tabs 2 + 7" framework.

**PRD & Design Link**:

---

## Problem Statement

Tab 7's Confluence template (added in the prior PR) covers a general product A/B test but isn't tuned for AI / agent experiments — those have a leaner shape (no scope step, fewer roles), AI-specific guardrails, and a results read-out with agent-iteration framing. Adding a second template + a single intake choice keeps PMs running agent experiments off the hand-build path while preserving the simpler general flow as the default.

## Changes Made

- **`references/confluence-ab-test-agentic-template.md`** (new) — generic agentic experimentation template. Sections: INFO callout · Overview (Driver, Analyst, Impacted Teams) · Step 1 Hypothesis & Success (with public Medium reference) · Step 2 Experiment Details (Experiment Name, Variants, Enrollment vs Entry Points) · Step 3 Measurement & Observability (Experimentation platform + Analytics workspace tracking) · Reviews · Step 4 Experiment Results & Learnings (TLDR, Learnings, Recommendation, Next Steps, Key Dates, Key Links) · Final Action Items · PM Stack attribution footer. Internal AI-platform names and default human reviewer names stripped; AI-specific example metrics (Thumbs-Up Rate, User Messages, Messages per Conversation, Latency, Cache Rate) preserved as **italicized examples** so any team can use them as reasonable starting guardrails.
- **`skills/product-doc/SKILL.md`** — extends the Tab 7 row in the per-tab template + title mapping into two rows (general / agentic), each pointing at its template. Adds an intake choice block right above the Tab 7 populate-time substitution section: registry id `product-doc-ab-test-variant`, two-way door, default `general`. Honors the existing `never-ask` flow — auto-decides to general with the standard auto-decided announcement and respects the standard tune hint.
- **`references/question-registry.md`** — new row for `product-doc-ab-test-variant` (product-doc skill, two-way, default `general`, offers tune hint).
- **`README.md`** — per-skill description for `/product-doc` updated in lockstep: Tab 7 now reads "uses one of two templates" with the general / agentic split called out, including the `/memory tune` silence instruction.

## Testing

N/A — template / skill-doc / registry change, no runtime behavior. Manual smoke tests after merge: (1) run `/product-doc` for a dummy initiative requesting Tab 7 on the Confluence path; confirm the variant question fires once, the chosen template's structure renders correctly, and the page title carries the `(Agentic)` suffix when agentic is picked. (2) Set `tune: never-ask` for `product-doc-ab-test-variant` and re-run; confirm the auto-decided announcement appears and the general template is used. (3) Grep the new template for any company-specific terms (default platform names, default human names, internal-tool URLs) and confirm zero hits.

## Risks

- **PR depends on the prior A/B Test Confluence PR landing first.** This branch is based on that PR (which itself depends on the Confluence Product Spec generalization PR). The merge order is: Product Spec generalization → A/B Test (Tab 7 framework) → this PR. After the prior PR merges to `main`, GitHub auto-retargets this PR's base.
- **Coupling to the OK2Ship PR.** The OK2Ship PR (Tab 8) is a sibling stacked on the same A/B Test base. Either can merge first; whichever merges second will rebase cleanly onto the other since they touch different SKILL.md sections (Tab 7 variant vs Tab 8 wiring) and different README sentences (Tab 7 variant note vs Tab 8 enumeration).
