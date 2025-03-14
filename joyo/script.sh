#!/bin/bash

# Iterate over the base files
for i in {1..4}; do
    base_file="base$i.md"
    dst_file="dst$i.md"
    
    # Ensure the destination file is empty
    > "$dst_file"
    
    # Read each line of the base file
    while IFS= read -r line; do
        # Get the first character
        first_char="${line:0:1}"
        
        # Find and append the matching line from src.md to the destination file
        grep "$first_char" src.md >> "$dst_file"
    done < "$base_file"
done