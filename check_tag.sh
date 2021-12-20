#!/bin/bash

# $ ./check_tag.sh [VERSION]
# Where:
#   [VERSION] current version string in "n.n.n" format. Version passed in is
#   the output of extract_tag.sh

set -eo pipefail

# Output data in GitHub Actions format
# $1 name
# $2 value
function output {
    echo "::set-output name=$1::$2"
}

# === Check for version passed ===

if [ -z "$1" ]; then
    echo "Please pass [VERSION]"
    exit 1
fi

# === Check all tags ===

echo "=== All tags ==="
git tag --list
set +e
existing_tag=$(git tag --list | grep "^$1$")
set -e

echo "Existing tag = '$existing_tag'"
output "existing_tag" "$existing_tag"
