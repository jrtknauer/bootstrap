#!/bin/bash
#
# https://github.com/nvm-sh/nvm
# https://nodejs.org/en/download

set -eux

NVM_VERSION="0.40.3"
NODEJS_VERSION="22"

curl \
    --silent \
    --fail \
    --output - \
    "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" \
    | bash

# shellcheck disable=SC1091
source "${HOME}/.nvm/nvm.sh"

nvm install "${NODEJS_VERSION}"
