#!/bin/bash

set -eux

REPOSITORIES_JSON_FILE="repositories.json"
if [[ ! -f "${REPOSITORIES_JSON_FILE}" ]]; then
    exit 1
fi

jq --compact-output '.[]' "${REPOSITORIES_JSON_FILE}" | while read -r obj; do
    GIT_URL="$(echo "${obj}" | jq --raw-output '.upstream')"

    RAW_PATH="$(echo "${obj}" | jq --raw-output '.path')"
    EXPANDED_PATH="${RAW_PATH/\~/$HOME}"

    echo "${GIT_URL}"
    echo "${EXPANDED_PATH}"
done
