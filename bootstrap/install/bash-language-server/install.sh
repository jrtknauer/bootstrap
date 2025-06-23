#!/bin/bash
#
# https://github.com/bash-lsp/bash-language-server

set -eux

npm install --global bash-language-server > /dev/null

bash-language-server --help
