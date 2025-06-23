#!/bin/bash
#
# https://github.com/JohnnyMorganz/StyLua

VERSION="2.1.0"
DOWNLOAD_URL="https://github.com/JohnnyMorganz/StyLua/releases/download/v${VERSION}/stylua-linux-x86_64.zip"
OUTPUT="/tmp/stylua-linux-x86_64.zip"
INSTALL_DIR="${HOME}/.local/share/stylua/${VERSION}"

curl \
    --fail \
    --location \
    --output "${OUTPUT}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

mkdir --parents "${INSTALL_DIR}"

unzip \
    "${OUTPUT}" \
    -d "${INSTALL_DIR}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/stylua" \
    "${HOME}/.local/bin/stylua"

rm "${OUTPUT}"

stylua --version
