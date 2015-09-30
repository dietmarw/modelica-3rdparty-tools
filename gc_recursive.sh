#!/bin/sh

# Script to recursively trigger git garbage collection.

libDir=`pwd`
cd $libDir

for LIB in `ls -F |grep / | sed 's#/$##'`; do
    cd "$libDir/$LIB"
    echo "Processing $LIB ..."
    git gc --aggressive
done;
