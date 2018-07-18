#!/bin/bash

# checks the last commit hashes of a local and remote repository
# thus determining whether the local is sync'd to the remote

# when the commits are not identical, it could be due to 1 of 3 scenarios:
#   1) more commits have only occurred locally - a git push is required
#   2) more commits are only present remotely (by someone else's work) - a git pull is required
#   3) both of the above - git rebase is required, to get the remote changes first and then apply your local updates

# get the last local commit
local=$(git log -n 1 --pretty=%H)

# get the last remote commit
remote=$(git ls-remote origin -h refs/heads/master | gawk -F " " '{print $1}')

# get the output of $ git remote show origin
# and parse the summary of the state
status=$(git remote show origin | tail -n1 | awk -F"[()]" '{print $2}')

echo REMOTE CHECK:

# check if the last commits of local and remote are the same
if [ $local == $remote ]; then
   # if they are identical, print in green
   echo -e "\033[32m ==> Repos in sync\033[0m"

# if the last commits differ   
else
   # print summary in red
   echo -e "\033[31mRepos are NOT in sync\033[0m"
   echo loc: $local
   echo rem: $remote
   
   # check if a git pull or git push is required
   if [ "$status" = "local out of date" ]; then
       echo -e "git \033[31mPULL\033[0m is required"
   elif [ "$status" = "fast-forwardable" ]; then 
       echo -e "git \033[31mPUSH\033[0m is required"
   fi
fi

echo =============================================

echo GIT STATUS:
git status