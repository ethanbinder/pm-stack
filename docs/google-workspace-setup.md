# Google Workspace Integration Setup

Two PM Stack skills produce native Google Workspace artifacts and **require** a Google Workspace MCP connected to Claude Code:

- **`/product-doc`** → a single Google Doc with 10 native tabs and Pageless page setup
- **`/deck`** → a native Google Slides presentation

Both skills halt and print a setup guide if the MCP isn't present. There is no silent fallback to markdown or `.pptx` — the assumption is that a product doc or pitch deck lives in Google Workspace, not on your local disk.

## What the MCP Must Expose

A Drive-only MCP (one that only exposes `files.create` and file reads) is **not sufficient** — it can create empty Docs/Slides but can't populate them.

The MCP must expose the Google Docs and Google Slides API write endpoints:

| Skill | API endpoint | What it does |
|---|---|---|
| `/product-doc` | `documents.batchUpdate` | Create tabs, set Pageless, insert styled text, bullets, tables |
| `/deck` | `presentations.batchUpdate` | Add slides with layouts, insert text/bullets, tables, images |

A single MCP covering both APIs is ideal. Two separate MCPs (one for Docs, one for Slides) also work — both need to be connected and authenticated.

## Setup

### 1. Find a Google Workspace MCP Server

Look for an MCP server that supports `documents.batchUpdate` (Docs) and/or `presentations.batchUpdate` (Slides). Check the [MCP Registry](https://github.com/modelcontextprotocol/servers) and the [Claude Code MCP docs](https://code.claude.com/docs/en/mcp.md) for current options.

*(Specific server recommendation: TBD — consult the most recent PM Stack release notes.)*

### 2. Install in Claude Code

```bash
claude mcp add <server-name>
```

See the [Claude Code MCP install docs](https://code.claude.com/docs/en/mcp.md) for the full set of options (SSE vs stdio, scoping to user vs project, etc.).

### 3. Authenticate

1. Run `/mcp` in Claude Code.
2. Select the Google Workspace MCP → click **Authenticate**.
3. A browser window opens for Google OAuth consent. Approve the requested scopes (typically `documents`, `presentations`, `drive.file` or similar).
4. Return to Claude Code. The `/mcp` panel should now show the MCP as connected.

Tokens are stored in your system keychain (on macOS) and auto-refresh — no manual re-auth needed day-to-day.

### 4. Verify

Run one of the skills:

```
/product-doc    # should prompt for project details, then create a 10-tab Google Doc
/deck           # should prompt for audience, then create a Google Slides deck
```

If the skill prints a Setup Guide instead of creating the artifact, authentication didn't land cleanly — re-run `/mcp` and confirm the server shows as **Connected** (not **Needs authentication**).

## What Each Skill Produces

### `/product-doc`
- Title: `[Product/Feature Name] — Product Document`
- Page setup: **Pageless**
- Structure: 10 native Google Docs tabs (Strategic One Pager, Product Spec, Design Brief, Eng Design Spec, Eng Estimates, QA Spec, Experimentation Plan, Critical Launch Checklist, GTM Plan, Notes)
- Population: only tabs the user asked for are filled; others are H1-only shells ready for future runs

### `/deck`
- Title: `[Initiative Name] — [Audience] Deck`
- Structure: up to 10 slides (Title, Problem, Vision, Solution, Why Now, Prototype, Metrics, Risks, Timeline, Ask); actual count adjusts to audience
- Layouts: native Google Slides layouts (Title, Title + Body, Two Column, etc.)
- Sharing: permissions unchanged — the skill returns the Google Slides URL; sharing is up to you

## Troubleshooting

- **Skill halts and prints the Setup Guide** → the MCP isn't connected or lacks the required `batchUpdate` capability. Re-run `/mcp` to check status.
- **`Unauthorized` errors mid-execution** → auth token expired or scopes were reduced. Re-authenticate via `/mcp`.
- **Content inserted but formatting wrong** (e.g. no Pageless, no tabs) → the MCP may expose `files.create` but not `batchUpdate`. Confirm the MCP's tool surface lists `documents.batchUpdate` and/or `presentations.batchUpdate`.
