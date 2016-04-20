#!/usr/bin/python
import sys
# Python code to do the same:
def hailstone(x):
    def isodd(x):
	return (x%2)==1 or x==0

    count=0
    n=int(x)
    while n>1:
    	print (n)
	if isodd(n):
    	    n = 3*n+1
	else:
            n = n/2
	count+=1
    print ('It took {} iterations to show that {} converges to 1'.format(count,x) )

hailstone(sys.argv[1])

