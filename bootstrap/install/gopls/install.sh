#!/bin/bash

set -eux

go install golang.org/x/tools/gopls@latest

gopls version
