#!/bin/bash


# this is comment 

# create multi line commet with << 

<< mayur

	this is multi line comment
	beleive me ,
mayur

#varaibles
name="mayur"
echo "name: $name and date is $(date)"


#user defined input
echo "Enter user name: "
read username
echo "entered username: $username"
#different way for user defined input
read -p "enter other user name: " username1
echo "entered other user name: $username1"

echo "\n now we are going to create user on our local machine"

sudo useradd -m $username
echo "New username $username is added locally in ur system
"



