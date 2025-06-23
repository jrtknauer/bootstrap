#!/bin/bash

function path::exists() {
    local path="$1"

    if [[ -z "${path}" ]]; then
        return 1
    fi

    case ":${PATH}:" in
        *":${path}:"*) return 0 ;;
        *) return 1 ;;
    esac
}

function path::prepend() {
    local path="$1"

    if [[ ! -d "${path}" ]]; then
        return 1
    fi

    if path::exists "${path}"; then
        return 0
    fi

    export PATH="${path}:${PATH}"
}

function path::append() {
    local path="$1"

    if [[ ! -d "${path}" ]]; then
        return 1
    fi

    if path::exists "${path}"; then
        return 0
    fi

    export PATH="${PATH}:${path}"
}
