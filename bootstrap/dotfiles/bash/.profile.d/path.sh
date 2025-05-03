#!/bin/bash

PATHS_TO_ADD=(
    "${HOME}/.local/bin"
    "${HOME}/go/bin"
)

for add_path in "${PATHS_TO_ADD[@]}"; do
    if [ -d "${add_path}" ]; then
        case ":${PATH}:" in
            *":${add_path}:"*) ;;
            *)
                export PATH="${add_path}:${PATH}"
                ;;
        esac
    fi
done
