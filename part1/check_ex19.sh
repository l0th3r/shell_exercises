#!/usr/bin/bash


mkdir .test_tmp
pushd .test_tmp > /dev/null
{ echo Player,Level,Class; echo Kathy,1,Cleric; echo Anna,22,Tank; echo Tim,12,Paladin; echo Jack,14,Tank; }> data.csv

output=`for i in {1..30} ; do echo Tank | sh ../ex19.sh; done | sort -u`
output1=`echo "$output" | head -n1`
output2=`echo "$output" | tail -n1`
if [ "$output1" = "Anna" -a "$output2" = "Jack" ]
then
	echo OK
else
	echo NOT OK: Wrong result
fi

popd > /dev/null
rm -fr .test_tmp
