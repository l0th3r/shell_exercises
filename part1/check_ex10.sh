#!/usr/bin/bash

output=`echo -e "Hello You\nWell, Hello" | sh ex10.sh`
if [ "$output" = "Hello You"  ]
then
	echo OK
else
	echo NOT OK: Wrong output
fi

