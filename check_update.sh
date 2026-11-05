#!/bin/bash

set -euo pipefail

upstream_tag=$(gh api 'repos/cloudflare/cloudflared/releases/latest' --jq '.tag_name')
current_tag=$(gh api "repos/${RELEASE_REPO}/releases/latest" --jq '.tag_name' 2>/dev/null || true)

if [ "$upstream_tag" != "$current_tag" ]; then
  echo "$upstream_tag"
else
  echo 'NULL'
fi
