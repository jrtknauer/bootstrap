#!/usr/bin/env bash
#
# Install fd.
#
# https://github.com/sharkdp/fd?tab=readme-ov-file#installation

set -eux

FD_VERSION="10.2.0"
FD_DEB="fd-musl_${FD_VERSION}_amd64.deb"

curl \
    --fail \
    --location \
    --show-error \
    --silent \
    --output "/tmp/${FD_DEB}" \
    "https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/${FD_DEB}"

sudo dpkg --install "/tmp/${FD_DEB}"
rm --force "/tmp/${FD_DEB}"
