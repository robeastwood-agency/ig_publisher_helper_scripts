#!/bin/bash

echo Checking IG Publisher supporting application versions... 
echo =========================

# ruby
ruby_version=$(ruby -v)
echo $ruby_version

# ruby gems
echo Ruby gems: `gem -v`

# ruby gem jekyll
echo `jekyll -v`

# python
echo `python --version`

# python package pygments
echo `pip freeze | grep Pygments`

# java
echo `java -version`
