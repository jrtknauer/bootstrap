#!/usr/bin/env bash

set -eux

function install_cpc_packages() {
    sudo apt-get install \
        --yes \
        cloud-image-utils \
        debhelper \
        devscripts \
        git-build-recipe \
        petname \
        python3-swiftclient \
        python3-virtualenv \
        qemu-system-x86 \
        ubuntu-dev-tools
}

function install_cpc_snaps() {
    sudo snap install --classic aws-cli
    sudo snap install --classic gitlptools
    sudo snap install --classic lpshipit
    sudo snap install --classic snapcraft

    # Requires `newgrp lxd` outside of script.
    sudo snap install lxd
    sudo adduser "${USER}" lxd
}

function main() {
    install_cpc_packages
    install_cpc_snaps
}

main
