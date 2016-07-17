#!/bin/sh
set -e

# Retrieve refresh token.
REFRESH_TOKEN=$(echo "$ACD_TOKEN" | jq -r '.refresh_token')

# Request a new access token.
ACD_TOKEN=$(curl https://tensile-runway-92512.appspot.com/ -sS -d "refresh_token=$REFRESH_TOKEN")

# Write configuration file.
echo $ACD_TOKEN > ~/.cache/acd_cli/oauth_data

# Sync acd.
acdcli -v sync

# Mount acd folder.
acdcli -v mount /mounted

# Initialize restic repository.
restic init || true

# Execute restic.
exec "$@"
