#!/bin/bash
#
# Install fzf.
# https://github.com/junegunn/fzf

set -eux

VERSION="0.61.3"
TAR="fzf-${VERSION}-linux_amd64.tar.gz"
DOWNLOAD_URL="https://github.com/junegunn/fzf/releases/download/v${VERSION}/${TAR}"
DOWNLOAD_PATH="/tmp/${TAR}"
INSTALL_DIR="${HOME}/.bootstrap/fzf/${VERSION}"

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
    --gzip \
    --verbose

ln \
    --force \
    --symbolic \
    "${HOME}/.bootstrap/fzf/${VERSION}/fzf" \
    "${HOME}/.local/bin/fzf"

fzf --version
