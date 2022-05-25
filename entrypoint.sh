#!/bin/sh
# Entrypoint for git
echo "git start.."

#GIT_FOLDER=/git

# Git set mail and user
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# Git mark safe folders
#for file in $GIT_FOLDER/*/
#do
#	echo "safe.directory $file"
#    git config --global --add safe.directory "$file"
#done

# docker logs
tail -f /var/log/git.log