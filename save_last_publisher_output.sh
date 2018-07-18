#!/bin/bash

# this script copies 2 specific IG publisher files, 
# in case a future IG publisher run fails and all output is then lost

# bash 'mkdir -p' creates a new directory and doesn't complain if it already exists
# the copy command will overwrite existing files if they are already present

# aliased to 'spo' (Save Publisher Output)

mkdir -p last_saved_output

cp output/full-ig.zip last_saved_output/full-ig.zip

cp output/qa.html last_saved_output/qa.html
