#!/usr/bin/python2
import sys

if len(sys.argv) != 2:
    # CSV Export from CSV-CAM-Format
    print "%s <path to csv file>"%(sys.argv[0])
    sys.exit(1)
csv_file = sys.argv[1]

data = []
with open(csv_file, 'r') as fp:
    for line in fp:
        data.append(line.split(';'))

entries = map(lambda x: float(x[-3].replace(',', '.').replace('"', '')), data[1:])
for entry in entries:
    print entry
print "-----------------"
print sum(entries)
