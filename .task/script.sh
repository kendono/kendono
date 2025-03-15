#!/bin/bash

# Ensure the encoding is set properly for reading and writing files
export LANG=C.UTF-8

# Initialize line number and input/output files
line_number=1
src_file="src.md"
dst_file="dst.md"

# Clear the destination file before starting
> "$dst_file"

# Function to process and format the lines as required
process_lines() {
    local start_line=$1
    local end_line=$2

    # Collect lines from start_line to end_line
    lines=$(sed -n "${start_line},${end_line}p" "$src_file")

    # Split each line into its first character and group them by 10 characters
    formatted_line=""
    for line in $lines; do
        first_char="${line:0:1}"  # Get the first character
        # Group by 10 characters, insert whitespace between each character, and <br> between groups
        grouped=""
        for i in $(seq 0 9 ${#first_char}); do
            group="${first_char:$i:1}"
            if [ -n "$group" ]; then
                grouped="$grouped $group"
            fi
            # Insert <br> between the groups of 10 characters
            if [ $(($i % 10)) -eq 9 ]; then
                formatted_line="$formatted_line$grouped <br>"
                grouped=""
            fi
        done
    done

    # Flush formatted_line to the destination file
    echo "$formatted_line" >> "$dst_file"
}

# Main loop to process the lines
while IFS= read -r line; do
    # Every 95th line
    if (( line_number % 95 == 1 )); then
        # Print the line and then move to the next
        echo "$line" >> "$dst_file"
    fi

    # Collect lines from '95n + 2' to '95n + 1' 
    if (( (line_number - 2) % 95 == 0 )); then
        start_line=$line_number
        end_line=$((line_number + 94))
        process_lines "$start_line" "$end_line"
    fi

    line_number=$((line_number + 1))
done < "$src_file"
