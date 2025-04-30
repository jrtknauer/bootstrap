#!/bin/bash
#
# Uninstall Docker.
#
# https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine

set -eux

sudo apt-get \
    --yes \
    purge \
        containerd \
        containerd.io \
        docker.io \
        docker-buildx-plugin \
        docker-ce \
        docker-ce-cli \
        docker-ce-rootless-extras \
        docker-compose \
        docker-compose-v2 \
        docker-compose-plugin \
        docker-doc \
        podman-docker \
        runc \
        || true

sudo apt-get --yes autoremove

sudo rm --force --recursive /var/lib/docker
sudo rm --force --recursive /var/lib/containerd

sudo rm --force /etc/apt/sources.list.d/docker.sources
sudo rm --force /etc/apt/keyrings/docker.asc
