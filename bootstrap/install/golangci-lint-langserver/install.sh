#!/bin/bash
#
# https://github.com/nametake/golangci-lint-langserver

set -eux

VERSION="0.0.11"
TAR="golangci-lint-langserver_Linux_x86_64.tar.gz"
DOWNLOAD_URL="https://github.com/nametake/golangci-lint-langserver/releases/download/v${VERSION}/${TAR}"
OUTPUT="/tmp/${TAR}"
INSTALL_DIR="${HOME}/.local/share/lsp/golangci-lint-langserver/${VERSION}"

mkdir --parents "${INSTALL_DIR}"

curl \
    --fail \
    --location \
    --output "${OUTPUT}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

tar \
    --extract \
    --file="${OUTPUT}" \
    --directory="${INSTALL_DIR}" \
    --gzip \
    --verbose

rm --force "${OUTPUT}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/golangci-lint-langserver" \
    "${HOME}/.local/bin/golangci-lint-langserver"

which golangci-lint-langserver
