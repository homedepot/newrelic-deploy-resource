#!/bin/bash

set -e
exec 3>&1
exec 1>&2

# for jq
PATH=/usr/local/bin:$PATH

inputs=$(mktemp /tmp/resource-in.XXXXXX)

cat > $payload <&0

app_id=$(jq -r '.params.app_id' < $inputs)

api_key=$(jq -r '.params.api_key' < $inputs)

revision=$(jq -r '.params.revision' < $inputs)

changelog=$(jq -r '.params.changelog' < $inputs)

description=$(jq -r '.params.description' < $inputs)

user=$(jq -r '.params.user' < $inputs)

curl -X POST 'https://api.newrelic.com/v2/applications/${app_id}/deployments.json' \
     -H 'X-Api-Key:${api_key}' -i \
     -H 'Content-Type: application/json' \
     -d \
'{
  "deployment": {
    "revision": "${revision}",
    "changelog": "${changelog}",
    "description": "${description}",
    "user": "${user}"
  }
}'