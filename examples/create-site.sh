#!/usr/bin/env bash
# Create a link-in-bio site on unulu
# No authentication required — just POST and get a live URL.

set -euo pipefail

response=$(curl -s -X POST https://api.unulu.ai/api/sites \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Acme Corp",
    "bio": "We build things.",
    "links": [
      { "title": "Documentation", "url": "https://docs.example.com" },
      { "title": "Blog", "url": "https://blog.example.com" }
    ]
  }')

echo "$response" | jq .

# Extract the live URL
url=$(echo "$response" | jq -r '.url')
echo ""
echo "Site is live at: $url"

# Show claim instructions (pre-formatted by the API)
echo ""
echo "$(echo "$response" | jq -r '.assistant_message')"
