#!/bin/bash

while true
do
	read -p "Enter full pathName or type 'exit': " pathname
	if [[ -z "$pathname" ]] ; then
				echo "⚠️ Empty input. Please enter a valid path."

	elif [[ -f "$pathname" ]] ; then
		echo "✅ File exists."
	elif [[ -d "$pathname" ]] ; then
		echo "⚠️ This is a directory, not a file."
	elif [[ "$pathname" == "exit" ]] ;then
		echo "👋 Exiting script. Bye!"
		break 
	else 
		echo "❌ No such file or directory."
	fi
done
