#!/bin/bash
directory=$1
if [ $# -lt 1 ]
then
directory=`pwd`
fi
if [ -d $directory ]
then
  cd $directory
else
  echo "$directory is not a directory"
  exit
fi
relative=`pwd | sed "s/\/Users\/[a-zA-Z0-9_]*/~/"`
if echo $PATH | egrep -q "$relative|`pwd`"; then
  echo "Path already configured"
else
  echo "export PATH=\"$relative:\$PATH\"" >> ~/.bash_profile
  echo "Path added to ~/.bash_profile"
fi
git init .
git remote add -t \* -f origin https://github.com/ave4224/command-line-tools.git
git checkout master
