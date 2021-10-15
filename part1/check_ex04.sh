#!/usr/bin/bash

output=`seq 100 | sh ex04.sh`
if [ $output -eq 42  ]
then
	echo OK
else
	echo NOT OK: Wrong output: $output
fi

