#!/bin/sh
# 2016 M.Reider
# this script resets the local repository with the HEAD branch of a remote origin repo
# Use as part of Perfecto25-NGINX module to pull latest commits from remote Git repo


GIT_REMOTE_PATH="https://github.com/puppetlabs/exercise-webpage.git"
BASEMODULE_PATH=`grep basemodulepath /etc/puppetlabs/puppet/puppet.conf | awk -F= '{ print $2 }'`

cd $BASEMODULE_PATH/nginx/files

# check if Git is initialized
if [ ! -d .git ]
then
  git init 2>&1
fi

# add Git remote\
GIT_REMOTE_PRESENT=`git remote -v | wc -l`
if [ $GIT_REMOTE_PRESENT = 0 ]
then
  git remote add origin ${GIT_REMOTE_PATH}
fi

## Reset local copy with HEAD branch of origin
GIT_REMOTE_PRESENT=`git remote -v | wc -l`
if [ ! $GIT_REMOTE_PRESENT = 0 ]
then
  git fetch --all
  git reset --hard origin/master
  git pull origin master
else 
  echo no git remote present
fi
