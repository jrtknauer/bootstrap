#!/usr/bin/env bash
#
# Create and/or switch to tmux sessions with workspace lookup.

# Create and attach to a new `tmux` session.
# Arguments:
#   Session name to create.
#   Start directory for the session.
function new_session() {
    local name="$1"
    local dir="$2"

    tmux new-session \
        -d \
        -s "${name}" \
        -c "${dir}"

    tmux new-window \
        -d \
        -t "${name}" \
        -c "${dir}" \
        nvim .

    tmux attach-session -t "${name}"
}

WORKSPACES=(
    "${HOME}"
    "${HOME}/personal"
    "${HOME}/work/canonical"
)
WORKSPACE="$(find "${WORKSPACES[@]}" -mindepth 1 -maxdepth 1 -type d | fzf)"
if [[ -z "${WORKSPACE}" ]]; then
    exit 0
fi

NAME="$(basename "${WORKSPACE}" | tr . _)"
TMUX_RUNNING="$(pgrep tmux)"
if [[ -z "${TMUX_RUNNING}" ]]; then
    new_session "${NAME}" "${WORKSPACE}"
    exit 0
fi

if ! tmux has-session -t="${NAME}" 2> /dev/null; then
    new_session "${NAME}" "${WORKSPACE}"
fi

tmux switch-client -t "${NAME}"
