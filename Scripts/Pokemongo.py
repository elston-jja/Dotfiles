#!/usr/bin/env python3

import requests, re
from bs4 import BeautifulSoup

URL = 'http://www.mmoserverstatus.com/pokemon_go'

# Pick the code for the country you live in or that you're closest to.
country = 7

countries = {
    0: 'United States',
    1: 'Argentina',
    2: 'Australia',
    3: 'Austria',
    4: 'Belgium',
    5: 'Brazil',
    6: 'Bulgaria',
    7: 'Canada',
    8: 'Chile',
    9: 'Croatia',
    10: 'Czech Republic',
    11: 'Denmark',
    12: 'Estonia',
    13: 'Finland',
    14: 'Germany',
    15: 'Greece',
    16: 'Hong Kong',
    17: 'Hungary',
    18: 'Iceland',
    19: 'India',
    20: 'Indonesia',
    21: 'Ireland',
    22: 'Italy',
    23: 'Japan',
    24: 'Japan',
    25: 'Latvia',
    26: 'Lithuania',
    27: 'Lithuania',
    28: 'Luxembourg',
    29: 'Netherlands',
    30: 'New Zealand',
    31: 'Norway',
    32: 'Phillippines',
    33: 'Poland',
    34: 'Portugal',
    35: 'Romania',
    36: 'Russia',
    37: 'Singapore',
    38: 'Slovakia',
    39: 'Slovenia',
    40: 'Spain',
    41: 'Sweden',
    42: 'Switzerland',
    43: 'Taiwan',
    44: 'Thailand',
    45: 'Turkey',
    46: 'United Kingdom'
    }

# Getting information
r = requests.get(URL)
try:
    import lxml
    soup = BeautifulSoup(r.text, 'lxml')
except ImportError:
    soup = BeautifulSoup(r.text, 'html.parser')

c = countries[country]
found = soup.find(text=re.compile(' ?' + c))
parent = found.find_parent()
c_status = parent.i.attrs['class']

# Get game status
g = soup.find(text=' Game stable')
g_parent = g.find_parent()
game_status = g_parent.i.attrs['class']

# Output
if 'red' in c_status or 'red' in game_status:
    print('  PKGO Down!')
elif 'green' in c_status and 'green' in game_status:
    exit(0)
