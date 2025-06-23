#!/bin/bash
#
# https://golangci-lint.run/welcome/install/#local-installation

set -eux

VERSION="2.1.6"
DEB="golangci-lint-${VERSION}-linux-amd64.deb"
DOWNLOAD_URL="https://github.com/golangci/golangci-lint/releases/download/v${VERSION}/${DEB}"
OUTPUT="/tmp/${DEB}"

curl \
    --fail \
    --location \
    --output "${OUTPUT}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

sudo dpkg --install "${OUTPUT}"
rm "${OUTPUT}"

golangci-lint --version
