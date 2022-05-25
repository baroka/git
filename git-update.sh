#!/bin/sh
git config --global --add safe.directory "/git/$1"
git add -A
git commit -am "commit"
git push https://$GIT_TOKEN@github.com/$GIT_NAME/$1.git