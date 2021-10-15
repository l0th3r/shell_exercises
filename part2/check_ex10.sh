#!/usr/bin/bash

tmp_dir=`mktemp -d`
base_dir=`pwd`
pushd $tmp_dir > /dev/null

five_second_godot ()
{
    sleep 5
    touch Godot
}

five_second_godot &
$base_dir/ex10.sh > output_file 


_end () {
    popd > /dev/null
    rm -fr $tmp_dir
    exit
}

expected="Waiting for Godot..."
output=`uniq output_file`
count=`grep -c "$expected" output_file`

if [ "$output" != "$expected" ]
then
    echo NOT OK: Output is "$output" instead of "$expected"
    _end
fi

if [ $count -ne 5 ]
then
    echo NOT OK: Sentence has been output $count times in 5 seconds
    _end
fi


echo OK


_end