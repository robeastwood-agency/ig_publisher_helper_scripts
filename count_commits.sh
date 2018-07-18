#!/bin/bash

# https://git-scm.com/docs/git-shortlog

total_commits=$(git shortlog | grep -E '^[ ]+\w+' | wc -l)
echo Total commits: $total_commits

echo =====================

#commits_per_user=$(git shortlog -n -s)
git shortlog -n -s