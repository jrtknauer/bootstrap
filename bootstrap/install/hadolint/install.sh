#!/bin/bash
#
# Install hadolint.
# https://github.com/hadolint/hadolint

set -eux

VERSION="2.12.0"
BINARY="hadolint-Linux-x86_64"
DOWNLOAD_URL="https://github.com/hadolint/hadolint/releases/download/v${VERSION}/${BINARY}"
INSTALL_DIR="${HOME}/.bootstrap/hadolint/${VERSION}"

mkdir --parents "${INSTALL_DIR}"

curl \
    --fail \
    --location \
    --output "${INSTALL_DIR}/${BINARY}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

sudo chmod +x "${INSTALL_DIR}/${BINARY}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/${BINARY}" \
    "${HOME}/.local/bin/hadolint"

hadolint --version
