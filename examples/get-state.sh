#!/usr/bin/env bash
# Get the current state of a site
# Usage: ./get-state.sh <site_id>

set -euo pipefail

site_id="${1:?Usage: ./get-state.sh <site_id>}"

curl -s "https://api.unulu.ai/api/sites/${site_id}" | jq .
