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

if [ -x ./randprintable ] && [ -x ./test_speed ]; then
	true
else
	echo Can\'t find randprintable or test_speed.
	echo They should be in this directory.  Did you say \"make\"?
	exit 1
fi

echo

for arg in $@; do
	echo $arg
	./randprintable | time ./test_speed "`extract $arg`"
done
