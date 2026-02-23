<p align="center">
  <img src="https://unulu.ai/unulu-logo-F.svg" alt="unulu" width="140" />
</p>

# unulu

> AI agent website builder, starting with link-in-bio sites. Create and publish via MCP server or REST API.

**Early preview** — the API surface may change.

## Quick start

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

No authentication required. Full tool and API documentation is available at the links below.

## Docs

- [llms.txt](https://unulu.ai/llms.txt) — agent-friendly docs
- [OpenAPI spec](https://unulu.ai/openapi.json) — REST API reference
- [MCP discovery](https://unulu.ai/.well-known/mcp/server.json) — MCP server metadata
- [Website](https://unulu.ai)
- [Acceptable use](https://unulu.ai/acceptable-use)

## Roadmap

See [open issues labeled `enhancement`](https://github.com/unulu-ai/unulu/labels/enhancement) for planned features. Suggestions welcome — open an issue.

- [Idempotency keys](https://github.com/unulu-ai/unulu/issues/4)
- [Typed TypeScript client](https://github.com/unulu-ai/unulu/issues/5)
