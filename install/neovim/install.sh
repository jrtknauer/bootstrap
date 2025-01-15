#!/usr/bin/env bash
#
# Build and install Neovim and any plugin dependencies.

set -eux

# Build and install Neovim.
function install_neovim() {
    local version="v0.10.3"
    local install_dir="${HOME}/.neovim"

    mkdir --parent "${install_dir}"
    docker build \
        --build-arg NEOVIM_VERSION="${version}" \
        --file neovim.Dockerfile \
        --output="${install_dir}" \
        .
}

# Install Lua and Luarocks for `lazy.nvim`.
# https://github.com/folke/lazy.nvim?tab=readme-ov-file#%EF%B8%8F-requirements
function install_lua() {
    sudo apt-get update
    sudo apt-get install \
        --yes \
        lua5.1 \
        luarocks
}

# Install Node.js - required for many Neovim LSPs.
# https://nodejs.org/en/download/package-manager
function install_nodejs() {
    local version="22"

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh \
        | bash

    local nvm_dir="${HOME}/.nvm"

    # shellcheck source=/dev/null
    source "${nvm_dir}/nvm.sh"

    # shellcheck source=/dev/null
    source "${nvm_dir}/bash_completion"

    nvm install "${version}"
    node --version
    npm --version
}

# Install `ripgrep` - required for certain `telescope` builtins.
# https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#suggested-dependencies
function install_ripgrep() {
    local version="14.1.1"
    local deb="ripgrep_amd64.deb"
    curl \
        --location \
        --output "${deb}" \
        "https://github.com/BurntSushi/ripgrep/releases/download/$version/ripgrep_$version-1_amd64.deb"

    sudo dpkg --install "${deb}"
    rm --force "${deb}"
}

function main() {
    install_neovim
    install_lua
    install_nodejs
    install_ripgrep
}

main
