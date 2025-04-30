#!/bin/bash
#
# Install ruff.
#
# https://docs.astral.sh/ruff/installation/

set -eux

LSP_VENVS="${HOME}/.local/share/lsp"
mkdir --parents "${LSP_VENVS}"

uv venv "${LSP_VENVS}/ruff"
source "${LSP_VENVS}/ruff/bin/activate"

uv pip install ruff
ln \
    --force \
    --symbolic \
    "${LSP_VENVS}/ruff/bin/ruff" \
    "${HOME}/.local/bin/ruff"
