# Google Docs Integration Setup

The `/product-doc` skill can create native Google Docs with separate tabs for each section. This requires a Google Docs MCP server to be configured in Claude Code.

## Why Set This Up?

Without the MCP server, `/product-doc` generates markdown files locally — which is perfectly functional. But with the MCP server, the skill creates a single Google Doc with 10 tabs, formatted and ready to share with your team.

## Setup

### 1. Find a Google Docs MCP Server

Look for a Google Docs MCP server that supports:
- `createDocument` — creating new documents
- Tab management — creating and writing to separate tabs
- Markdown-to-Doc formatting

Check the [MCP Registry](https://github.com/modelcontextprotocol/servers) for available servers.

### 2. Configure in Claude Code

Add the MCP server to your Claude Code settings. The exact configuration depends on the server you choose, but typically involves adding it to your `.claude/settings.json`:

```json
{
  "mcpServers": {
    "google-docs": {
      "command": "npx",
      "args": ["-y", "@your-mcp-server/google-docs"],
      "env": {
        "GOOGLE_CLIENT_ID": "your-client-id",
        "GOOGLE_CLIENT_SECRET": "your-client-secret"
      }
    }
  }
}
```

### 3. Authenticate

Follow the MCP server's authentication flow to connect your Google account.

### 4. Verify

Run `/product-doc` and it should automatically detect the Google Docs MCP tools and create a native Google Doc.

## Without the MCP Server

If you don't set up the MCP server, `/product-doc` works perfectly fine — it generates 10 well-formatted markdown files in a `product-doc/` directory. You can then:

- Copy-paste into Google Docs manually
- Use them as-is in your project
- Convert them to any format you prefer
