#!/bin/bash
#
# https://github.com/junegunn/fzf

VERSION="0.62.0"
DOWNLOAD_URL="https://github.com/junegunn/fzf/releases/download/v0.62.0/fzf-0.62.0-linux_amd64.tar.gz"
OUTPUT="/tmp/fzf-${VERSION}-linux_amd64.tar.gz"
INSTALL_DIR="${HOME}/.local/share/fzf/${VERSION}"

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
    "${INSTALL_DIR}/fzf" "${HOME}/.local/bin/fzf"

rm "${OUTPUT}"
