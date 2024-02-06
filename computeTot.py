
import sys
import numpy as np
from collections import defaultdict

fh = open(sys.argv[1],'r')
cat = int(sys.argv[2])
students = {}

for line in fh:
    break

for line in fh:
    data = line.strip().split(',')
    if data[0] not in students:
        students[data[0]] = []
    students[data[0]].append([data[1][:-1]]+data[1:])

tots = {}
for student in students:
    for assignment in students[student]:
        if assignment[cat] != '':
            if assignment[1] not in tots:
                tots[assignment[1]] = 0
            tots[assignment[1]] += 1            

print(tots)





