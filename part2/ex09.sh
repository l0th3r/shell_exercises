#!/usr/bin/bash

if [ `find . -maxdepth 1 -not -type d 2> /dev/null | wc -l` -gt 0 ]
then
    for f in `find . -maxdepth 1 -not -type d `
    do
        if [[ -x "$f" ]]
        then
            ./$f
        fi
    done
fi