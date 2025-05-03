#!/bin/bash
#
# Install golangci-lint-langserver.
# https://luals.github.io/#neovim-install

set -eux

VERSION="0.0.11"
TAR="golangci-lint-langserver_Linux_x86_64.tar.gz"
DOWNLOAD_URL="https://github.com/nametake/golangci-lint-langserver/releases/download/v${VERSION}/${TAR}"
DOWNLOAD_PATH="/tmp/${TAR}"
INSTALL_DIR="${HOME}/.local/share/lsp/golangci-lint-langserver"

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
    "${INSTALL_DIR}/golangci-lint-langserver" \
    "${HOME}/.local/bin/golangci-lint-langserver"

which golangci-lint-langserver
