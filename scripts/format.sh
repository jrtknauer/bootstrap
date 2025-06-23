#!/bin/bash

set -eux

shfmt \
    --list \
    --write \
    .

stylua --allow-hidden --syntax Lua51 --verify .
