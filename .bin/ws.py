import json
import sys

ws_list = json.loads(sys.argv[1])

string = ""
for i,t in enumerate(ws_list):
    if t['visible']:
        string = string + '%{F#a54242}' +  t['name'] + '%{F#ffffff}'+ ' '
    else:
        string = string + t['name'] + ' '

print(string)


