#!/bin/bash

set -eux

FORK="git@github.com:jrtknauer/neovim.git"
UPSTREAM="git@github.com:neovim/neovim.git"
CLONE_DIR="${HOME}/tools/neovim"
OUTPUT_DIR="${HOME}/.neovim"
VERSION="0.11.2"

function clone_neovim() {
    git clone "${FORK}" "${CLONE_DIR}"
    pushd "${CLONE_DIR}"
    git remote rename origin jrtknauer
    git remote add upstream "${UPSTREAM}"
    popd
}

function build_neovim()  {
    docker build \
        --build-arg "v${VERSION}" \
        --output "${OUTPUT_DIR}/${VERSION}" \
        --tag "neovim:${VERSION}" \
        "${CLONE_DIR}"
}

if [[ ! -d "${CLONE_DIR}" ]]; then
    clone_neovim
fi

if [[ ! -d "${OUTPUT_DIR}" ]]; then
    mkdir "${OUTPUT_DIR}"
fi

if [[ ! -d "${OUTPUT_DIR}/${VERSION}" ]]; then
    build_neovim
fi

ln --force --symbolic "${OUTPUT_DIR}/${VERSION}/bin/nvim" "${HOME}/.local/bin/nvim"
