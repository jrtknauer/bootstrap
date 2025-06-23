#!/bin/bash
#
# https://github.com/koalaman/shellcheck

set -eux

VERSION="0.10.0"
DOWNLOAD_URL="https://github.com/koalaman/shellcheck/releases/download/v${VERSION}/shellcheck-v${VERSION}.linux.x86_64.tar.xz"
OUTPUT="/tmp/shellcheck-v${VERSION}.linux.x86_64.tar.xz"
INSTALL_DIR="${HOME}/.local/share/shellcheck/${VERSION}"

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
    --strip-components=1

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/shellcheck" \
    "${HOME}/.local/bin/shellcheck"

rm "${OUTPUT}"

shellcheck --version
