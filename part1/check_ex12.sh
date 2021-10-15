#!/usr/bin/bash

output=`echo -e "Hello You\nWell, Hello\nnow"| sh ex12.sh`
if [ "$output" = "Hello You Well, Hello"  ]
then
	echo OK
else
	echo NOT OK: Wrong output
fi

