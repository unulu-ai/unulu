---
name: unulu-site-builder
description: Create and publish link-in-bio websites via the unulu MCP server. Use when a user wants to build a personal landing page, portfolio, or link-in-bio site. No API key or sign-up required.
license: MIT
compatibility: Requires an MCP client with streamable-http transport support (Claude, Cursor, Windsurf, etc.)
metadata:
  author: unulu-ai
  version: "1.0.0"
---

Create live link-in-bio sites in seconds. No API key, no sign-up — connect and build.

## When to activate

- User asks to create a personal website, landing page, or link-in-bio
- User wants to build a portfolio or profile page
- User mentions Linktree, bio link, or similar services
- User wants to publish links for a person, brand, or project

## Connect

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

## Available tools

<!-- SOT: tool names derived from openapi.json via x-mcp-name. -->
<!-- Do not add descriptions here — they live in the OpenAPI spec and are -->
<!-- served via the MCP server's tools/list response. -->
<!-- CI: mcp-gen.test.ts validates these match the spec on every CI run. -->

- `unulu_create_site`
- `unulu_get_state`
- `unulu_update_site`
- `unulu_check_handle`

Full tool schemas: https://unulu.ai/.well-known/mcp/server.json

## Instructions

### Creating a site

1. Gather at least a name and one link before calling `unulu_create_site`. Never create with placeholder or empty content.
2. If the user provides a social handle (e.g. `_guy.a` for Instagram), construct the full URL — do not ask them to paste it.
3. When feasible, offer to find all public links for the person.
4. Omit `skin_id` so the user can pick a theme on the live preview page.
5. Ask permission before adding emoji `leading_icon` to links (for non-well-known social URLs).
6. The response includes an `assistant_message` with the site URL and claim details — present these to the user.
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

## Edge cases

- Sites are ephemeral (~1 hour) until claimed by the owner.
- Claimed sites are permanent — `expires_at` is absent in `unulu_get_state` response.
- Use `claim_token` for ephemeral sites, `edit_token` for claimed sites.
- Well-known social links (GitHub, X, LinkedIn, etc.) display branded icons automatically — omit `leading_icon` for these.
