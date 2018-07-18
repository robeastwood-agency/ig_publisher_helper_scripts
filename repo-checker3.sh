#!/bin/sh

echo REPO CHECK: 

# check if current directory is a git repository
if git rev-parse --git-dir > /dev/null 2>&1

# if it IS a git repository
# process the git history
then
 
  # get the last local commit
  local=$(git log -n 1 --pretty=%H)
  
  # get the last remote commit
  remote=$(git ls-remote origin -h refs/heads/master | gawk -F " " '{print $1}')

  # check if the last commits of local and remote are the same
  if [ $local == $remote ]
  
  # if they are identical
  then
    echo -e "\033[32m ==> Local and remote repos are in sync\033[0m"
    echo There is nothing to do.
    exit 0
  
  # if the last commits differ 
  else
    # print in red
    echo -e "\033[31m ==> Local and remote repos are NOT in sync\033[0m"
    
    echo loc: $local
    echo rem: $remote
    
    # clean pull scenario
    # is last local commit in the remote history?
    remoteahead=$(git rev-list --count $local..HEAD)
    
    echo $remoteahead
    
  fi

# if it is NOT a git repository, exit
else
  echo Exiting
  echo `pwd` is not a git repository.
  exit 1
fi
