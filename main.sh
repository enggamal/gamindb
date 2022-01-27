#!/bin/bash

select action in creategamindb listgamindb dropgamindb  usegamindb
do
	case $action in
		creategamindb )	read -p "Enter your db name Name: " dbname 
						bash   creategamindb.sh $dbname ;;
		listgamindb   ) bash listallgamindb.sh ;;
		dropgamindb   ) bash deletegamindb.sh ;;
		usegamindb    ) bash usegamindb.sh ;;
		*             ) echo "invalid input: $REPLY"; exit ;;
	esac

done

