#!/bin/bash
echo "Available tables in $1";
ls -1 gamin/$1;
read -p "Enter table Name: " updtb;

if [[ -f gamin/$1/$updtb ]]
then
    cat -n gamin/$1/$updtb;
	echo ""
	read -p "Enter record number  : " RN;

    if [[ $RN == 1 ]]
    then
        echo "It is the header and can not be modified!"
    else

        read -p "Enter field number: " FN ;


        coltype=`awk  -v x=$FN '{if(NR==1){print $x}}' gamin/$1/$updtb.types;`

        read -p "Enter new value : " new_value;
        read -p "Enter old value : " old_value;
       
            if [[ $coltype = "int" && "$new_value" = +([0-9]) || $coltype = "st" && "$new_value" = +([a-zA-Z]) ]]
            then
                echo "------------------------------"

                sed -i "${RN}s/$old_value/$new_value/" gamin/$1/$updtb;
                cat -n gamin/$1/$updtb;
                echo -e "\n------------------------------"
            else
                echo "different value type"
            fi   
      
    fi
else
	echo "$updtb doesn't exist";
fi