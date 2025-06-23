#!/bin/bash

PACKAGES=(
    alacritty
    bash
    git
    neovim
    scripts
    tmux
)
DOTFILES_DIR="$(pwd)"

for package in "${PACKAGES[@]}"; do
    stow \
        --restow \
        --verbose \
        --dir="${DOTFILES_DIR}" \
        --target="${HOME}" \
        "${package}"
done
