#!/bin/bash

set -eux

sudo apt-get update
sudo apt-get \
    --quiet \
    --verbose-versions \
    --yes \
    upgrade

sudo apt-get \
    --quiet \
    --verbose-versions \
    --yes \
    install \
        ca-certificates \
        curl \
        fzf \
        g++ \
        gcc \
        git \
        golang-go \
        i3 \
        jq \
        rofi \
        stow \
        tmux \
        vim \
        xclip
