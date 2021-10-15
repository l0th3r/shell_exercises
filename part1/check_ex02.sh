#!/usr/bin/bash

rm -f a_new_hope
output=`sh ex02.sh`
if [ -z  "$output"  ]
then
	if [ -e a_new_hope ]
	then
		if [ "`cat a_new_hope`" = "Help me, Obi Wan Kenobi." ]
		then
			if [ "`stat -c"Modify %y" a_new_hope | cut -f2 -d' '`" = "1977-05-25" ]
			then
				echo OK
			else
				echo NOT OK: Wrong modification date
			fi

		else
			echo NOT OK: Wrong file content
		fi
	else
		echo NOT OK: File a_new_hope not created
	fi

else
	echo NOT OK: Output should be empty
fi

rm -f a_new_hope
