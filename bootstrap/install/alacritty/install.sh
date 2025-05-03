#!/bin/bash
#
# Install Alacritty
# https://github.com/alacritty/alacritty

set -eux

VERSION="0.15.1"
TAR="alacritty-v${VERSION}.tar.gz"
DOWNLOAD_URL="https://github.com/alacritty/alacritty/archive/refs/tags/v${VERSION}.tar.gz"
DOWNLOAD_PATH="/tmp/${TAR}"
INSTALL_DIR="${HOME}/.bootstrap/alacritty/${VERSION}"

sudo apt-get update
sudo apt-get \
    --quiet \
    --yes \
    install \
    cargo \
    cmake \
    curl \
    g++ \
    gzip \
    pkg-config \
    libfreetype6-dev \
    libfontconfig1-dev \
    libxcb-xfixes0-dev \
    libxkbcommon-dev \
    python3 \
    scdoc

curl \
    --fail \
    --location \
    --show-error \
    --silent \
    --output "${DOWNLOAD_PATH}" \
    "${DOWNLOAD_URL}"

mkdir --parents "${INSTALL_DIR}"
tar \
    --directory "${INSTALL_DIR}" \
    --extract \
    --gzip \
    --strip-components=1 \
    --verbose \
    --file="${DOWNLOAD_PATH}"

pushd "${INSTALL_DIR}"
cargo build --release
popd

ln \
    --force \
    --symbolic \
    "${HOME}/.bootstrap/alacritty/${VERSION}/target/release/alacritty" \
    "${HOME}/.local/bin/alacritty"

sudo tic -xe alacritty,alacritty-direct "${INSTALL_DIR}/extra/alacritty.info"
infocmp alacritty

sudo cp "${INSTALL_DIR}/extra/logo/alacritty-term.svg" "/usr/share/pixmaps/Alacritty.svg"
sudo desktop-file-install "${INSTALL_DIR}/extra/linux/Alacritty.desktop"

sudo mkdir --parents /usr/local/share/man/man1
sudo mkdir --parents /usr/local/share/man/man5

pushd "${INSTALL_DIR}"
scdoc \
    < extra/man/alacritty.1.scd \
    | gzip -c \
    | sudo tee /usr/local/share/man/man1/alacritty.1.gz \
        > /dev/null
scdoc \
    < extra/man/alacritty-msg.1.scd \
    | gzip -c \
    | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz \
        > /dev/null
scdoc \
    < extra/man/alacritty.5.scd \
    | gzip -c \
    | sudo tee /usr/local/share/man/man5/alacritty.5.gz \
        > /dev/null
scdoc \
    < extra/man/alacritty-bindings.5.scd \
    | gzip -c \
    | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz \
        > /dev/null
popd

sudo apt-get \
    --quiet \
    --yes \
    purge \
    pkg-config \
    libfreetype6-dev \
    libfontconfig1-dev \
    libxcb-xfixes0-dev \
    libxkbcommon-dev \
    scdoc
sudo apt-get \
    --quiet \
    --yes \
    autoremove

alacritty --version
