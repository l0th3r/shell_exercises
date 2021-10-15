#!/usr/bin/bash

for i in `find . -type l`
do
    if [ ! -e "$i" ]
    then
        rm $i
    fi
done