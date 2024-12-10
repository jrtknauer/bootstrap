#!/usr/bin/env bash
#
# Install Proton VPN as per [0].
#
# [0] https://protonvpn.com/support/official-linux-vpn-ubuntu/

function install_proton_vpn() {
    local deb="protonvpn-stable-release_1.0.6_all.deb"
    wget "https://repo.protonvpn.com/debian/dists/stable/main/binary-all/${deb}"
    sudo dpkg -i "${deb}"
    sudo apt-get update
    sudo apt install --yes proton-vpn-gnome-desktop
    rm --force "${deb}"
}

function main() {
    install_proton_vpn
}

main
