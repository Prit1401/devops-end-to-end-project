#!/bin/bash 

for file in notes.txt hello.sh health-check.sh
do 
	if [ -f "$file" ]; then
		echo "Found : $file"
	else
		echo "Missing : $file"
	fi
done
