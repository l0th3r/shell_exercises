#!/usr/bin/bash

if [ $# -ge 1 ]
then
	it=1
	while [ $it -ne $(( $1 + 1 )) ]
	do
		echo "$it Hello"
		it=$(( $it + 1 ))
	done
fi
