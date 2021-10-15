#!/usr/bin/bash

output=`sh ex01.sh`
if [  "$output" = "Hello World" ]
then
	if [ `grep -cE "(Hello|World)" ex01.sh` -ne 0 ]
	then
		echo NOT OK: Forbidden words
	else
		echo OK
	fi
else
	echo NOT OK: Invalid output
fi

