#!/usr/bin/bash


nbSercretFiles=`find *.secret -type f 2> /dev/null | wc -l`
nbHiddenSercretFiles=`find .*.secret -type f 2> /dev/null | wc -l`
nbNoNameFiles=`find .secret -type f 2> /dev/null | wc -l`

if [ $nbSercretFiles -gt 0 ]
then
    files=`find *.secret -type f`
    chown root $files
    chmod 600 $files
fi

if [ $nbHiddenSercretFiles -gt 0 ]
then
    files=`find .*.secret -type f`
    chown root $files
    chmod 600 $files
fi

if [ $nbNoNameFiles -gt 0 ]
then
    files=`find .secret -type f`
    chown root $files
    chmod 600 $files
fi