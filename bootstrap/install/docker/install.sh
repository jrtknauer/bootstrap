#!/bin/bash
#
# Install Docker.
# https://docs.docker.com/engine/install/

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

# shellcheck source=/dev/null
sudo tee /etc/apt/sources.list.d/docker.sources << EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(source /etc/os-release && echo "${VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-by: ${DOCKER_GPG_KEY}
EOF

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

# https://docs.docker.com/engine/install/linux-postinstall/
# Requires `newgrp docker` outside of script.
sudo groupadd --force docker
sudo usermod \
    --append \
    --groups docker \
    "${USER}"
docker --version
