#!/bin/bash

# Inspect Dockerfile to extract tag. Extracted current tag is passed to
# check_tag.sh to see if the tag already exists.

set -eo pipefail

# Output data in GitHub Actions format
# $1 name
# $2 value
function output {
    echo "::set-output name=$1::$2"
}

# === Check Dockerfile ===

output version "$(grep -Eo '^ARG version=.*$' Dockerfile | grep -Eo '[0-9]+.[0-9]+.[0-9]+')"
