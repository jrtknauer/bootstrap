#!/bin/bash
#
# Install basedpyright.
# https://docs.basedpyright.com/latest/installation/command-line-and-language-server/

set -eux

LSP_VENVS="${HOME}/.local/share/lsp"
mkdir --parents "${LSP_VENVS}"

uv venv "${LSP_VENVS}/basedpyright"

# shellcheck source=/dev/null
source "${LSP_VENVS}/basedpyright/bin/activate"

uv pip install basedpyright
ln \
    --force \
    --symbolic \
    "${LSP_VENVS}/basedpyright/bin/basedpyright-langserver" \
    "${HOME}/.local/bin/basedpyright-langserver"

which basedpyright-langserver
