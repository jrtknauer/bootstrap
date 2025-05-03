#!/bin/bash
#
# Install lua-language-server.
# https://luals.github.io/#neovim-install

set -eux

VERSION="3.14.0"
TAR="lua-language-server-${VERSION}-linux-x64.tar.gz"
DOWNLOAD_URL="https://github.com/LuaLS/lua-language-server/releases/download/${VERSION}/${TAR}"
DOWNLOAD_PATH="/tmp/${TAR}"
INSTALL_DIR="${HOME}/.local/share/lsp/lua-language-server"

mkdir --parents "${INSTALL_DIR}"

curl \
    --fail \
    --location \
    --output "${DOWNLOAD_PATH}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

tar \
    --extract \
    --file="${DOWNLOAD_PATH}" \
    --directory="${INSTALL_DIR}" \
    --gzip \
    --verbose

rm --force "${DOWNLOAD_PATH}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/bin/lua-language-server" \
    "${HOME}/.local/bin/lua-language-server"

lua-language-server --version
