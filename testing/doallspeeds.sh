#!/bin/bash

# Print a complete report of speeds.

# Relies on output format of ./timeit.sh

if [ ! $1 ]; then
	gnu=1
	henry=1
elif [ $1 == "gnu" ]; then
	gnu=1
elif [ $1 == "henry" ]; then
	henry=1
else
	echo huh?  Say \"gnu\", \"henry\" or nothing.
	exit 1
fi

printf proto
if [ $gnu ]; then printf \\tgnu; fi
if [ $henry ]; then printf \\thenry; fi
printf \\n

for f in ../*/*.pat; do 
	printf `basename $f .pat`

	if [ $gnu ]; then 
		gtime=`./timeit.sh $f gnu   real | grep Total | cut -d\  -f 2`
		printf \\t$gtime
	fi
	if [ $henry ]; then 
		htime=`./timeit.sh $f henry real | grep Total | cut -d\  -f 2`
		printf \\t$htime
	fi
	printf \\n
done
