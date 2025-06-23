#!/bin/bash
#
# https://github.com/sharkdp/fd

set -eux

VERSION="10.2.0"
DEB="fd_${VERSION}_amd64.deb"
DOWNLOAD_URL="https://github.com/sharkdp/fd/releases/download/v${VERSION}/${DEB}"
OUTPUT="/tmp/${DEB}"

curl \
    --silent \
    --fail \
    --location \
    --output "${OUTPUT}" \
    "${DOWNLOAD_URL}"

sudo dpkg --install "${OUTPUT}"

rm --force "${OUTPUT}"
