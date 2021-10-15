#!/usr/bin/bash

nb_found_files=`ls *-* 2> /dev/null | wc -l`

if [ $nb_found_files -gt 0 ]
then
    for i in `ls *-*`
    do
        filename=`echo $i | sed -z "s/.\///g"`
        begin=`echo $filename | cut -d "-" -f1`
        end=`echo $filename | cut -d "-" -f2 | cut -d "." -f1`
        ext=""

        if [[ $filename == *.* ]]
        then
            ext=`echo $filename | cut -d "." -f2`
            mv $i "./$end-$begin.$ext"
        else
            mv $i "./$end-$begin"
        fi
    done
fi