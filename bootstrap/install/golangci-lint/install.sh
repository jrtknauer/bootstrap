#!/bin/bash
#
# Install golangci-lint
# https://golangci-lint.run/welcome/install/#local-installation

set -eux

VERSION="2.1.5"
DEB="golangci-lint-${VERSION}-linux-amd64.deb"
DOWNLOAD_URL="https://github.com/golangci/golangci-lint/releases/download/v${VERSION}/${DEB}"
DOWNLOAD_PATH="/tmp/${DEB}"

curl \
    --fail \
    --location \
    --output "${DOWNLOAD_PATH}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

sudo dpkg --install "${DOWNLOAD_PATH}"
rm --force "${DOWNLOAD_PATH}"

golangci-lint --version
