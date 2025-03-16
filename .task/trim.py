import re

def clean_file(filename):
    with open(filename, 'r', encoding='utf-8') as file:
        content = file.read()
    
    # Remove Hangul characters, whitespace, parentheses, slashes, and numbers
    cleaned_content = re.sub(r'[\uAC00-\uD7A3\s()\/\d]+', '', content)
    
    # Insert newline after each character
    formatted_content = '\n'.join(cleaned_content)
    
    with open(filename, 'w', encoding='utf-8') as file:
        file.write(formatted_content)

if __name__ == "__main__":
    clean_file("Untitled.md")
    