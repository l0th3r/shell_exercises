#!/usr/bin/bash


mkdir .test_tmp
pushd .test_tmp > /dev/null
{ echo Player,Level,Class; echo Kathy,1,Cleric; echo Anna,22,Tank; echo Tim,12,Paladin; echo Jack,14,Tank; }> data.csv

output=`echo -e "Kathy\n2\n3" | sh ../ex20.sh`

if [ -z "$output" ]
then
	line=`grep Kathy data.csv`
	expected=Kathy,0,Cleric
	if [ "$line" = "$expected" ]
	then
		echo OK
	else
		echo NOT OK: File contains "$line" instead of "$expected"
	fi
else
	echo NOT OK: Output should be empty
fi

popd > /dev/null
rm -fr .test_tmp
