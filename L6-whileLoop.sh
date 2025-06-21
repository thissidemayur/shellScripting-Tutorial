#!/bin/bash

num=0

while [[ $num -le 5 ]]
do 
	echo "we are in while loop, majje" 
		((num++));
done


echo "check even or add with 10"

while [[ (( $n%2==0 )) && $n -le 10 ]]
do 
	echo "even no: $n"
	((n++))
done
