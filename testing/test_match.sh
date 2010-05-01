#!/bin/bash

extract()
{
	if [ -r $1 ]; then
	# this can miss psuedo-valid files that have crap after the pattern
		cat $1 | grep -v ^$ | grep -v ^# | tail -1
	else
		echo $1
	fi
}

if [ ! $1 ]; then
	echo Please specify a pattern or pattern file.
	exit 1
fi

if [ ! $2 ]; then
	echo Using the GNU \(userspace\) library.
	echo You can change this by saying \"henry\" as the second arg.
	matchprog=./match-gnu
elif [ $2 == "henry" ]; then
	echo Using the Henry Spencer \(kernel\) regex library.
	matchprog=./match-henry
elif [ $2 == "gnu" ]; then
	echo Using the GNU \(userspace\) library.
	matchprog=./match-gnu
else
	echo Didn\'t understand what library you wanted.
	echo Using the GNU \(userspace\) library.
	matchprog=./match-gnu
fi

if [ $3 ]; then
	times=$3
else
	times=500
	echo Checking against 500 randomly generated strings.
	echo You can change this by giving a number as the third arg.
fi

if [ -x ./randchars ] && [ -x $matchprog ] && [ -x ./randprintable ]; then
	true
else
	echo Can\'t find randchars, $matchprog or randprintable.  
	echo They should be in this directory.  Did you say \"make\"?
	exit 1
fi

printf "Out of $times random streams, this many match: "

pattern="`extract $1`"

for f in `seq $times`; do
	if [ $3 ]; then printf . > /dev/stderr; fi
	if ! ./randchars | $matchprog "$pattern"; then exit 1; fi
done | grep -v No -c

printf "Out of $times printable random streams, this many match: " 

for f in `seq $times`; do
	if [ $3 ]; then printf . > /dev/stderr; fi
	if ! ./randprintable | $matchprog "$pattern"; then exit 1; fi
done | grep -v No -c
