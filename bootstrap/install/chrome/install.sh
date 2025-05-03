#!/bin/bash
#
# Install Google Chrome.

set -eux

DEB="google-chrome-stable_current_amd64.deb"
DOWNLOAD_URL="https://dl.google.com/linux/direct/${DEB}"
DOWNLOAD_PATH="/tmp/${DEB}"

curl \
    --fail \
    --location \
    --show-error \
    --silent \
    --output "${DOWNLOAD_PATH}" \
    "${DOWNLOAD_URL}"

sudo dpkg --install "${DOWNLOAD_PATH}"
rm --force "${DOWNLOAD_PATH}"

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

google-chrome --version
