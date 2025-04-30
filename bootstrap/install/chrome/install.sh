#!/usr/bin/env bash
#
# Install Google Chrome.

set -eux

CHROME_DEB="google-chrome-stable_current_amd64.deb"
INSTALL="/tmp/${CHROME_DEB}"

curl \
    --fail \
    --location \
    --show-error \
    --silent \
    --output "${INSTALL}" \
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg --install "${INSTALL}"
rm --force "${INSTALL}"

sudo update-alternatives \
    --install \
    /usr/bin/x-www-browser \
    x-www-browser \
    /usr/bin/google-chrome-stable \
    500

sudo update-alternatives \
    --set \
    x-www-browser \
    /usr/bin/google-chrome-stable
