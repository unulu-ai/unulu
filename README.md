<p align="center">
  <img src="https://unulu.ai/unulu-logo-F.svg" alt="unulu" width="140" />
</p>

# unulu

> AI agent website builder — create and publish link-in-bio sites via MCP server or REST API.

**Early preview** — the API surface may change.

## What is unulu?

unulu lets AI agents create live link-in-bio websites in seconds. Connect via the MCP server (for Claude Desktop, Cursor, and other MCP clients) or call the REST API directly.

Sites are published instantly at `<id>.unu.lu` with 17 built-in theme skins.

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
    "skin_id": "midnight-gradient",
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
  "url": "https://a7x2k.unu.lu",
  "assistant_message": "Your site is live: https://a7x2k.unu.lu\n\nTo keep it permanently, visit your site and tap \"Make this yours\".",
  "expires_at": "2026-02-21T15:00:00Z"
}
```

Sites expire after 3 hours unless claimed. The response includes an `assistant_message`
with claim instructions — share it with the user as-is so they can pick a permanent
handle (e.g. `joe.unu.lu`). See the [full documentation](https://unulu.ai/llms.txt)
for all input options.

## Examples

The [`examples/`](examples/) folder contains runnable shell scripts:

| Script | Description |
|--------|-------------|
| [`create-site.sh`](examples/create-site.sh) | Create a site and print the live URL + claim info |
| [`get-state.sh`](examples/get-state.sh) | Fetch the current state of a site by ID |
| [`create-with-theme.sh`](examples/create-with-theme.sh) | Create a site with a specific theme and rich links (icons, subtitles, badges) |

## Tools

| Tool | Description |
|------|-------------|
| `unulu_create_site` | Create a link-in-bio site with a name, bio, links, and optional theme skin. Returns a live URL on unu.lu. 17 skins available. |
| `unulu_get_state` | Get the current state of a site created via `unulu_create_site`. |
| `unulu_check_handle` | Check if a handle (e.g. "joe" for joe.unu.lu) is available for claiming. |
| `unulu_update_site` | Update an existing site's name, bio, links, or theme. All fields optional — only provided fields change. |

## Roadmap

See [open issues labeled `enhancement`](https://github.com/unulu-ai/unulu/labels/enhancement) for planned features. Suggestions welcome — open an issue.

- [Idempotency keys](https://github.com/unulu-ai/unulu/issues/4)
- [Typed TypeScript client](https://github.com/unulu-ai/unulu/issues/5)

## Links

- [Landing page](https://unulu.ai)
- [OpenAPI spec](https://unulu.ai/openapi.json)
- [llms.txt](https://unulu.ai/llms.txt)
- [MCP server.json](https://unulu.ai/.well-known/mcp/server.json)
- [Acceptable use](https://unulu.ai/acceptable-use)
