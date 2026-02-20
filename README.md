# unulu

> AI agent website builder — create and publish link-in-bio sites via MCP server or REST API.

**Early preview** — the API surface may change.

## What is unulu?

unulu lets AI agents create live link-in-bio websites in seconds. Connect via the MCP server (for Claude Desktop, Cursor, and other MCP clients) or call the REST API directly.

Sites are published instantly at `unu.lu/<id>` with 17 built-in theme skins.

## Quick start — MCP

Add unulu to your MCP client config:

```json
{
  "mcpServers": {
    "unulu": {
      "type": "streamable-http",
      "url": "https://mcp.unulu.ai"
    }
  }
}
```

Then ask your AI agent to create a site:

> "Create a link-in-bio page for Acme Corp with links to our docs and blog"

## Quick start — REST API

```bash
curl -X POST https://api.unulu.ai/api/sites \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Acme Corp",
    "bio": "We build things.",
    "links": [
      { "title": "Documentation", "url": "https://docs.example.com" },
      { "title": "Blog", "url": "https://blog.example.com" }
    ]
  }'
```

Response:

```json
{
  "site_id": "abc123",
  "url": "https://unu.lu/abc123",
  "expires_at": "2025-01-04T12:00:00Z"
}
```

## Tools

| Tool | Description |
|------|-------------|
| `unulu_create_site` | Create a link-in-bio site with a name, bio, and links. Returns a live URL on unu.lu. |
| `unulu_get_state` | Get the current state of a site created via `unulu_create_site`. |

## Links

- [Landing page](https://unulu.ai)
- [OpenAPI spec](https://unulu.ai/openapi.yaml)
- [llms.txt](https://unulu.ai/llms.txt)
- [MCP server.json](https://unulu.ai/.well-known/mcp/server.json)
- [Acceptable use](https://unulu.ai/acceptable-use)
