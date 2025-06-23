#!/bin/bash
#
# Some systems (e.g. WSL) do not start the ssh-agent.

if [[ -z "${SSH_AUTH_SOCK}" ]]; then
    eval "$(ssh-agent -s)" > /dev/null
fi
