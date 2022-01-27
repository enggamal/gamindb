#!/bin/bash
echo "Available DataBases"
echo "==============="
ls -1 gamin/
echo "==============="
read -p "Enter DataBase Name: " usedb
if [[ -d gamin/$usedb ]]; then
	select option in "create table" "drop table" "update table" "insert record" "Delete from table" "show table" "Select from table"
	do
		case $option in
			"create table" )	   bash createtable.sh $usedb ;;
			"drop table" )         bash droptable.sh $usedb ;;
			"update table" )       bash updaterecords.sh $usedb ;;
			"insert record")       bash insertrecords.sh $usedb ;;
			"Delete from table" )  bash deleterecord.sh $usedb ;;
			"show table" )         bash showtable.sh $usedb ;;
			"Select from table" )  bash selectfromtable.sh $usedb ;;
			* ) echo "invalid input: $REPLY"; exit ;;
		esac
	done
else
	echo "$usedb isn't a DataBase";
fi
