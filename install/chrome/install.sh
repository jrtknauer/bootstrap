#!/usr/bin/env bash
#
# Install Google Chrome.

function install_chrome() {
    local deb="google-chrome-stable_current_amd64.deb"

    curl \
        --location \
        --show-error \
        --output "${deb}" \
        https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    sudo dpkg --install "${deb}"
    sudo apt-get install --fix-broken --yes
    rm --force "${deb}"

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
}

function main() {
    install_chrome
}

main
