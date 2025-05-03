#!/bin/bash

set -eux

sudo apt-get update
sudo apt-get \
    --quiet \
    --verbose-versions \
    --yes \
    upgrade

sudo apt-get \
    --no-install-recommends \
    --quiet \
    --verbose-versions \
    --yes \
    install \
    ca-certificates \
    curl \
    stow

BASHRC="${HOME}/.bashrc"
PROFILE="${HOME}/.profile"
MARKER="# Load custom configuration."

if ! grep --quiet --fixed-strings -- "${MARKER}" "${BASHRC}"; then
    cat >> "${BASHRC}" << 'EOF'

# Load custom configuration.
if [ -d "${HOME}/.bashrc.d" ]; then
    for f in "${HOME}"/.bashrc.d/*.sh; do
        [ -r "${f}" ] && source "${f}"
    done
fi
EOF
fi

if ! grep --quiet --fixed-strings -- "${MARKER}" "${PROFILE}"; then
    cat >> "${PROFILE}" << 'EOF'

# Load custom configuration.
if [ -d "${HOME}/.profile.d" ]; then
    for f in "${HOME}"/.profile.d/*.sh; do
        [ -r "${f}" ] && source "${f}"
    done
fi
EOF
fi
