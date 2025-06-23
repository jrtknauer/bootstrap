#!/bin/bash

set -eux

shfmt \
    --diff \
    --list \
    .

find . -type f -name "*.sh" -print0 \
    | xargs --null --no-run-if-empty shellcheck --external-sources --severity=style

stylua --allow-hidden --check --syntax Lua51 .
