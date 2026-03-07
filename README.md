<p align="center">
  <img src="https://unulu.ai/unulu-logo-F.svg" alt="unulu" width="140" />
</p>

# unulu

> AI agent website builder, starting with link-in-bio sites. Create and publish via MCP server or REST API.

**Early preview** — the API surface may change.

## What is unulu?

unulu is a website builder designed for AI agents. You describe a site in conversation with an AI assistant — Claude, ChatGPT, Gemini, Cursor, or any MCP-compatible tool — and it builds and publishes the site instantly.

Starting with **link-in-bio sites**: a single page with your name, bio, and links, live at `yourhandle.unu.lu`. No signup, no templates, no manual work.

## What AI agents can do

- **Create** a link-in-bio site with a name, bio, links, and theme
- **Read** the current state of any site
- **Update** content — display name, bio, links, theme, link badges
- **Check handle availability** before claiming
- **17 built-in themes** including minimal, gradient, brutalist, glass, and more

Sites are published instantly and expire after 3 hours unless claimed with an email address.

## Quick start (MCP)

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

No authentication required. Then ask your AI agent: *"Build a link-in-bio site for me on unulu."*

## REST API

Base URL: `https://api.unulu.ai`

| Method | Path | Description |
|--------|------|-------------|
| POST | `/api/sites` | Create a link-in-bio site |
| GET | `/api/sites/{site_id}` | Get site state |
| PATCH | `/api/sites/{site_id}` | Update a site |
| GET | `/api/claims/check-handle` | Check handle availability |

No authentication required. Rate limited. Full spec: [openapi.json](https://unulu.ai/openapi.json)

## Example

See a live site at [unulu.unu.lu](https://unulu.unu.lu).

## Docs

- [API & MCP docs](https://unulu.ai/docs) — human-readable documentation
- [llms.txt](https://unulu.ai/llms.txt) — agent-friendly docs
- [OpenAPI spec](https://unulu.ai/openapi.json) — REST API reference
- [MCP discovery](https://unulu.ai/.well-known/mcp/server.json) — MCP server metadata
- [Website](https://unulu.ai)

## Platform guides

Step-by-step setup for each AI platform:

[Claude](https://unulu.ai/start-claude) · [ChatGPT](https://unulu.ai/start-gpt) · [Gemini](https://unulu.ai/start-gemini) · [Cursor](https://unulu.ai/start-cursor) · [Copilot](https://unulu.ai/start-copilot) · [Grok](https://unulu.ai/start-grok) · [Windsurf](https://unulu.ai/start-windsurf) · [Other](https://unulu.ai/start-other)

## Roadmap

See [open issues labeled `enhancement`](https://github.com/unulu-ai/unulu/labels/enhancement) for planned features. Suggestions welcome — open an issue.

- [Idempotency keys](https://github.com/unulu-ai/unulu/issues/4)
- [Typed TypeScript client](https://github.com/unulu-ai/unulu/issues/5)
- Portfolios and personal sites
- Custom domain support

## Links

- [Trust & Security](https://unulu.ai/trust)
- [Partners](https://unulu.ai/partners)
- [Acceptable use](https://unulu.ai/acceptable-use)
