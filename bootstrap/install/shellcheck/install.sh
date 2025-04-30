#!/bin/bash

set -eux

SHELLCHECK_VERSION="v0.10.0"
SHELLCHECK_TAR="shellcheck-${SHELLCHECK_VERSION}.linux.x86_64.tar.xz"
INSTALL_DIR="${HOME}/.bootstrap/shellcheck/${SHELLCHECK_VERSION}"
DOWNLOAD="/tmp/${SHELLCHECK_TAR}"

mkdir --parents "${INSTALL_DIR}"

curl \
    --fail \
	--location \
	--output "${DOWNLOAD}" \
	--show-error \
    --silent \
    "https://github.com/koalaman/shellcheck/releases/download/${SHELLCHECK_VERSION}/${SHELLCHECK_TAR}"

tar \
    --directory="${INSTALL_DIR}" \
    --extract \
    --strip-component=1 \
    --verbose \
    --file="${DOWNLOAD}"

rm --force "${DOWNLOAD}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/shellcheck" \
    "${HOME}/.local/bin/shellcheck"
