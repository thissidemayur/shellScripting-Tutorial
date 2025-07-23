#!/bin/bash

# we are going to learn for and while loop in same file

for (( num=1 ; num<=5 ; num++ ))
do
rm -rf "folder$num"
done



# now we are going to create folder dynamically using range
<<task
1 is argument -< folder name
2 -> starting range
3 -> ending range
task

for (( i=$2 ; i< $3 ; i++ )); do
	rm -rf "$1$i"
	echo "folder: $1$i deleted successfully"
done
echo " everything fine and its done"
