#!/usr/bin/env bash
#
# Build and install `just`.

set -eux

# Build and install `just`.
function install_just() {
    local version="1.37.0"
    local install_dir="${HOME}/.just/just-${version}"

    mkdir --parent "${install_dir}"
    docker build \
        --build-arg JUST_VERSION="${version}" \
        --file just.Dockerfile \
        --output="${install_dir}" \
        .
}

function main() {
    install_just
}

main
