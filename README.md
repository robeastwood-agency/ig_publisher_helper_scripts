# Helper scripts
This is a collection of personal scripts that provide some help with the FHIR IG publisher as well as git repositories generally.

## IG publisher
1. Clean out various directories within the IG repository (such as txCache etc) - [publisher_clean.sh](publisher_clean.sh)
2. Clean out the user `.fhir/` directory - TODO
3. Invoke an auto-build, assuming that has been set up (refer to [auto-builder instructions](https://github.com/hl7-fhir/auto-ig-builder)) - [invoke_repo_build.sh](invoke_repo_build.sh)
4. Check version numbers of the various IG publisher dependencies (eg ruby, python, jekyll etc) - [version_checker.sh](version_checker.sh)
5. Save the key outputs for later viewing, in case the publisher doesn't run and the output folder is then empty - [save_last_publisher_output.sh](save_last_publisher_output.sh)
6. A collection of bash aliases for the IG publisher - [igpublisher_aliases](igpublisher_aliases)

## Git helpers
1. Count a repositories commits by user - [count_commits.sh](count_commits.sh)
2. A live git log output (refreshes every 5 sec) - [gitloglive.sh](gitloglive.sh)
3. A live git status output (refreshes every 5 sec) - [gitstatuslive.sh](gitstatuslive.sh)
4. A collection of bash aliases for git - [git_aliases](git_aliases)

All of these scripts are most useful on the command line when aliased, eg
```
alias pc='/c/work/scripts/publisher_clean.sh'
```
