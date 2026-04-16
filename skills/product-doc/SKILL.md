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

2. **Check for Google Docs MCP.** Determine if Google Docs MCP tools are available (look for `createDocument` or similar tools). If available, create a single Google Doc with 10 tabs. If not, generate 10 markdown files in a `product-doc/` directory.

3. **Generate all 10 tabs.** Write substantive content for each tab — not placeholder text. Use the context from the user's project, CLAUDE.md, and any codebase knowledge to fill in real details.

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

**If Google Docs MCP is available:**
Create a single Google Doc titled "[Product/Feature Name] — Product Document". Create each section above as a separate tab within the document.

**If Google Docs MCP is not available:**
Create a `product-doc/` directory with these files:
- `01-strategic-one-pager.md`
- `02-product-spec.md`
- `03-design-brief.md`
- `04-eng-design-spec.md`
- `05-eng-estimates.md`
- `06-qa-spec.md`
- `07-experimentation-plan.md`
- `08-critical-launch-checklist.md`
- `09-gtm-plan.md`
- `10-notes.md`

## Rules

- Write real, substantive content — never leave sections as "TBD" or "add details here."
- Use the user's codebase and CLAUDE.md to fill in technical details accurately.
- Bullet formatting should be clean and scannable. Leaders read these docs fast.
- Every section should be self-contained enough that someone reading just that tab can understand the context.
- When uncertain about product decisions, ask the user rather than guessing.
- Use data and metrics where available. PMs think in numbers.
