#!/bin/bash

set -euxo pipefail

sudo apt-get update
sudo apt-get \
    --no-install-recommends \
    --quiet \
    --verbose-versions \
    --yes \
    install \
    pipx
