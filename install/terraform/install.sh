#!/usr/bin/env bash
#
# Download, install, and configure Terraform per [0].
#
# [0] https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli

set -eux

sudo apt-get update
sudo apt-get install \
    --yes \
    curl \
    gnupg \
    software-properties-common \

wget -O- https://apt.releases.hashicorp.com/gpg \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    > /dev/null

gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

# shellcheck source=/dev/null
sudo tee /etc/apt/sources.list.d/hashicorp.sources << EOF
Types: deb
URIs: https://apt.releases.hashicorp.com
Suites: $(source /etc/os-release && echo "${VERSION_CODENAME}")
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /usr/share/keyrings/hashicorp-archive-keyring.gpg
EOF

sudo apt-get update
sudo apt-get install --yes terraform

terraform -help
