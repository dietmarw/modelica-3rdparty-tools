#!/bin/sh

# Script to pull all updates from all project origins and push
# those to the modelica-3rdparty forks.
# The forks are cloned using `git clone --mirror URL`
# which generates a bare repo and fork orgin will be "origin".
# Our fork will have the remote name "modelica-3rdparty".
#
# This script should be put/cloned into the parent directory
# of the bare repos of all forks to be mirrored.

libDir=`pwd`
cd $libDir

for LIB in `ls -F |grep / | sed 's#/$##'`; do
    cd "$libDir/$LIB"
    echo "Syncing updates of $LIB :"
    git remote | grep 'modelica-3rdparty' && \
       (git remote update --prune; \
        git push --mirror modelica-3rdparty -q) || \
        (echo "Looks like $LIB is not a fork, so only fetching updates."; \
        git remote update --prune;)
done;
