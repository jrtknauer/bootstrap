#!/bin/bash

# Get the current PATH variable
current_path="${PATH}"

echo "PATH variable (one entry per line):"
echo "-------------------------------------"

# Use tr to replace colons with newlines
# -s : squeezes multiple consecutive colons into a single one before replacing (optional, but good practice)
echo "${current_path}" | tr -s ':' '\n'
