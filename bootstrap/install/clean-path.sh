#!/bin/bash

# Get the current PATH variable
original_path="${PATH}"

# Use awk to process the path, trimming whitespace and removing duplicates,
# and outputting as a colon-separated string.
# RS=: sets the input record separator to colon (splits by :).
# ORS=: sets the output record separator to colon (joins with :).
# { trimmed = $0; sub(/^[[:space:]]+/, "", trimmed); sub(/[[:space:]]+$/, "", trimmed) }
#   - Creates a 'trimmed' variable from the current record ($0).
#   - Removes leading whitespace from 'trimmed'.
#   - Removes trailing whitespace from 'trimmed).
# !seen[trimmed]++ checks if the trimmed directory entry has been seen before.
# { print trimmed } prints the trimmed directory if it hasn't been seen.
# The sub(/^:/, "") at the end removes a leading colon if the original PATH started with one
# (though less common, it handles edge cases).
# The sed command is no longer needed to remove a trailing colon because awk manages ORS.
cleaned_path=$(echo "${original_path}" | awk -v RS=: -v ORS=: '
  {
    # Trim leading and trailing whitespace
    trimmed = $0
    sub(/^[[:space:]]+/, "", trimmed)
    sub(/[[:space:]]+$/, "", trimmed)
  }
  !seen[trimmed]++ {
    print trimmed
  }
' | sed 's/:$//') # Still need sed to remove the *final* trailing colon from ORS

# Output the cleaned path
echo "Original PATH:"
echo "${original_path}"
echo ""
echo "Cleaned PATH (duplicates and extra whitespace removed):"
echo "${cleaned_path}"

# If you want to export the cleaned path to your current shell session,
# uncomment the following line and make sure to source the script:
export PATH="${cleaned_path}"
