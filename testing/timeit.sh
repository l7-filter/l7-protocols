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
	echo Syntax: ./timeit.sh patternfile [all]
	echo "all" tests against all characters, not just printable ones.
	exit 1
fi

if [ -x ./randchars ] && [ -x ./randprintable ] && [ -x ./test_speed ]; then
	true
else
	echo Can\'t find randchars, randprintable or test_speed.
	echo They should be in this directory.  Did you say \"make\"?
	exit 1
fi

echo

for arg in $@; do
	echo $arg
	if [ $2 ]; then
		./randchars | time ./test_speed "`extract $arg`"
	else
		./randprintable | time ./test_speed "`extract $arg`"
	fi
done
