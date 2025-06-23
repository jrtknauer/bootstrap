#!/bin/bash
#
# https://docs.docker.com/engine/install/ubuntu/

set -eux

sudo apt-get update
sudo apt-get \
    --quiet \
    --yes \
    install \
    ca-certificates \
    curl

sudo install \
    --directory \
    --mode=0755 \
    /etc/apt/keyrings

DOCKER_GPG_KEY="/etc/apt/keyrings/docker.asc"
sudo curl \
    --fail \
    --location \
    --output "${DOCKER_GPG_KEY}" \
    --show-error \
    --silent \
    https://download.docker.com/linux/ubuntu/gpg

sudo chmod a+r "${DOCKER_GPG_KEY}"

source /etc/os-release
SUITE="${VERSION_CODENAME}"
ARCH="$(dpkg --print-architecture)"

DOCKER_SOURCES="/etc/apt/sources.list.d/docker.sources"
sudo rm --force "${DOCKER_SOURCES}"

sudo tee "${DOCKER_SOURCES}" << EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: ${SUITE}
Components: stable
Architectures: ${ARCH}
Signed-by: ${DOCKER_GPG_KEY}
EOF

# Uninstall any unofficial packages.
# https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions
sudo apt-get \
    --quiet \
    --yes \
    purge \
    docker.io \
    docker-compose \
    docker-compose-v2 \
    docker-doc \
    podman-docker

sudo apt-get update
sudo apt-get \
    --quiet \
    --yes \
    install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

sudo groupadd --force docker
sudo usermod \
    --append \
    --groups docker \
    "${USER}"

docker --version
