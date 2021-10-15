#!/usr/bin/bash


mkdir .test_tmp
pushd .test_tmp > /dev/null
{ echo Player,Level,Class; } > data.csv

output=`echo -e "Kathy\nCleric" | sh ../ex13.sh`
if [ -z $output ]
then
	line=`tail -n1 data.csv`
	expected=Kathy,1,Cleric
	if [ "$line" = "$expected" ]
	then
		echo OK
	else
		echo NOT OK: Last line is "$line" instead of "$expected"
	fi
else
	echo NOT OK: There should be no output
fi

popd > /dev/null
rm -fr .test_tmp
