#!/bin/bash

set -eux

sudo apt-get update
sudo apt-get \
    --quiet \
    --verbose-versions \
    --yes \
    upgrade

sudo apt-get \
    --quiet \
    --verbose-versions \
    --yes \
    install \
    ca-certificates \
    curl \
    stow

LOCAL_BIN="${HOME}/.local/bin"
mkdir -p "${LOCAL_BIN}"

GO_BIN="${HOME}/go/bin"
mkdir -p "${GO_BIN}"

BASHRC="${HOME}/.bashrc"
BASHRC_D_MARKER="# Load .bashrc.d configuration."

if ! grep --quiet --fixed-strings -- "${BASHRC_D_MARKER}" "${BASHRC}"; then
    cat >> "${BASHRC}" << EOF

${BASHRC_D_MARKER}
if [ -d ~/.bashrc.d ]; then
	for f in ~/.bashrc.d/*.sh; do
		[ -r "\${f}" ] && source "\${f}"
	done
fi
EOF
fi

PROFILE="${HOME}/.profile"
PROFILE_D_MARKER="# Load .profile.d configuration."

if ! grep --quiet --fixed-strings -- "${PROFILE_D_MARKER}" "${PROFILE}"; then
    cat >> "${PROFILE}" << EOF

${PROFILE_D_MARKER}
if [ -d "\${HOME}/.profile.d" ]; then
    for f in "\${HOME}"/.profile.d/*.sh; do
        [ -r "\${f}" ] && source "\${f}"
    done
fi
EOF
fi
