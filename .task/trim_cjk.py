import re

# Define input and output file
input_file = "Untitled.md"

# Read the content of the file
with open(input_file, "r", encoding="utf-8") as file:
    content = file.read()

# Regex to keep only CJK Chinese characters
processed_content = re.sub(r"[^\u4E00-\u9FFF]", "", content)

# Write the cleaned content back to the file
with open(input_file, "w", encoding="utf-8") as file:
    file.write(processed_content)

print("Non-CJK characters removed successfully.")
