#!/bin/bash


for arg in "$@"
do
	git add "$arg"
	read -p "enter commit for file: $arg" gitcommit
	git commit -m "$gitcommit"
	if [[ -z "$gitcommit" ]] ; then 
		echo "commit message can't be empty for file: $arg"
	fi
done
	
	echo "git automation successfulllly done"
	git push
