#!/usr/bin/bash

output=`echo -e "Hello You\nWell, Hello\ntest" | sh ex08.sh`
output1=`echo "$output" | head -n1`
output2=`echo "$output" | tail -n2 | head -n1`
if [ "$output1" = "uo"  ]
then
	if [ "$output2" = "ol" ]
	then
		echo OK
	else
		echo NOT OK: Wrong output: $output2
	fi	
else
		echo NOT OK: Wrong output: $output1
fi

