#!/usr/bin/env bash

WORKSPACES=(
    "${HOME}"
    "${HOME}/personal"
    "${HOME}/work"
    "${HOME}/work/canonical"
)
WORKSPACE="$(
    find \
        "${WORKSPACES[@]}" \
        -mindepth 1 \
        -maxdepth 1 \
        -type d \
    | fzf \
        --cycle \
        --border=sharp \
        --border-label="Tmux Session" \
)"
if [[ -z "${WORKSPACE}" ]]; then
    exit 0
fi

NAME="$(basename "${WORKSPACE}" | tr . _)"

if ! tmux has-session -t="${NAME}" 2> /dev/null; then
    tmux new-session \
        -d \
        -s "${NAME}" \
        -c "${WORKSPACE}"
fi

if [[ ! -z "${TMUX}" ]]; then
    tmux switch-client -t "${NAME}"
    exit 0
fi

tmux attach-session -t "${NAME}"
