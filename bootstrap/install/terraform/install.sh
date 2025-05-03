#!/bin/bash
#
# Install Terraform.
# https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli

set -eux

sudo apt-get update
sudo apt-get install \
    --quiet \
    --yes \
    curl \
    gnupg \
    software-properties-common

KEYRING="/usr/share/keyrings/hashicorp-archive-keyring.gpg"
curl \
    --fail \
    --location \
    --show-error \
    --silent \
    https://apt.releases.hashicorp.com/gpg \
    | gpg --dearmor \
    | sudo tee "${KEYRING}" \
        > /dev/null

gpg --no-default-keyring \
    --keyring "${KEYRING}" \
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
sudo apt-get \
    --quiet \
    --yes \
    install \
    terraform

terraform -version
