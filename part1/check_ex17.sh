#!/usr/bin/bash


mkdir .test_tmp
pushd .test_tmp > /dev/null
{ echo Player,Level,Class; echo Kathy,1,Cleric; echo Anna,22,Tank; echo Tim,12,Paladin; echo Jack,14,Tank; }> data.csv

output=`sh ../ex17.sh`
if [ "$output" = "Tank" ]
then
	echo OK
else
	echo NOT OK: Wrong result
fi

popd > /dev/null
rm -fr .test_tmp
