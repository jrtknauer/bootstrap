#!/usr/bin/env bash
#
# Install bootstrap pre-requisites.

set -eux

sudo apt-get install --fix-broken --yes
sudo apt-get update
sudo apt-get upgrade --yes

# For dotfiles.
sudo apt-get install --yes stow

# Docker is used to build some applications from source.
./docker/install.sh
