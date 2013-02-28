#!/bin/bash

# Script to pull all updates from all project origins and push
# those to the modelica-3rdparty forks
# Currently we expect to find the fork origin in "upstream/master"

libDir=`pwd`

for LIB in `ls -F |grep / | sed 's#/$##'`; do
#    echo "$libDir/$LIB"
    cd "$libDir/$LIB"
    # make sure we are on master
    git co master
    git branch -r | grep 'upstream/master' && \
    	(echo "Fetching updates from upstream of $LIB..."; \
	git fetch -t upstream; git merge upstream/master --ff-only; \
	git push --tags origin master) || \
	echo "Looks like $LIB is not a fork so nothing to fetch";
done;
