#!/bin/bash

<<disclimar
this is a tag, name any of the name 
disclimar


read -p "enter the bandi: " bandi
read -p "enter the pyar percentage:" pyar
if [[ $bandi == "daya bhabhi" ]];
then 
	echo "banda toh loyal"
elif [[ $pyar -ge 100 ]];
then
	echo "banda toh pka vala aashiq hain"

else 
	echo "banda toh chodu nikla"

fi


