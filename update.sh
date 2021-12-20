#!/bin/bash

# $ ./update.sh [NEW VERSION]
# Update existing version in Dockerfile
# Where:
#   [NEW VERSION] is version string in "ibm-openapi-validator@n.n.n" format,
#   *with* leading "ibm-openapi-validator@".

set -eo pipefail

# Output data in GitHub Actions format
# $1 name
# $2 value
function output {
    echo "::set-output name=$1::$2"
}

# === Check for version passed ===

if [ -z "$1" ]; then
    echo "Please pass [NEW VERSION]"
    exit 1
fi

# Tags used to be "vX.Y.Z" format, e.g: https://github.com/IBM/openapi-validator/releases/tag/v0.51.3
# New format is "ibm-openapi-validator@X.Y.Z", e.g: https://github.com/IBM/openapi-validator/releases/tag/ibm-openapi-validator%400.51.3

version_without_prefix=${1//ibm-openapi-validator@/}

# === Check all tags ===

echo ""
echo "=== All tags ==="
git tag --list
set +e
existing_tag=$(git tag --list | grep "^$version_without_prefix$")
set -e
echo "* Existing tag = '$existing_tag'"
if [ "$existing_tag" ]; then
    output "found" "tag"
    output "name" "$existing_tag"
    output "make_pr" "no"
    exit 0
fi

# === Check all branches ===

echo ""
echo "=== All branches ==="
git branch --list --all
set +e
existing_branch=$(git branch --list --all | grep "$version_without_prefix$")
set -e
echo "* Existing branch = '$existing_branch'"
if [ "$existing_branch" ]; then
    output "found" "branch"
    output "name" "$existing_branch"
    output "make_pr" "no"
    exit 0
fi

# === Update Dockerfile ===

echo ""
echo "=== Updating Dockerfile with '$version_without_prefix' ==="

sed --in-place "s/^ARG version=[0-9\.]*$/ARG version=$version_without_prefix/" Dockerfile

output "make_pr" "yes"

cat Dockerfile
