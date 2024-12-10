#!/usr/bin/env bash

alias clip="xclip -selection clipboard"

if [ -f "${HOME}"/.bash_env ]; then
	source "${HOME}"/.bash_env
fi

if [ -f "${HOME}"/.bash_path ]; then
	source "${HOME}"/.bash_path
fi
