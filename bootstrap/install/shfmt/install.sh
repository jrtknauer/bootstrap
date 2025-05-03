#!/bin/bash
#
# Install shfmt.
# https://github.com/mvdan/sh

set -eux

go install mvdan.cc/sh/v3/cmd/shfmt@latest

shfmt --version
