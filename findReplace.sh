#!/bin/bash

if [ -z "$1" ]
  then
    echo "Invalid arguments. ./findReplace.sh findArg replaceArg path"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Invalid arguments. ./findReplace.sh findArg replaceArg path"
    exit 1
fi

if [ -z "$3" ]
  then
    echo "Invalid arguments. ./findReplace.sh findArg replaceArg path"
    exit 1
fi

find $3 -type f -print0 | xargs -0 sed -i "s/$1/$2/g"
echo "Done."
