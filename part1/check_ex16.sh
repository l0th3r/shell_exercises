#!/usr/bin/bash


mkdir .test_tmp
pushd .test_tmp > /dev/null
{ echo Player,Level,Class; echo Kathy,1,Cleric; echo Anna,22,Tank; echo Tim,12,Paladin; }> data.csv

output=`sh ../ex16.sh`
if [ $output -eq 3 ]
then
	echo OK
else
	echo NOT OK: Wrong result
fi

popd > /dev/null
rm -fr .test_tmp
