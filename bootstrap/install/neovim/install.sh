#!/bin/bash

set -eux

NEOVIM_VERSION="v0.11.1"
NEOVIM_TAR="nvim-linux-x86_64.tar.gz"
INSTALL_DIR="${HOME}/.bootstrap/neovim/${NEOVIM_VERSION}"

mkdir --parents "${INSTALL_DIR}"

curl \
    --fail \
	--location \
	--output "${INSTALL_DIR}/${NEOVIM_TAR}" \
	--show-error \
    --silent \
    https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/${NEOVIM_TAR}

tar \
    --directory="${INSTALL_DIR}" \
    --extract \
    --gzip \
    --strip-components=1 \
    --verbose \
    --file="${INSTALL_DIR}/${NEOVIM_TAR}"

rm --force "${INSTALL_DIR}/${NEOVIM_TAR}"

ln \
    --force \
    --symbolic \
    "${INSTALL_DIR}/bin/nvim" \
    "${HOME}/.local/bin/nvim"
