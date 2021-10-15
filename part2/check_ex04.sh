#!/usr/bin/bash

shopt -s lastpipe

expected=`{
	echo 1 Hello
	echo 2 Hello
	echo 3 Hello
	echo 4 Hello
	echo 5 Hello
	echo 6 Hello
	echo 7 Hello
	echo 8 Hello
	echo 9 Hello
	echo 10 Hello
	echo 11 Hello
}`

./ex04.sh | read output

if [ -n "$output" ]
then
	echo NOT OK: Output should be empty if there are no parameters \($output\)
	exit
fi

if [ -n "$(diff <(./ex04.sh 11) <(echo "$expected"))" -a -n "$(diff <(./ex04.sh 4) <(echo "$expected" | head -n4))" ]
then
	echo NOT OK: Invalid output
	exit
fi

echo OK
