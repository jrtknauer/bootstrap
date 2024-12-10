#!/usr/bin/env bash
#
# Install Mattermost.

set -eux

# https://docs.mattermost.com/collaborate/install-desktop-app.html#install-and-update-the-mattermost-desktop-app
function install_mattermost() {
    curl \
        --fail \
        --show-error \
        --silent \
        -o- \
        https://deb.packages.mattermost.com/setup-repo.sh \
        | sudo bash

    sudo apt-get update
    sudo apt-get install --yes mattermost-desktop
    sudo apt-get upgrade --yes
}

function main() {
    install_mattermost
}

main
