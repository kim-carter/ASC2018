##
## Kim Carter 2018.   Testin python dictionary hashtable speed.  
## 


import datetime

pydict = {}

testfile = open("testdata.tsv", 'r')

t1 = datetime.datetime.now()
count=0
for line in testfile:
    cols = line.strip().split("\t")
    pydict[cols[0]] = cols[1]

    count=count+1
    if (count % 100000 == 0):
        t2 = datetime.datetime.now()   
        delta = t2-t1
        print(delta.total_seconds())
        t1 = datetime.datetime.now()


