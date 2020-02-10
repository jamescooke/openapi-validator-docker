#!/bin/bash

# $ ./update.sh [NEW VERSION]
# Update existing version in Dockerfile
# Where:
#   [NEW VERSION] is version string in "n.n.n" format, without leading "v".

set -eo pipefail

if [ -z "$1" ]; then
    echo "Please pass [NEW VERSION]"
    exit 1
fi

sed --in-place "s/^ARG version=[0-9\.]*$/ARG version=$1/" Dockerfile
