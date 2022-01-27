#!/bin/bash
echo "Available tables in $1"

ls -1 gamin/$1

read -p "Enter table Name: " insertb

if [[ -f gamin/$1/$insertb ]]; then

    echo  "------------------";
    cat -n gamin/$1/$insertb
    	
    echo -e "\n"
    read -p "Enter record number: " record_num;
    
        re='^[0-9]+$'
    
        if [[ $record_num =~ $re ]]
        then
            if [[ $record_num == 1 ]]
            then
                echo "can not be deleted"
            else
                sed -i "${record_num}d" gamin/$1/$insertb;
                echo "the ${record_num}th record  is delete";
            fi
        else
            echo "enter a valid record number"    
        fi
    else
        echo "$updtb doesn't exist";
fi