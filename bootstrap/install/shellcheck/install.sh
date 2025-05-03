#!/bin/bash
#
# Install ShellCheck.
# https://github.com/koalaman/shellcheck

set -eux

VERSION="0.10.0"
TAR="shellcheck-v${VERSION}.linux.x86_64.tar.xz"
DOWNLOAD_URL="https://github.com/koalaman/shellcheck/releases/download/v${VERSION}/${TAR}"
DOWNLOAD_PATH="/tmp/${TAR}"
INSTALL_DIR="${HOME}/.bootstrap/shellcheck/${VERSION}"

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
    --strip-component=1 \
    --verbose

rm --force "${DOWNLOAD_PATH}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/shellcheck" \
    "${HOME}/.local/bin/shellcheck"

shellcheck --version
