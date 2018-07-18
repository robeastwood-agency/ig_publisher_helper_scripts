#!/usr/bin/env python

import subprocess as sp
import os
import re


# constants ============================================================
LOCAL_CMD    = ['/usr/bin/git', 'log', '-n', '1', '--pretty=%H']
REMOTE_CMD   = ['/usr/bin/git', 'ls-remote', 'origin', '-h', 'refs/heads/master']

REPOS        = [
                 "/c/work/git/dh-Participants-ig - testing",
                 "/c/work/git/fhir-metadata-validation"
                 ]


# methods = ============================================================

def repo_name(repo_path):
    m = re.match(r"/(\w+)$", repo_path)
    return m.group(1)


def is_directory(path):
    '''
    Takes the base path and appends the name of the repo
    Returns True if the path is a directory, otherwise False
    '''
    return os.path.isdir(path)


def get_output(cmd):
    '''
    Runs a subprocess command to check its output
    Returns a byte, therefore needs to be converted to string
    and removal of the trailing '\n'
    '''
    output = sp.check_output(cmd)
    output = output.decode(encoding='UTF-8')                 # convert byte to string
    return output.strip()                                   # remove trailing '\n'


def change_directory(path):
    '''
    Takes the base path and appends the name of the repo
    Changes to this directory
    '''
    os.chdir(path)


# ======================================================================

if __name__ == '__main__':

    print(":: Checking status of git repos...")

    # iterate over each of the repos
    for repo in REPOS:
	    
		print repo

        # check if repo directory exists; if so
        if is_directory(repo):

            # move into that directory
            change_directory(repo) 

            # read the latest commit in the local repository
            local = get_output(LOCAL_CMD)

            # read the latest commit in the remote repository
            remote = get_output(REMOTE_CMD).split('\t')[0]              # get just the first segment of the string

            # if the latest local and remote commits are the same, then
            if local == remote:
                print("{0} is up to date".format(repo_name(repo)))

            # if the latest local and remote commits are NOT the same
            else:
                # update repository with rebase
                #git pull --rebase
				print("do git pull here")


        # if repo directory does not exist
        else:
            print("ERROR: <{0}> does not exist - skipping".format(repo))