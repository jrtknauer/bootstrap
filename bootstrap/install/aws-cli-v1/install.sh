#!/bin/bash
#
# https://docs.aws.amazon.com/cli/v1/userguide/install-linux.html

set -eux

DOWNLOAD_URL="https://s3.amazonaws.com/aws-cli/awscli-bundle.zip"
OUTPUT="/tmp/awscli-bundle.zip"

sudo apt-get \
    --quiet \
    --yes \
    install \
    python3.12-venv

curl \
    --fail \
    --location \
    --output "${OUTPUT}" \
    --show-error \
    --silent \
    "${DOWNLOAD_URL}"

unzip \
    -o \
    -q \
    "${OUTPUT}" \
    -d "${HOME}/.aws-v1"

pushd "${HOME}/.aws-v1/awscli-bundle"
/bin/python3 ./install -b "${HOME}/.local/bin/aws"
popd

aws --version
