#!/usr/bin/bash

_end () {
	popd > /dev/null
	rm -fr $tmp_dir
	exit
}

tmp_dir=`mktemp -d`
base_dir=`pwd`
pushd $tmp_dir > /dev/null

$base_dir/ex05.sh

if [ ! -e secret ]
then
	echo NOT OK: No file called secret has been created
	_end
fi

perms=`stat -c "%A" secret`
expected="-rw-------"
if [ "$perms" != "$expected" ]
then
	echo NOT OK: Permissions of file are \"$perms\" instead of \"$expected\"
	_end
fi

echo OK

_end
