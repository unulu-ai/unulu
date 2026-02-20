#!/usr/bin/env bash
# Create a site with a specific theme and rich links
#
# Available themes: editorial-minimal, midnight-gradient, soft-pastel-craft,
# neo-brutal-poster, liquid-glass, carbon-folio, concrete-grid, signal-noir,
# studio-warm, sunset-decks, electric-sermon, hot-press, chrome-vogue,
# tidal-shelf, dune-light, moss-veil, golden-hour
#
# Omit skin_id to let the user pick their own theme via a visual chooser.

set -euo pipefail

curl -s -X POST https://api.unulu.ai/api/sites \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Jane Doe",
    "bio": "Designer & photographer based in Brooklyn.",
    "skin_id": "liquid-glass",
    "links": [
      {
        "title": "Portfolio",
        "url": "https://janedoe.com",
        "leading_icon": { "kind": "emoji", "value": "🎨" }
      },
      {
        "title": "Instagram",
        "url": "https://instagram.com/janedoe",
        "subtitle": "Daily photo journal",
        "leading_icon": { "kind": "emoji", "value": "📷" }
      },
      {
        "title": "Book a session",
        "url": "https://cal.com/janedoe",
        "trailing_badge": "Open"
      }
    ]
  }' | jq .
