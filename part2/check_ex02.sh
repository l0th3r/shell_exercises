#!/usr/bin/bash

shopt -s lastpipe

HELLO=
source ex02.sh 

if [ -z "$output" ]
then
	if [ "`env | grep -E ^HELLO=`" = "HELLO=World" ]
	then
		echo OK
	else
		echo NOT OK: \$HELLO not listed as an environment variable
	fi
else
	echo NOT OK: Output should be empty, not \"$output\"
fi

