#!/bin/bash

# Script to pull all updates from all project origins and push
# those to the modelica-3rdparty forks.
# The forks are cloned using `git clone --mirror URL`
# which generates a bare repo and fork orgin will be "origin".
# Our fork will have the remote name "modelica-3rdparty".
#
# This script should be put/cloned into the parent directory
# of the bare repos of all forks to be mirrored.

libDir=`pwd`

for LIB in `ls -F |grep / | sed 's#/$##'`; do
#    echo "$libDir/$LIB"
    cd "$libDir/$LIB"
    git remote | grep 'modelica-3rdparty' && \
    	(echo "Syncing updates of $LIB ..."; \
	git remote update; \
	git push --mirror modelica-3rdparty -q) || \
	echo "Looks like $LIB is not a fork, skipping.";
done;
