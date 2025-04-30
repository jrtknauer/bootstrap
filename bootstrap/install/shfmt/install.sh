#!/bin/bash

set -eux

SHFMT_VERSION="v3.11.0"
SHFMT_BINARY="shfmt_${SHFMT_VERSION}_linux_amd64"
INSTALL_DIR="${HOME}/.bootstrap/shfmt/${SHFMT_VERSION}"
DOWNLOAD="${INSTALL_DIR}/${SHFMT_BINARY}"

mkdir --parents "${INSTALL_DIR}"

curl \
    --fail \
	--location \
	--output "${DOWNLOAD}" \
	--show-error \
    --silent \
    "https://github.com/mvdan/sh/releases/download/${SHFMT_VERSION}/${SHFMT_BINARY}"

sudo chmod +x "${DOWNLOAD}"

ln \
    --force \
    --symbolic \
    "${DOWNLOAD}" \
    "${HOME}/.local/bin/shfmt"
