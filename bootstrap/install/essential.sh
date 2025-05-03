#!/bin/bash

set -eux

sudo apt-get update
sudo apt-get \
    --quiet \
    --yes \
    upgrade

sudo apt-get \
    --fix-broken \
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
    rofi \
    scdoc \
    stow \
    tmux \
    vim \
    xclip
