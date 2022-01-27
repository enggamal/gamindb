#!/bin/bash
echo "Available DataBases"
echo "========"
ls -1 gamin
echo "========"
read -p "Enter DataBase Name: " deleted_dir
if [[ -d gamin/$deleted_dir ]]; then

	rm -r gamin/$deleted_dir
	
else
	echo "$deleted_dir doesn't exist"
fi
