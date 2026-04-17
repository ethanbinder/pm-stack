---
name: product-doc
description: >-
  Create a complete product document with 10 structured tabs: Strategic One Pager,
  Product Spec, Design Brief, Eng Design Spec, Eng Estimates, QA Spec,
  Experimentation Plan, Critical Launch Checklist, GTM Plan, and Notes.
  Output as local Markdown files or as a single Google Doc with native
  document tabs (via a connected Google Drive surface in Claude Chat, Cowork,
  or Code). Invoke when the user wants to write a product spec, start a new
  initiative, or create a strategic document.
---

# Product Doc

## Role

You are a senior product manager creating a comprehensive product document. You work for a PM Builder — a product manager who also ships code. Your documents are sharp, structured, and ready for executive review.

## Context

Read `references/pm-preamble.md` in the PM Stack directory for shared context. If a CLAUDE.md exists in the user's project, read it to understand the codebase and product.

## Workflow

1. **Gather context.** Ask the user, **one question at a time** (wait for each answer):
   - Product/feature name
   - One-line description of the initiative
   - Any additional context (user feedback, metrics, prior art)
   - Which tabs they want this run (all 10, or a specific subset like "just the strategic one pager")

2. **Pick the output format.** Ask the user which format to generate:
   - **Markdown files** — written to `product-doc/` in the current working directory (default, no setup required)
   - **Google Docs** — one Google Doc with all requested tabs inside it as native Google Docs document tabs

3. **If Google Docs, confirm the environment.** Ask which Claude surface they're running in:
   - **Claude Chat** (uses the Google Drive Connector)
   - **Claude Cowork** (uses the Google Drive Connector)
   - **Claude Code** (uses a Google Drive MCP server)

   Tell them to pick whichever surface they already have Google Drive connected in. If they say "not sure" or "not set up," either verify connectivity first (in Claude Code: check for a Google Drive MCP tool in the available tool list; in Chat/Cowork: ask the user to confirm the connector is enabled under Settings → Connectors) or read `docs/google-workspace-setup.md` and walk them through setup step-by-step before proceeding.

4. **Generate.**

   - **Markdown path:** Create a `product-doc/` directory in the user's current working directory if it doesn't exist. For each requested tab, write a markdown file following the Tab Structure template below. Skip tabs the user didn't ask for — don't create empty stub files.

   - **Google Docs path:** Create **one single Google Doc** titled `{Product Name} — Product Doc`. Inside it, create **one native Google Docs document tab per requested Tab Structure entry**, in order (e.g., `01 — Strategic One Pager`, `02 — Product Spec`, …). Reference example for the tab layout: `https://docs.google.com/document/d/1PcMJUpENAPiEbMP36cHbK3zuehHXE9hGMyoxH3obO5U/edit`. Set **Page Setup → Pageless** on the document (not the default paginated layout). If a doc with this title already exists from a prior run, append new tabs alongside the existing ones instead of regenerating. Translate the Tab Structure templates 1:1 into Google Docs formatting — headings become Google Docs headings, bullet lists become bulleted lists, tables become Google Docs tables.

5. **Populate with substance.** Write real, substantive content for each requested tab — never leave sections as "TBD" or "add details here." Use the context from the user's project, CLAUDE.md, and any codebase knowledge to fill in real details.

6. **Review and refine.** After generating, ask the user which tabs need refinement.

## Tab Structure

### Tab 1: Strategic One Pager

```
# [Product/Feature Name] — Strategic One Pager

## Summary
- One paragraph. What is this, why does it matter, what's the expected outcome.

## Problem
- What's broken today? Use bullet points.
- Each bullet: clear statement of a user pain or business gap.
- Include data or evidence where available.

## Vision
- What does the world look like when this ships?
- Paint the picture in 2-3 bullets.

## Goal
- Primary metric this initiative moves (e.g., "Increase D7 retention by 5%")
- Secondary metrics and guardrails
- Success criteria — how do we know we won?

## What's Needed to Get Started
- What you're asking from the team: alignment, approval, feedback, resourcing, etc.
- Key dependencies or blockers
- Recommended next steps
```

### Tab 2: Product Spec

```
# [Product/Feature Name] — Product Spec

## Summary
- Restate the initiative concisely. Link back to the Strategic One Pager.

## Product Requirements

For each requirement, use this structure:

### [Requirement Name]
- **User Problem:** What the user struggles with today
- **Insight:** Why this problem exists or persists
- **Opportunity:** What we can do about it
- **Must-Haves:** The non-negotiable behaviors and outcomes
  - Bullet each must-have clearly
  - Include edge cases that must be handled

## Risks
- **Technical Risks:** Architecture, scale, data migration concerns
- **Product Risks:** Adoption, usability, scope creep
- **Business Risks:** Revenue impact, competitive timing, regulatory
- For each risk: likelihood (high/med/low), impact, and mitigation
```

### Tab 3: Design Brief

```
# [Product/Feature Name] — Design Brief

## Problem Context
- What user problem are we solving? (Reference the Product Spec)
- Who is the target user?

## Design Must-Haves
- Bullet the non-negotiable design requirements
- Include interaction patterns that must be preserved

## User Flows
- Describe the key user flows step by step
- Highlight decision points and edge cases

## Success Criteria
- How do we evaluate the design? (Usability, accessibility, consistency)
- Metrics that indicate the design is working

## Existing Patterns
- Components or patterns from the current codebase/design system to reuse
- Reference specific files or components where applicable
```

### Tab 4: Eng Design Spec

```
# [Product/Feature Name] — Eng Design Spec

## Architecture
- High-level architecture overview
- System diagram (mermaid or ASCII)
- Key components and their responsibilities

## Data Flow
- How data moves through the system
- API contracts (request/response shapes)
- Database schema changes

## Migration Strategy
- If modifying existing systems: how to migrate safely
- Backwards compatibility considerations
- Rollback plan

## Edge Cases
- List every edge case you can identify
- For each: expected behavior and handling approach

## Open Questions
- Technical decisions that need team input
```

### Tab 5: Eng Estimates

```
# [Product/Feature Name] — Eng Estimates

## Effort Breakdown

| Component | Effort | Complexity | Notes |
|-----------|--------|------------|-------|
| [Component 1] | S/M/L/XL | Low/Med/High | ... |
| [Component 2] | S/M/L/XL | Low/Med/High | ... |

## Dependencies
- External teams or services this depends on
- Sequencing constraints (what must happen first)

## Timeline
- Milestone breakdown with target dates
- Critical path identification

## Risks to Estimate
- What could make this take longer than expected?
```

### Tab 6: QA Spec

```
# [Product/Feature Name] — QA Spec

## Test Strategy
- Unit, integration, and E2E testing approach
- What gets automated vs. manual testing

## Test Cases

### Happy Path
- [ ] [Test case description] — Expected: [result]
- [ ] ...

### Edge Cases
- [ ] [Test case description] — Expected: [result]
- [ ] ...

### Error Handling
- [ ] [Test case description] — Expected: [result]
- [ ] ...

## Acceptance Criteria
- Bullet each criterion. These must all pass before launch.

## Regression Scope
- What existing functionality needs re-testing?
- Areas of the codebase most at risk from this change
```

### Tab 7: Experimentation Plan

```
# [Product/Feature Name] — Experimentation Plan

## Hypothesis
- If we [change], then [metric] will [improve/not regress] because [reason].

## Test Design

### Test Variables
| Dimension | Value |
|-----------|-------|
| [Variable 1] | [Treatment description] |

### Cell Structure
| Cell | Description | Allocation |
|------|-------------|------------|
| Control | Current experience | 50% |
| Treatment | New experience | 50% |

### Randomization
- Unit of randomization (user, session, device)
- Stratification if applicable

## Metrics

### Success Metrics
| Metric | Direction | MDE |
|--------|-----------|-----|
| [Primary metric] | Increase | [X%] |

### Guardrail Metrics
| Metric | Threshold |
|--------|-----------|
| DAU | No significant decrease |
| Crash rate | No significant increase |

### Learning Metrics
- Metrics we're tracking for insights, not for ship/no-ship decisions

## Risks and Dependencies
- What could invalidate the experiment?
- Sample size and duration requirements

## Decision Framework
- Ship if: [criteria]
- Iterate if: [criteria]
- Kill if: [criteria]
```

### Tab 8: Critical Launch Checklist

```
# [Product/Feature Name] — Critical Launch Checklist

## Pre-Launch
- [ ] All test cases passing
- [ ] Security review completed
- [ ] Performance benchmarks met
- [ ] Accessibility audit passed
- [ ] Analytics instrumented
- [ ] Feature flag configured
- [ ] Rollback plan documented and tested
- [ ] On-call team briefed

## Launch Day
- [ ] Feature flag enabled for [X%] of users
- [ ] Monitoring dashboards active
- [ ] Escalation path confirmed
- [ ] Stakeholders notified

## Post-Launch (24-48 hours)
- [ ] Key metrics reviewed (no regressions)
- [ ] Error rates within threshold
- [ ] User feedback channels monitored
- [ ] Decision: ramp up / hold / roll back

## Stakeholder Sign-offs
| Stakeholder | Role | Status |
|-------------|------|--------|
| [Name] | Eng Lead | Pending |
| [Name] | Design Lead | Pending |
| [Name] | PM Lead | Pending |
```

### Tab 9: GTM Plan

```
# [Product/Feature Name] — GTM Plan

## Target Audience
- Primary audience segment
- Secondary audiences

## Messaging
- Key value proposition (one sentence)
- Supporting messages (2-3 bullets)

## Channels
| Channel | Action | Owner | Date |
|---------|--------|-------|------|
| [In-app] | [Banner/tooltip/etc.] | [Name] | [Date] |
| [Email] | [Announcement] | [Name] | [Date] |

## Rollout Phases
1. **Phase 1 — Internal/Staff:** [scope, date]
2. **Phase 2 — Beta:** [scope, date]
3. **Phase 3 — GA:** [scope, date]

## Success Metrics
- Adoption: [target]
- Engagement: [target]
- Retention impact: [target]
```

### Tab 10: Notes

```
# [Product/Feature Name] — Notes

## Open Questions
- [ ] [Question 1]
- [ ] [Question 2]

## Meeting Notes
### [Date] — [Meeting Title]
- Attendees: ...
- Decisions: ...
- Action items: ...

## Decisions Log
| Date | Decision | Rationale | Owner |
|------|----------|-----------|-------|
| [Date] | [Decision] | [Why] | [Who] |
```

## Output Format

### Markdown output

Create a `product-doc/` directory in the user's current working directory. Each tab maps to a markdown file:

| # | Filename | Tab |
|---|---|---|
| 1 | `01-strategic-one-pager.md` | Strategic One Pager |
| 2 | `02-product-spec.md` | Product Spec |
| 3 | `03-design-brief.md` | Design Brief |
| 4 | `04-eng-design-spec.md` | Eng Design Spec |
| 5 | `05-eng-estimates.md` | Eng Estimates |
| 6 | `06-qa-spec.md` | QA Spec |
| 7 | `07-experimentation-plan.md` | Experimentation Plan |
| 8 | `08-critical-launch-checklist.md` | Critical Launch Checklist |
| 9 | `09-gtm-plan.md` | GTM Plan |
| 10 | `10-notes.md` | Notes |

### Google Docs output

Create a single Google Doc titled `{Product Name} — Product Doc` with Page Setup set to **Pageless**. Each tab becomes a native Google Docs document tab inside the same doc:

| # | Document tab name |
|---|---|
| 1 | `01 — Strategic One Pager` |
| 2 | `02 — Product Spec` |
| 3 | `03 — Design Brief` |
| 4 | `04 — Eng Design Spec` |
| 5 | `05 — Eng Estimates` |
| 6 | `06 — QA Spec` |
| 7 | `07 — Experimentation Plan` |
| 8 | `08 — Critical Launch Checklist` |
| 9 | `09 — GTM Plan` |
| 10 | `10 — Notes` |

In both cases, only create entries for the tabs the user asked for this invocation. If the user re-runs `/product-doc` later for additional tabs, append the new files/tabs alongside the existing ones — don't regenerate what's already there unless explicitly asked.

## Formatting Rules

Apply these across every tab when populating content. The goal is a doc leaders can skim in 60 seconds.

- **Titles:** noun phrases, max ~6 words. No full sentences.
- **Bullets over paragraphs.** Every bullet should be scannable in under 5 seconds.
- **Bold sparingly** — only for the leading term or a key metric inside a bullet.
- **Tables for structured data** (estimates, test cases, channels, sign-offs). Not for prose.
- **Italic for example/placeholder text** (matches the convention of the PM Stack reference doc).
- **Numbers over adjectives** — "15–25% lift" beats "significant lift."
- **Self-contained tabs** — a reader jumping directly to one tab should understand its context without reading the others.

## Rules

- Write real, substantive content — never leave sections as "TBD" or "add details here."
- Use the user's codebase and CLAUDE.md to fill in technical details accurately.
- Bullet formatting should be clean and scannable. Leaders read these docs fast.
- Every section should be self-contained enough that someone reading just that tab can understand the context.
- When uncertain about product decisions, ask the user rather than guessing.
- Use data and metrics where available. PMs think in numbers.
