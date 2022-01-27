#!/bin/bash
echo "Available tables in $1"
ls -1 gamin/$1
read -p "Enter table Name: " dropped_table
if [[ -f gamin/$1/$dropped_table ]]
then

	rm gamin/$1/$dropped_table
	rm gamin/$1/$dropped_table.types 
	echo "$dropped_table has been deleted"
		
else
	echo "$dropped_table not exist"
fi