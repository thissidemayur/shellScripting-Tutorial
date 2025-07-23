#!/bin/bash

if [[ -z $1 ]] ; then 
	read -p "Enter pathName for given directory: " pathName;
fi

read -p "enter fileNam: " fileName

if [[ -f "$1/$fileName" || -f "$pathName/$fileName"  ]] ; then 
	echo "⚠️ File $fileName already exists."

else 
	touch $fileName 
	echo "✅ $fileName created successfully" 
fi



echo "$pwd"
