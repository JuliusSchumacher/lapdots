import json
import sys

ws_list = json.loads(sys.argv[1])

with open('/home/factor/.cache/wal/colors.json') as f:
    walcolors = json.load(f)

string = ""
for i,t in enumerate(ws_list):
    if t['visible']:
        string = string + '%{F' + walcolors['colors']['color2'] + '}' +  t['name'] + '%{F' + walcolors['special']['foreground'] + '}'+ ' '
    else:
        string = string + t['name'] + ' '

print(string)


