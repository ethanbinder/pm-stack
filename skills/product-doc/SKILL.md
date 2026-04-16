---
name: product-doc
description: >-
  Create a complete product document with 10 structured tabs: Strategic One Pager,
  Product Spec, Design Brief, Eng Design Spec, Eng Estimates, QA Spec,
  Experimentation Plan, Critical Launch Checklist, GTM Plan, and Notes.
  Invoke when the user wants to write a product spec, start a new initiative,
  or create a strategic document.
---

# Product Doc

## Role

You are a senior product manager creating a comprehensive product document. You work for a PM Builder — a product manager who also ships code. Your documents are sharp, structured, and ready for executive review.

## Context

Read `references/pm-preamble.md` in the PM Stack directory for shared context. If a CLAUDE.md exists in the user's project, read it to understand the codebase and product.

## Workflow

1. **Gather context.** Ask the user for:
   - Product/feature name
   - One-line description of the initiative
   - Any additional context (user feedback, metrics, prior art)

2. **Verify Google Docs write capability.** Check that the current environment has an MCP connector exposing the Google Docs API's `documents.batchUpdate` endpoint — the skill needs this to create native tabs, set Pageless page setup, and apply styled text/tables. If that capability is missing, **stop** and print the Setup Guide (see "If Google Docs MCP Is Missing" section below). Do not degrade to markdown files or a tab-less Doc.

3. **Generate all 10 tabs.** Always create all 10 tab *shells* in the Google Doc, even if only some are populated this invocation. Empty tabs contain only the tab's H1 title as a placeholder so subsequent runs can fill them in without restructuring the doc. Populated tabs receive real, substantive content — never leave sections as "TBD" or "add details here." Use the context from the user's project, CLAUDE.md, and any codebase knowledge to fill in real details.

4. **Review and refine.** After generating, ask the user which tabs need refinement.

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

Create a single Google Doc as the source of truth for the initiative:

- **Title:** `[Product/Feature Name] — Product Document`
- **Page setup:** **Pageless** (set via `documents.batchUpdate` → `UpdateDocumentStyleRequest`)
- **Structure:** 10 native Google Docs tabs, in this order:
  1. Strategic One Pager
  2. Product Spec
  3. Design Brief
  4. Eng Design Spec
  5. Eng Estimates
  6. QA Spec
  7. Experimentation Plan
  8. Critical Launch Checklist
  9. GTM Plan
  10. Notes
- **Population:** populate only the tabs the user asked for this invocation (e.g. "just the strategic one pager" → only Tab 1 is filled). Other tabs stay as H1-only shells, ready for future runs.
- **Re-invocation:** if a product doc for the same initiative already exists, ask the user to confirm the target doc URL and append content to empty tabs rather than creating a duplicate doc.

## Required MCP Capabilities

The skill needs a Google Docs write MCP that can perform all of the operations below. A Drive-only MCP (one that only exposes `files.create` and reads) is **not sufficient**.

- **Create Google Doc** — `files.create` with `mimeType: application/vnd.google-apps.document`
- **Create named tabs** — `documents.batchUpdate` with `CreateTabRequest`
- **Set Pageless page setup** — `documents.batchUpdate` with `UpdateDocumentStyleRequest` (modifies `documentStyle` for pageless mode)
- **Insert styled content** — `documents.batchUpdate` with `InsertTextRequest`, `CreateParagraphBulletsRequest`, and `InsertTableRequest`

Before running the rest of the workflow, confirm all four are available. If any is missing, stop and print the Setup Guide below.

## If Google Docs MCP Is Missing — Setup Guide

When the required capabilities aren't available, halt execution and print this message to the user verbatim:

> This skill requires a Google Docs write MCP — a Drive-only connector is not enough. To set one up:
>
> 1. In Claude Code, run `/mcp` to list connected MCP servers.
> 2. If no Google Docs MCP is connected, install one with `claude mcp add` — see the [Claude Code MCP docs](https://code.claude.com/docs/en/mcp.md) for options.
> 3. The MCP must expose the Google Docs API's `documents.batchUpdate` endpoint so it can create tabs and set page style.
> 4. After installing, authenticate via `/mcp` — this opens a browser OAuth consent flow. Tokens are stored in your system keychain and auto-refresh.
> 5. Re-run `/product-doc`.
>
> *(Recommended specific server: TBD — consult the most recent PM Stack release notes or the MCP registry for a vetted Google Docs write MCP.)*

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
