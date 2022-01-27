#!/bin/bash
echo "Available tables in $1"

ls -1 gamin/$1

read -p "Enter table Name: " insertb

if [[ -f gamin/$1/$insertb ]]; then

    echo  "------------------";
    cat -n gamin/$1/$insertb
    echo ""
fi