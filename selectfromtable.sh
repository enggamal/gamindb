#!/bin/bash
echo "Available tables in $1"

ls -1 gamin/$1

read -p "Enter table Name: " insertb

if [[ -f gamin/$1/$insertb ]]; then
    	let nf=`awk  '{if(NR==1){print NF}}' gamin/$1/$insertb;`
	
    echo  "the values of columns and its types";
    echo  "------------------";
	for (( i = 1; i <= $nf; i++ ))
	do
	  	colname=`awk  -v"i=$i" '{if(NR==1){print $i}}' gamin/$1/$insertb;`
	  	coltype=`awk  -v"i=$i"  '{if(NR==1){print $i}}' gamin/$1/$insertb.types;`
    

        echo -n $colname"("$coltype")  "

    done

        echo -e "\n"
        read -p "Enter records number: " record_num;
        echo | awk -v var=$record_num '{if(NR==var){print $0}}' gamin/$1/$insertb

fi