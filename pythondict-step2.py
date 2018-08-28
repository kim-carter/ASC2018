##
## Kim Carter 2018.   Testing python dictionary hashtable speed.  Step 2 tests insert then search performance
## 

import datetime

pydict = {}

testfile = open("testdata.tsv", 'r')

t1 = datetime.datetime.now()
for line in testfile:
    cols = line.strip().split("\t")
    pydict[cols[0]] = cols[1]
testfile.close()


testfile = open("testsearch.tsv", 'r')

t1 = datetime.datetime.now()
count=0
for line in testfile:
    cols = line.strip().split("\t")

    if cols[1] in pydict:
        tmp = pydict[cols[1]]
    else:
        pass

    count=count+1
    if (count % 100000 == 0):
        t2 = datetime.datetime.now()   
        delta = t2-t1
        print(delta.total_seconds())
        t1 = datetime.datetime.now()


