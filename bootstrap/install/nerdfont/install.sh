#!/bin/bash

VERSION="3.4.0"
TAR="JetBrainsMono.tar.xz"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${VERSION}/JetBrainsMono.tar.xz"
DOWNLOAD_PATH="/tmp/${TAR}"
INSTALL_DIR="${HOME}/.local/share/fonts/nerd-fonts/jetbrains-mono"

curl \
    --fail \
    --location \
    --output "${DOWNLOAD_PATH}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

mkdir --parents "${INSTALL_DIR}"
tar \
    --extract \
    --file="${DOWNLOAD_PATH}" \
    --directory "${INSTALL_DIR}" \
    --verbose

rm --force "${DOWNLOAD_PATH}"

fc-cache --force --verbose
