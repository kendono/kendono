import sys

def remove_duplicate_lines(n):
    reference_file = f"src{n}.md"
    previous_lines = set()
    
    # Collect lines from src1.md to src{n-1}.md
    for i in range(1, n):
        filename = f"src{i}.md"
        try:
            with open(filename, 'r', encoding='utf-8') as file:
                previous_lines.update(file.readlines())
        except FileNotFoundError:
            print(f"Warning: {filename} not found.")
    
    # Read src{n}.md and filter lines
    try:
        with open(reference_file, 'r', encoding='utf-8') as file:
            lines = file.readlines()
        
        filtered_lines = [line for line in lines if line not in previous_lines]
        
        with open(reference_file, 'w', encoding='utf-8') as file:
            file.writelines(filtered_lines)
    except FileNotFoundError:
        print(f"Error: {reference_file} not found.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <n>")
    else:
        remove_duplicate_lines(int(sys.argv[1]))