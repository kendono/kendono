def process_md(src_file, dst_file):
    with open(src_file, 'r') as src, open(dst_file, 'w') as dst:
        lines = src.readlines()
        line_count = len(lines)
        
        i = 0
        while i < line_count:
            # Step 1: Print separator and handle '95n + 1'
            if (i + 1) % 95 == 1:
                dst.write('-------------------------------------\n')
                dst.write(lines[i])  # print the line to 'dst.md'
                i += 1  # move to next line

            # Step 2: Collect lines from '95n + 2' to '95(n + 1)'
            if (i + 1) % 95 == 2:
                # Collect 95n + 2 to 95n + 3 (this includes 2 lines)
                group_lines = [lines[i], lines[i + 1]]  
                collected_text = ''.join(group_lines)

                # Process each character
                processed_line = []
                for j in range(0, len(collected_text), 10):
                    group = collected_text[j:j + 10]  # Group by 10 characters
                    spaced_group = ' '.join(group)  # Insert space between characters
                    processed_line.append(spaced_group)

                # Insert <br> between groups
                final_line = ' <br> '.join(processed_line)
                dst.write(final_line.strip() + '\n')  # flush into one line
                i += 2  # Move to the next set of lines

# Call the function with your file paths
process_md('src.md', 'dst.md')
