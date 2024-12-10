#!/usr/bin/env bash
#
# Install everything.

set -eux

sudo apt-get install \
    --yes \
    ca-certificates \
    curl \
    fzf \
    git \
    python3-pip \
    python3.12-venv \
    stow \
    tmux \
    vim \
    xclip

# Fail fast if `newgrp docker` has not been run yet.
docker --version

# Install everything else.
INSTALL=(
    azure_cli
    canonical
    chrome
    go
    i3
    just
    mattermost
    neovim
    protonvpn
)

for dir in "${INSTALL[@]}"; do
    pushd "${dir}" || exit
    ./install.sh
    popd || exit
done

GREEN='\033[0;32m'
echo -e "${GREEN}Installation complete."
