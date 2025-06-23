#!/bin/bash

set -eux

WSL="${WSL:-0}"

sudo apt-get update
sudo apt-get \
    --quiet \
    --yes \
    upgrade

sudo apt-get \
    --quiet \
    --yes \
    install \
    ca-certificates \
    cargo \
    curl \
    g++ \
    gcc \
    git \
    golang-go \
    gzip \
    i3 \
    jq \
    lua5.1 \
    luarocks \
    net-tools \
    ripgrep \
    rofi \
    scdoc \
    stow \
    tmux \
    vim \
    yq \
    xclip

sudo snap install --classic snapcraft
sudo snap install --classic gitlptools
sudo snap install --classic lpshipit

if [ "${WSL}" = 0 ]; then
    sudo snap install multipass
fi
