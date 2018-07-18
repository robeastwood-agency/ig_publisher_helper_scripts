#!/bin/bash

# this script removes the contents of the various IG publisher folders
# firstly checking that they exist, and that they are empty

# the bash test of '-d' checks if what follows is a directory
# the bash test of '-z' checks the length of STRING is zero
# https://linux.die.net/man/1/test

# aliased to 'pc'

# declare an array variable containing the names of folders to empty
declare -a folder_array=("output" "txCache" "temp" "qa")

# loop through the above array
for folder in "${folder_array[@]}"
do
   if [ -d "$folder" ]; then								# does the folder exist?
     if [ -z "$(ls -A "$folder")" ]; then					# when it exists, is it empty?
       echo "The folder '"$folder"' is already empty"		# print that it is empty
     else													# not empty
       echo "Removing contents of '"$folder"' folder"		# print that it is NOT empty
	   rm -rf "$folder"/*									# and remove its contents
     fi
   else														# when the folder doesn't exist
      echo "Folder '"$folder"' does not exist"				# print that the folder doesn't exist & do nothing
   fi
done
