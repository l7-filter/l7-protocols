#!/bin/bash

# "man 1 time" for details
export TIME="%U seconds"

add()
{
	if ! dc -e ""; then
	        echo you do not have dc, so I cannot add these numbers...
	        exit 1
	fi

	n=0
	tot=0

	while read n; do
	        tot=`dc -e "$n $tot + pop" 2> /dev/null`
	done

	echo $tot seconds
}

extract()
{
	if [ -r $1 ] && [ -f $1 ]; then
		cat $1 | grep -v ^$ | grep -v ^# | tail -1
	else
		echo > /dev/stderr
		echo Arg is not a readable file, so assuming it is a regexp. > /dev/stderr
		echo $1
	fi
}

if [ ! $3 ] || [ $2 == "-h" ] || [ $2 == "--help" ]; then
	echo Syntax: ./timeit.sh patternfile\|regex henry\|gnu all\|print\|real [data_files]
	echo Specify a file for patternfile or a regular expression for regex
	echo \"henry\" uses the Henry Spencer \(kernel\) regex library
	echo \"gnu\" uses the GNU \(userspace\) regex library
	echo \"all\" tests against all characters, 
	echo \"print\" only against printable ones,
	echo \"real\" against some real data.
	echo In \"real\" mode, if data files are specified, they are used,
	echo otherwise, all files in ./data/ are used.
	exit 1
fi

echo
if [ $2 == "henry" ]; then
        echo Using the Henry Spencer \(kernel\) regex library.
        speedprog=./test_speed-henry
elif [ $2 == "gnu" ]; then
        echo Using the GNU \(userspace\) library.
        speedprog=./test_speed-gnu
else
        echo Didn\'t understand what library you wanted.
	echo Please give either \"henry\" or \"gnu\".
	exit 1
fi

if [ -x ./randchars ] && [ -x ./randprintable ] && [ -x $speedprog ]; then
	true
else
	echo Can\'t find randchars, randprintable or test_speed.
	echo They should be in this directory.  Did you say \"make\"?
	exit 1
fi

echo Timing $1
if [ $3 == "all" ]; then
	echo Using all characters
	if ! ./randchars | time $speedprog "`extract $1`" verbose; then
		echo $speedprog failed. > /dev/stderr
		exit 1
	fi
elif [ $3 == "print" ]; then
	echo Using only printable characters
	if ! ./randprintable | time $speedprog "`extract $1`" verbose; then
		echo $speedprog failed. > /dev/stderr
		exit 1
	fi
elif [ $3 == "real" ]; then
	echo Using some real data

	# uncomment to be able to exit all at once
	trap "rm tmp.$$; echo; exit 1" 2

	if [ $4 ]; then 
		for f in $@; do
			if [ -r $f ] && [ $f != $1 ] && [ $f != $2 ] && [ $f != $3 ]; then
				printf $f\\t
				echo `extract $1`
				if ! cat $f | time $speedprog "`extract $1`" 2> /dev/stdout | tee -a tmp.$$; then
					echo $speedprog failed. > /dev/stderr
					exit 1
				fi
			fi
		done
	else
		for f in data/*; do
			printf $f\\t
			if ! cat $f | time $speedprog "`extract $1`" 2> /dev/stdout | tee -a tmp.$$; then
				echo $speedprog failed. > /dev/stderr
				exit 1
			fi
		done
	fi

	printf Total:\ 
	cat tmp.$$ | cut -d\  -f 2 | add

	rm tmp.$$
else
	echo Please specify \"all\", \"print\" or \"real\"> /dev/stderr
	exit 1
fi
