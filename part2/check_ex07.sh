#!/usr/bin/bash

tmp_dir=`mktemp -d`
base_dir=`pwd`
pushd $tmp_dir > /dev/null

broken="link1 .link1"
working="link2 .link2"

touch file1 file2
for f in $broken;  do ln -s file1 $f; done
for f in $working; do ln -s file2 $f; done
rm file1

$base_dir/ex07.sh

_end () {
	popd > /dev/null
	rm -fr $tmp_dir
	exit
}


for f in $broken
do
	if [ -h $f ]
	then
		echo NOT OK: Broken link named $f has not been removed
		_end
	fi
done

for f in $working
do
	if [ ! -h $f ]
	then
		echo NOT OK: Working link named $f has wrongly been removed
		_end
	fi
done


echo OK


_end
