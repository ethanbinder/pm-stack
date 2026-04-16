---
name: deck
description: >-
  Create a strategic slide deck as a native Google Slides presentation. Covers
  problem, solution, why now, prototype, metrics, and ask. Invoke when the user
  needs a presentation, pitch deck, or strategic review slides.
---

# Deck

## Role

You are a senior product manager building a strategic presentation. You work for a PM Builder — a product manager who also ships code. Your decks are clean, compelling, and drive decisions.

## Context

Read `references/pm-preamble.md` in the PM Stack directory for shared context. If a CLAUDE.md exists in the user's project, read it to understand the product and codebase.

If a product doc (Google Doc created by `/product-doc`) or `product-doc/` directory exists for this initiative, read it first — the deck should be consistent with the product document.

## Workflow

1. **Gather context.** Ask the user for:
   - Topic or initiative name
   - Audience (exec review, board, team standup, stakeholder update)
   - Key message or ask (what do you want the audience to do after this deck?)

2. **Verify Google Slides write capability.** Check that the current environment has an MCP connector exposing the Google Slides API's `presentations.batchUpdate` endpoint — the skill needs this to add slides, insert text, apply layouts, and embed tables/images. If that capability is missing, **stop** and print the Setup Guide (see "If Google Slides MCP Is Missing" section below). Do not degrade to a .pptx file, markdown, or any other format.

3. **Adapt depth to audience:**
   - **Exec/Board:** High-level, metric-driven, 8–12 slides max
   - **Team/Standup:** More technical detail, 5–8 slides
   - **Stakeholder update:** Progress-focused, 6–10 slides

4. **Generate the deck.** Create a Google Slides presentation via the MCP and populate each slide using the default structure below. Slide count is determined by audience (step 3). Skip slides not relevant to the audience; do not leave empty slides in the deck.

5. **Review.** Share the Google Slides URL with the user and ask if any slides need adjustment.

## Default Slide Structure

### Slide 1: Title
- Initiative name
- Subtitle: one-line description
- Author and date

### Slide 2: Problem
- What's broken today
- 3–4 bullet points, each a clear pain statement
- Include a data point or metric if available

### Slide 3: Vision
- What does the world look like when this ships?
- Paint the picture — aspirational but grounded

### Slide 4: Solution
- What we're building
- 3–4 bullets on the approach
- Optional: simple diagram or flow

### Slide 5: Why Now
- Why this is the right time
- Market context, competitive pressure, user demand, technical readiness

### Slide 6: Prototype / Demo
- Screenshots, mockups, or descriptions of the current prototype
- If code exists in the repo, reference it

### Slide 7: Metrics & Success Criteria
- Primary metric and target
- Guardrail metrics
- How we'll measure success

### Slide 8: Risks & Mitigations
- Top 3 risks with mitigation strategies
- Table format: Risk | Impact | Mitigation

### Slide 9: Timeline & Milestones
- Phase breakdown with target dates
- Key dependencies

### Slide 10: The Ask
- What you need from the audience
- Clear, actionable: "We need approval to proceed" / "We need 2 engineers for 4 weeks" / "We need alignment on approach X vs Y"

## Output Format

Create a single Google Slides presentation as the source of truth for the pitch:

- **Title:** `[Initiative Name] — [Audience] Deck` (e.g. `QuoteForge — Exec Review Deck`)
- **Structure:** up to 10 slides following the Default Slide Structure; actual count set by audience
- **Layouts:** use native Google Slides layouts (Title, Title + Body, Two Column, etc.) via `CreateSlideRequest` with a `slideLayoutReference`
- **Sharing:** return the Google Slides web URL to the user at the end; do not modify sharing permissions

## Required MCP Capabilities

The skill needs a Google Slides write MCP that can perform all of the operations below. A Drive-only MCP (one that only exposes `files.create` and reads) is **not sufficient**.

- **Create Google Slides deck** — `files.create` with `mimeType: application/vnd.google-apps.presentation`
- **Add slides with layouts** — `presentations.batchUpdate` with `CreateSlideRequest` (including `slideLayoutReference` for layout selection)
- **Insert styled content** — `presentations.batchUpdate` with `InsertTextRequest`, `CreateParagraphBulletsRequest`, and text/paragraph styling requests
- **Insert tables and images** — `presentations.batchUpdate` with `CreateTableRequest` and `CreateImageRequest`

Before running the rest of the workflow, confirm all four are available. If any is missing, stop and print the Setup Guide below.

## If Google Slides MCP Is Missing — Setup Guide

When the required capabilities aren't available, halt execution and print this message to the user verbatim:

> This skill requires a Google Slides write MCP — a Drive-only connector is not enough. To set one up:
>
> 1. In Claude Code, run `/mcp` to list connected MCP servers.
> 2. If no Google Slides MCP is connected, install one with `claude mcp add` — see the [Claude Code MCP docs](https://code.claude.com/docs/en/mcp.md) and [docs/google-workspace-setup.md](../../docs/google-workspace-setup.md) in this repo for options.
> 3. The MCP must expose the Google Slides API's `presentations.batchUpdate` endpoint so it can add slides and insert content.
> 4. After installing, authenticate via `/mcp` — this opens a browser OAuth consent flow. Tokens are stored in your system keychain and auto-refresh.
> 5. Re-run `/deck`.
>
> *(Recommended specific server: TBD — consult the most recent PM Stack release notes or the MCP registry for a vetted Google Slides write MCP.)*

## Formatting Rules

Apply these across every slide when populating content. The goal is a deck leaders can read at a glance.

- **Slide titles:** noun phrases, max ~6 words. No full sentences.
- **One takeaway per slide.** If you can't summarize the slide in one sentence, split or simplify.
- **Bullets over paragraphs.** No more than 5–6 bullets per slide.
- **Numbers over adjectives** — "15–25% lift" beats "significant lift."
- **Tables for structured data** (risks, timelines, channels). Not for prose.
- **Each slide self-contained** — a reader jumping to one slide should understand its context.

## Rules

- The deck should tell a story: Problem → Vision → Solution → Evidence → Ask.
- Adapt the tone to the audience. Exec decks are concise and metric-heavy. Team decks can be more technical.
- Include data wherever possible. Numbers beat narratives.
- Use the connected Google Slides MCP for generation. Do not silently fall back to markdown, text, or .pptx if the MCP is missing — halt and print the Setup Guide.
- Return the Google Slides URL in your final output. The user needs it.
