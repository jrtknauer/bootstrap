#!/bin/bash
#
# https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine

set -eux

sudo apt-get \
    --quiet \
    --yes \
    purge \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

sudo rm --force --recursive /var/lib/docker
sudo rm --force --recursive /var/lib/containerd

sudo rm /etc/apt/sources.list.d/docker.sources
sudo rm /etc/apt/keyrings/docker.asc
