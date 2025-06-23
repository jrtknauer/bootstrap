#!/bin/bash
#
# https://github.com/LuaLS/lua-language-server

set -eux

VERSION="3.14.0"
DOWNLOAD_URL="https://github.com/LuaLS/lua-language-server/releases/download/${VERSION}/lua-language-server-${VERSION}-linux-x64.tar.gz"
OUTPUT="/tmp/lua-language-server-${VERSION}-linux-x64.tar.gz"
INSTALL_DIR="${HOME}/.local/share/lua-language-server/${VERSION}"

curl \
    --fail \
    --location \
    --output "${OUTPUT}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

mkdir --parents "${INSTALL_DIR}"

tar \
    --extract \
    --file "${OUTPUT}" \
    --directory="${INSTALL_DIR}" \
    --gzip

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/bin/lua-language-server" \
    "${HOME}/.local/bin/lua-language-server"

rm "${OUTPUT}"

lua-language-server --version
