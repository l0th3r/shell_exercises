#!/usr/bin/bash

shopt -s lastpipe

export -n HELLO
./ex03.sh | read output1
export HELLO=
./ex03.sh | read output2
export HELLO=Linux
./ex03.sh | read output3

if [ "$output1" != "Hello World" ]
then
	echo NOT OK: \"$output1\" printed instead of \"Hello World\" when the envirnoment variable dosen\'t exist
	exit
fi

if [ "$output2" != "Hello World" ]
then
	echo NOT OK: \"$output2\" printed instead of \"Hello World\" when the envirnoment variable is empty
	exit
fi

if [ "$output3" != "Hello Linux" ]
then
	echo NOT OK: \"$output2\" printead insteaf of \"Hello Linux\"
	exit
fi
echo OK

