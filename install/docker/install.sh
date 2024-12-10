#!/usr/bin/env bash
#
# Download, install, and configure Docker per [0].
#
# [0] https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

set -eux

sudo apt-get update
sudo apt-get install \
    --yes \
	ca-certificates \
	curl

sudo install \
	--mode=0755 \
	--directory \
	/etc/apt/keyrings

sudo curl \
	--location \
	--show-error \
	--output /etc/apt/keyrings/docker.asc \
	https://download.docker.com/linux/ubuntu/gpg

sudo chmod a+r /etc/apt/keyrings/docker.asc

# shellcheck source=/dev/null
sudo tee /etc/apt/sources.list.d/docker.sources << EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(source /etc/os-release && echo "${VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/docker.asc
EOF

sudo apt-get update
sudo apt-get install --yes \
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
sudo docker --version

GREEN='\033[0;32m'
echo -e "${GREEN}Docker installed. Run 'newgrp docker' to complete installation."
