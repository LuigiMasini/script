#!/usr/bin/python

import json
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--infile', nargs=1,
                    help="JSON file to be processed",
                    type=argparse.FileType('r'))
arguments = parser.parse_args()

# Loading a JSON object returns a dict.
d = json.load(arguments.infile[0])

for i in d["events"]:
	print(i["segs"][0]["utf8"].encode("utf8"))