#!/bin/bash

<< QUESTION
TITLE:Functions, $@, redirection (>, >>), logs

Question 4 — Arg-Based Multi-File Checker with Logging
QUESTION

check_path() {
	mkdir -p log
	for arg in "$@" ; do
		if [[ -f "$arg" ]] ; then 
			echo "✅ File: $arg exists"
			echo "✅ File: $arg exists " >> log/file_check.log
		elif [[ -d "$arg" ]] ; then
			echo "⚠️   $arg is directory" 
			echo "⚠️   $arg is directory " >> log/file_check.log
		else 	
			echo "❌ filePath: $arg not found"
			echo "❌ filePath: $arg not found " >> log/file_check.log
		fi
	done

}

check_path "$@" 



