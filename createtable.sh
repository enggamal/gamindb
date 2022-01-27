#!/bin/bash
read -p "table name: " tbname
if [[ -f gamin/$1/$tbname ]]
then
	echo "Table $tbname already exists";
else
	
	read -p "Enter No of columns :" number_of_columns;
	if [[  "$number_of_columns" = +([0-9]) ]]
	then
		
		for (( i = 1; i <= number_of_columns; i++ )) 
		do
			read -p "Enter column $i name :" name;
			
			read -p "Enter column datatype : [st/int]: " dataype;
			while [[ -z $name ]]
			do
				echo "it can not empty"
				echo ""
				read -p "Enter column $i name :" name;
			
				read -p "Enter column datatype : [st/int]: " dataype;
			done
				if [[ $dataype = int  || $dataype = st  ]]
				then
			
					touch gamin/$1/$tbname;
					echo -n $name" " >> gamin/$1/$tbname;
					echo -n $dataype"   " >> gamin/$1/$tbname.types;
				else
					while [[ "$dataype" != int || "$dataype" != st  ]]
					do
						echo "Invalid datatype";
						read -p "Enter column $i name :" name;
						read -p "Enter column datatype : [st/int]: " dataype;
						
					done
			
				fi
			

		done
		echo "$tbname has been created"
	else
		echo " it is not number "	
	fi

fi

                            