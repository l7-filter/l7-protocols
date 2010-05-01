#!/bin/bash

for pattern in ../*/*.pat; do 
	printf `basename $pattern .pat`\\t
	./timeit.sh $pattern 2> /dev/stdout | grep user\  | cut -du -f 1
done
