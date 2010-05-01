#!/bin/bash

extract()
{
	if [ -r $1 ]; then
		cat $1 | grep -v ^$ | grep -v ^# | tail -1
	else
		echo $1
	fi
}

if [ ! $1 ]; then
	echo Please specify a pattern or pattern file.
	exit 1
fi

if [ -x ./randchars ] && [ -x ./match ] && [ -x ./randprintable ]; then
	true
else
	echo Can\'t find randchars, match or randprintable.  
	echo They should be in this directory.  Did you say \"make\"?
	exit 1
fi

for arg in $@; do
	echo $arg

	printf "Out of 500 random streams, about this many will match:" 

	for f in `seq 500`; do
		./randchars | ./match "`extract $arg`" | grep -v No
	done | wc -l

	printf "Out of 500 printable random streams, about this many will match:" 

	for f in `seq 500`; do
		./randprintable | ./match "`extract $arg`" | grep -v No
	done | wc -l
done
