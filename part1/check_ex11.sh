#!/usr/bin/bash

output=`echo -e "echo Hello You\nWell, Hello" | sh ex11.sh`
if [ "$output" = "Hello You"  ]
then
	echo OK
else
	echo NOT OK: Wrong output
fi

