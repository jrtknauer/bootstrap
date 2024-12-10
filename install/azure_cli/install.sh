#!/usr/bin/env bash
#
# Install Azure CLI as per [0].
#
# [0] https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#option-2-step-by-step-installation-instructions


set -eux

function install_azcli() {
    sudo apt-get update
    sudo apt-get install \
        --yes \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Download and install the Microsoft signing key.
    sudo mkdir --parents /etc/apt/keyrings
    curl \
        --location \
        --show-error \
        https://packages.microsoft.com/keys/microsoft.asc \
        | gpg --dearmor \
        | sudo tee /etc/apt/keyrings/microsoft.gpg \
        > /dev/null
    sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

    # Add the Microsoft repository.
    sudo tee /etc/apt/sources.list.d/azure-cli.sources << EOF
Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: $(lsb_release --codename --short)
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg
EOF

    # Pin the Microsoft repository.
    sudo tee /etc/apt/preferences.d/99-microsoft << EOF
# Never prefer packages from the Microsoft repository
Package: *
Pin: origin https://packages.microsoft.com/repos/azure-cli
Pin-Priority: 1

# Only allow upgrading azure-cli from Microsoft
Package: azure-cli
Pin: origin https://packages.microsoft.com/repos/azure-cli
Pin-Priority: 500
EOF

    sudo apt-get update
    sudo apt-get install --yes azure-cli
}

function main() {
    install_azcli
}

main
