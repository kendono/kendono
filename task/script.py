import requests
from bs4 import BeautifulSoup

# Function to fetch the kJapanese data from the UniHan database
def get_kJapanese_data(glyph):
    url = f"https://www.unicode.org/cgi-bin/GetUnihanData.pl?codepoint={glyph}"
    response = requests.get(url)
    
    if response.status_code != 200:
        print(f"Failed to fetch data for {glyph}")
        return None
    
    # Parse the HTML response
    soup = BeautifulSoup(response.content, 'html.parser')
    
    # Find the tr tag with kJapanese data
    kJapanese_td = None
    for tr in soup.find_all('tr'):
        td = tr.find('td')
        if td and td.text.strip() == 'kJapanese':
            kJapanese_td = tr.find_all('td')[1]
            break
    
    if kJapanese_td:
        kJapanese_data = kJapanese_td.find('code').text.strip()
        return kJapanese_data
    else:
        print(f"kJapanese data not found for {glyph}")
        return None

# Function to process base.md and append to dst.md
def process_file():
    with open("base.md", "r", encoding="utf-8") as base_file, open("dst.md", "a", encoding="utf-8") as dst_file:
        for line in base_file:
            # Get the first character of the line
            first_char = line.strip()[0]
            print(f"Processing character: {first_char}")
            
            # Fetch kJapanese data for the character
            kJapanese_data = get_kJapanese_data(first_char)
            
            if kJapanese_data:
                # Write the output in the desired format
                output_line = f"| {first_char} | {kJapanese_data.replace(' ', '、')} |\n"
                dst_file.write(output_line)
                dst_file.flush()  # Ensure the data is written to the file immediately
                print(f"Appended: {output_line.strip()}")
            else:
                print(f"Skipping character {first_char} (no kJapanese data found).")

# Execute the process
if __name__ == "__main__":
    process_file()
