#!/bin/bash
if [[ -d gamin/$1 ]]; then
		echo "The DataBase $1 Already Exists";
		echo "use a different name " ;
else
	mkdir -p gamin/$1
fi
