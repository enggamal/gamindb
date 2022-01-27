#!/bin/bash
echo "Available tables in $1"

ls -1 gamin/$1

read -p "Enter table Name: " insertb

if [[ -f gamin/$1/$insertb ]]; then
	
	let nf=`awk  '{if(NR==1){print NF}}' gamin/$1/$insertb;`
	echo $nf
																	
	for (( i = 1; i <= $nf; i++ ))
	do
	  	colname=`awk  -v x=$i '{if(NR==1){print $x}}' gamin/$1/$insertb;`
	  	coltype=`awk  -v x=$i '{if(NR==1){print $x}}' gamin/$1/$insertb.types;`
		
		echo "the colum name is: "$colname
		echo "the type of data in this colomn: " $coltype

		while true 		
		do  
			read -p " enter your value : " value

			# read -p " enter the type of value : " type
			if [[ $coltype = "int" && "$value" = +([0-9]) || $coltype = "st" && "$value" = +([a-zA-Z]) ]]
			then
				if [[ $i == 1 ]]
				then
						echo -ne "\n$value " >> gamin/$1/$insertb;
						break;					
				else
						echo -n $value" " >> gamin/$1/$insertb;
						break;
					
				fi
			else	
					echo " different value type ";

			fi			
		done

	done
 	
else
	echo "$insertb doesn't exist";
fi


