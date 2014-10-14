#!/bin/sh

BRANCH=$1

git branch -D $BRANCH
git branch -D -r origin/$BRANCH
git push origin :$BRANCH
