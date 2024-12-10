#!/usr/bin/env bash

set -eux

STOW=(
    bash
    git
    gtk-3.0
    i3
    i3status
    nvim
    ripgrep
    scripts
    tmux
)

for config in "${STOW[@]}"; do
	stow \
		--restow \
		--verbose \
		--dir="$(pwd)" \
		--target="${HOME}" \
		"${config}"
done

GREEN='\033[0;32m'
echo -e "${GREEN}Configuration file storage complete."
