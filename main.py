import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse, urljoin


def get_all_paths(url):
    response = requests.get(url)
    
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        paths = set()

        # Extract href attributes from all <a> tags
        for a_tag in soup.find_all('a', href=True):
            href = a_tag['href']
            if href.startswith('/'):
                paths.add(href)

        return paths

    else:
        print(f"Failed to retrieve content from {url}. Status code: {response.status_code}")
        return None

# Example usage
url = 'https://example.com'
paths = get_all_paths(url)

if paths is not None:
    print("All Paths:")
    for path in paths:
        print(path)
