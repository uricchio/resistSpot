
import sys
import numpy as np
from collections import defaultdict

def computeDiff(s,cat):
    totRSA = 0
    posRSA = 0
    totSA = 0
    posSA = 0
    for stud in s:
        for assign in s[stud]:
            if assign[0] == "SA" and assign[cat]:
                posSA += int(assign[cat])
                totSA += 1
            elif assign[cat]:
                posRSA += int(assign[cat])
                totRSA += 1 
 
    return (posRSA/totRSA-posSA/totSA,posRSA/totRSA,posSA/totSA)
 
def permute(s):
    for stud in s:
        vals = []
        for assign in s[stud]:
            vals.append(assign[0])
        vals = np.random.choice(vals,len(vals),replace=False)
        i  = 0
        for assign in s[stud]:
            assign[0] =vals[i]        
            i += 1
    return s
           
fh = open(sys.argv[1],'r')
cat = int(sys.argv[2])
students = {}

catPos = {}
for line in fh:
    cats = line.strip().split(',')
    for i in range(len(cats)):
        catPos[i] = cats[i]
    break

for line in fh:
    data = line.strip().split(',')
    if data[0] not in students:
        students[data[0]] = []
    students[data[0]].append([data[1][:-1]]+data[1:])


realDiff = computeDiff(students,cat)
print(catPos[cat],"RSA",realDiff[1])
print(catPos[cat], "SA", realDiff[2]) 




