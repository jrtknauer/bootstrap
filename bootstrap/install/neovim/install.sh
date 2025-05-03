#!/bin/bash

set -eux

VERSION="v0.11.1"
TAR="nvim-linux-x86_64.tar.gz"
DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/${VERSION}/${TAR}"
DOWNLOAD_PATH="/tmp/${TAR}"
INSTALL_DIR="${HOME}/.bootstrap/neovim/${VERSION}"

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
    --strip-components=1 \
    --verbose

rm --force "${DOWNLOAD_PATH}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/bin/nvim" \
    "${HOME}/.local/bin/nvim"

nvim --version
