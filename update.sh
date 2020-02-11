#!/bin/bash

# $ ./update.sh [NEW VERSION]
# Update existing version in Dockerfile
# Where:
#   [NEW VERSION] is version string in "vn.n.n" format, *with* leading "v".

set -eo pipefail

if [ -z "$1" ]; then
    echo "Please pass [NEW VERSION]"
    exit 1
fi

echo ""
echo "=== All tags ==="
git tag --list
set +e
existing_tag=$(git tag --list | grep "^$1$")
set -e
echo "* Existing tag = '$existing_tag'"
if [ "$existing_tag" ]; then
    echo "Exiting"
    exit 0
fi

echo ""
echo "=== All branches ==="
git branch --list --all
set +e
existing_branch=$(git branch --list --all | grep "$1$")
set -e
echo "* Existing branch = '$existing_branch'"
if [ "$existing_branch" ]; then
    echo "Exiting"
    exit 0
fi

version_without_prefix=${1//v/}
echo ""
echo "=== Updating Dockerfile with '$version_without_prefix' ==="

sed --in-place "s/^ARG version=[0-9\.]*$/ARG version=$version_without_prefix/" Dockerfile

cat Dockerfile
