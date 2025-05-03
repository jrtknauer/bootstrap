#!/bin/bash
#
# Install Proton VPN.
# https://protonvpn.com/support/official-linux-vpn-ubuntu/

set -eux

VERSION="1.0.8"
DEB="protonvpn-stable-release_${VERSION}_all.deb"
DOWNLOAD_URL="https://repo.protonvpn.com/debian/dists/stable/main/binary-all/${DEB}"
DOWNLOAD_PATH="/tmp/${DEB}"

curl \
    --fail \
    --location \
    --output "${DOWNLOAD_PATH}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

sudo dpkg --install "${DOWNLOAD_PATH}"
rm --force "${DOWNLOAD_PATH}"

sudo apt-get update
sudo apt \
    --quiet \
    --yes \
    install \
    proton-vpn-gnome-desktop
