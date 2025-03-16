def process_text(input_text):
    output_text = ""
    char_count = 0
    
    for i in range(len(input_text)):
        char_count += 1
        output_text += input_text[i]
        
        # Insert whitespace after every 5 characters
        if char_count % 5 == 0 and char_count % 20 != 0 and char_count % 100 != 0:
            output_text += " "
        
        # Insert a newline after every 20 characters
        if char_count % 20 == 0 and char_count % 100 != 0:
            output_text += "\n"
        
        # Insert two newlines after every 100 characters
        if char_count % 100 == 0:
            output_text += "\n\n"
    
    return output_text

# Example usage:
with open('base.md', 'r', encoding='utf-8') as file:
    input_text = file.read()

processed_text = process_text(input_text)

# Save the processed text back to the file or another file
with open('processed_base.md', 'w', encoding='utf-8') as file:
    file.write(processed_text)
