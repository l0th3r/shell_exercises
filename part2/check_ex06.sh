#!/usr/bin/bash

tmp_dir=`mktemp -d`
base_dir=`pwd`
pushd $tmp_dir > /dev/null

fakes="hello secret abcd files.secret.txt"
reals="abcd.secret .efgh.secret .secret"

touch $fakes $reals
chmod 777 $fakes $reals

sudo $base_dir/ex06.sh

_end () {
	popd > /dev/null
	rm -fr $tmp_dir
	exit
}


expected="-rwxrwxrwx"
for f in $fakes
do
	perms=`stat -c "%A" $f`
	owner=`stat -c "%U" $f`
	if [ "$perms" != "$expected" ]
	then
		echo NOT OK: Permissions of file named $f has been wrongly changed to $perms
		_end
	fi
	if [ "$owner" = "root" ]
	then
		echo NOT OK: Owner of file named $f has been wrongly changed to root
		_end
	fi
done
expected="-rw-------"
for f in $reals
do
	perms=`stat -c "%A" $f`
	owner=`stat -c "%U" $f`
	if [ "$perms" != "$expected" ]
	then
		echo NOT OK: Permissions of file named $f should be $expected instead of $perms
		_end
	fi
	if [ "$owner" != "root" ]
	then
		echo NOT OK: Owner of file named $f should be root instead of $owner
		_end
	fi
done


echo OK


_end
