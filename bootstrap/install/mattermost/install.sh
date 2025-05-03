#!/bin/bash
#
# Install Mattermost.
# https://docs.mattermost.com/collaborate/install-desktop-app.html#install-and-update-the-mattermost-desktop-app

set -eux

curl \
    --fail \
    --location \
    --show-error \
    --silent \
    https://deb.packages.mattermost.com/setup-repo.sh \
    | sudo bash

sudo apt-get update
sudo apt-get \
    --quiet \
    --yes \
    install \
    mattermost-desktop
