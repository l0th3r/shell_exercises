#!/usr/bin/bash

output=`echo -e "Hello You\nWell, Hello\n hello hello\nHello Hello" | sh ex05.sh`
if [ $output -eq 3  ]
then
	echo OK
else
	echo NOT OK: Wrong output: $output
fi

