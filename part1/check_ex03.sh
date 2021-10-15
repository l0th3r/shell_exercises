#!/usr/bin/bash

output=`sh ex03.sh | uniq`
count=`sh ex03.sh | wc -l`
if [ $count -eq 112  ]
then
	if [ $output -ne 112  ]
	then
		echo NOT OK: Wrong output: $output
	else
		echo OK
	fi
else
	echo NOT OK: Wrong number of lines: $count
fi

