#!/usr/bin/bash

_end () {
	popd > /dev/null 2> /dev/null
	rm -fr $tmp_dir
	rm $tmp_out
	exit
}

if [ ! -e /usr/bin/tcc ]
then
	echo Please install tcc \(sudo pacman -S tcc\)
	exit
fi

tmp_dir=`mktemp -d`
base_dir=`pwd`
pushd $tmp_dir > /dev/null

exe="a b c .d"
not_exe="e f g i .h"
tmp_out=`mktemp`
for f in $exe $not_exe; do echo "echo $f >> $tmp_out" >> $f; done
for f in $exe; do chmod 700 $f; done
for f in $not_exe; do chmod 600 $f; done

tcc -o j - << EOF
#include <stdio.h>
int main()
{
	FILE* file = fopen("$tmp_out", "a");
	fprintf(file, "j\n");
	return 0;
}
EOF

exe="$exe j"

$base_dir/ex09.sh


for f in $not_exe
do
	if [ `grep -c $f $tmp_out` -gt 0 ]
	then
		echo NOT OK: File named $f seems to have been wrongly executed
		_end
	fi
done

for f in $exe
do
	if [ `grep -c $f $tmp_out` -ne 1 ]
	then
		echo NOT OK: Executable file $f seems to not have been correclty executed
		_end
	fi
done


echo OK


_end
