#!/bin/bash

# File paths
base_file="base.md"
dst_file="dst.md"

# Iterate through each line of 'base.md'
while IFS= read -r line; do
    # Get the first character of the line
    first_char="${line:0:1}"

    # Check if the first character exists in 'dst.md'
    if grep -q "^$first_char" "$dst_file"; then
        # If found, delete the line from 'dst.md'
        sed -i "/^$first_char/d" "$dst_file"
    fi
done < "$base_file"
