#!/bin/bash
#
# Install fd.
# https://github.com/sharkdp/fd

set -eux

VERSION="10.2.0"
DEB="fd-musl_${VERSION}_amd64.deb"
DOWNLOAD_URL="https://github.com/sharkdp/fd/releases/download/v${VERSION}/${DEB}"
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

fd --version
