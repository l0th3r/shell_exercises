#!/usr/bin/bash


mkdir .test_tmp
pushd .test_tmp > /dev/null
{ echo CSV,CSV,CSV; echo CSV,CSV,CSV; echo CSV,CSV,CSV; } | tee file1 | tee file2 > file3
echo random data | tee file4.csv > file5.CSV

output=`sh ../ex06.sh`
if [ $output -eq 3 ]
then
	echo OK
else
	echo NOT OK: Wrong result
fi

popd > /dev/null
rm -fr .test_tmp
