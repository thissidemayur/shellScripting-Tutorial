#!/bin/bash

if [[ -n "$1" ]] ; then
	echo "pathName recieve via argument"
	pathName=$1
	if [[ -f "$pathName" ]]; then
		echo "✅ File exists."
		exit 0
	elif [[ -d "$pathName" ]] ; then
		echo "⚠️  This is a directory, not a file."
		exit 1
	else
		echo "❌ No such file or directory."
		exit 2
	fi

else
	read -p "Enter pathName: " pathName
	 echo "pathName recieve via userInput"

        if [[ -f "$pathName" ]]; then
                echo "✅ File exists."
                exit 0 
        elif [[ -d "$pathName" ]] ; then
                echo "⚠️  This is a directory, not a file." 
                exit 1
        else
                echo "❌ No such file or directory."
                exit 2
        fi
fi



