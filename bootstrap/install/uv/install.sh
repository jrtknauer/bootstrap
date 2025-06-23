#!/bin/bash
#
# https://docs.astral.sh/uv/getting-started/installation/

set -eux

curl \
    --fail \
    --location \
    --show-error \
    --silent \
    https://astral.sh/uv/install.sh \
    | sh

uv self update
uv --version
