# Machine Bootstrap

Installation scripts and configuration files for bootstrapping a new
development machine.

## Usage

```bash
# Clone repository.
$ git clone git@github.com:jrtknauer/bootstrap.git

# Run pre-requisite installation script.
$ pushd install && ./preinstall.sh && popd

# Complete Docker installation.
$ newgrp docker

# Stow configuration files.
$ pushd dotfiles && ./stow.sh && popd

# Install everything else.
$ pushd install && ./install.sh && popd
```

## Development

The repository linting and formatting is handled by the `justfile` recipes
`lint` and `format`. `just` is installed as part of the installation script.
See `install/just`.
