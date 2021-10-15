#!/usr/bin/bash

tmp_dir=`mktemp -d`
base_dir=`pwd`
pushd $tmp_dir > /dev/null

files="abcd-efgh.xx 1234-5678"
expected="efgh-abcd.xx 5678-1234"

touch $files

$base_dir/ex08.sh

_end () {
	popd > /dev/null
	rm -fr $tmp_dir
	exit
}


for f in $files
do
	if [ -e $f ]
	then
		echo NOT OK: File $f still has its old name
		_end
	fi
done

for f in $expected
do
	if [ ! -e $f ]
	then
		echo NOT OK: No file has been renamed $f
		_end
	fi
done


echo OK


_end
