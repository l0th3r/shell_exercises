#!/usr/bin/bash

shopt -s lastpipe

HELLO=
source ex01.sh

if [ -z "$output" ]
then
	if [ "$HELLO" = "World" ]
	then
		echo OK
	else
		echo NOT OK: \$HELLO contains \"$HELLO\" instead of \"World\"
	fi
else
	echo NOT OK: Output should be empty, not \"$output\"
fi

