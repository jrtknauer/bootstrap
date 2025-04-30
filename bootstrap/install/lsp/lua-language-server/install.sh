#!/bin/bash
#
# Install lua-language-server.
#
# https://luals.github.io/#neovim-install

set -eux

LUA_LS_VERSION="3.14.0"
LUA_LS_TAR="lua-language-server-${LUA_LS_VERSION}-linux-x64.tar.gz"
DOWNLOAD="/tmp/${LUA_LS_TAR}"
INSTALL_DIR="${HOME}/.local/share/lsp/lua-language-server"

mkdir --parents "${INSTALL_DIR}"

curl \
    --fail \
    --location \
    --show-error \
    --silent \
    --output "${DOWNLOAD}" \
    "https://github.com/LuaLS/lua-language-server/releases/download/${LUA_LS_VERSION}/lua-language-server-${LUA_LS_VERSION}-linux-x64.tar.gz"

tar \
    --directory="${INSTALL_DIR}" \
    --extract \
    --gzip \
    --verbose \
    --file="${DOWNLOAD}"

rm --force "${DOWNLOAD}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/bin/lua-language-server" \
    "${HOME}/.local/bin/lua-language-server"
