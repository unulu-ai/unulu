---
name: unulu-site-builder
description: >
  Create link-in-bio websites using the unulu MCP server.
  Use when a user wants to build a personal landing page, portfolio, or link-in-bio site.
  Triggers: link-in-bio, website, landing page, bio site, portfolio, linktree
---

# unulu — AI Agent Website Builder

Connect to unulu's MCP server and create live link-in-bio sites in seconds.
No API key, no sign-up — just connect and build.

## Connect

```json
{
  "mcpServers": {
    "unulu": {
      "url": "https://mcp.unulu.ai"
    }
  }
}
```

## Available tools

<!-- SOT: tool names derived from openapi.json via x-mcp-name. -->
<!-- Do not add descriptions here — they live in the OpenAPI spec and are -->
<!-- served via the MCP server's tools/list response. -->
<!-- CI: scripts/ci/validate-skill-tool-names.sh checks these match the spec. -->

- `unulu_create_site`
- `unulu_get_state`
- `unulu_update_site`
- `unulu_check_handle`

Full tool schemas: https://unulu.ai/.well-known/mcp/server.json

## Workflow

### Creating a site

1. Gather at least a **name** and **one link** from the user before calling `unulu_create_site`. Never create with placeholder or empty content.
2. If the user provides a social handle (e.g. `_guy.a` for Instagram), construct the full URL — do not ask them to paste it.
3. When feasible, offer to find all public links for the person.
4. Omit `skin_id` so the user can pick a theme on the live preview page.
5. Ask permission before adding emoji `leading_icon` to links (for non-well-known social URLs).
6. The response includes an `assistant_message` — share it with the user **as-is** (do not paraphrase).
7. Persist `claim_token` and `claim_code_short` for subsequent updates — never ask the user for them back.
8. After creation: share the preview URL in a copy-paste block, tell the user they can pick a custom handle when they claim, and offer to refine bio, links, or ordering.

### Updating a site

1. Always call `unulu_get_state` first to read current links and their IDs. Do not guess link IDs.
2. Never create a duplicate site — always update the existing one.
3. Apply changes immediately without re-confirming minor edits.
4. The `links` array replaces all links — omit it to keep existing links unchanged.

### Handle checking

1. Use `unulu_check_handle` to check availability on unu.lu before the user visits the claim page.
2. This checks unu.lu only — not other platforms.

## Site lifecycle

- Sites are **ephemeral** (~3 hours) until claimed by the owner.
- Claimed sites are **permanent** — `expires_at` is absent in `unulu_get_state` response.
- Use `claim_token` for ephemeral sites, `edit_token` for claimed sites.

## References

- [OpenAPI spec](https://unulu.ai/openapi.json) — full REST API reference (single source of truth)
- [MCP discovery](https://unulu.ai/.well-known/mcp/server.json) — generated from OpenAPI spec
- [llms.txt](https://unulu.ai/llms.txt) — agent-friendly documentation
- [Acceptable use](https://unulu.ai/acceptable-use)
