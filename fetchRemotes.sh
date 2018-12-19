#!/bin/sh

# Script to fetch all updates from all project origins

libDir=`pwd`
cd $libDir

for LIB in `ls -F |grep / | sed 's#/$##'`; do
    cd "$libDir/$LIB"
    echo "fetching  updates of $LIB :"
    git remote update --prune;
done;
