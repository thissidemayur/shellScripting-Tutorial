#!/bin/bash
create_directory() {

mkdir temp

}

if ! create_directory ; then
	echo " the code is being exited as the directory already exists"
	exit 1
fi

echo -p "now we are using error handling properly with  if-then statement \n thank you"
