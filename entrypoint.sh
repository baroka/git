#!/bin/sh
# Entrypoint for git
echo "git start.."

# Git set mail and user
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# docker logs
tail -f /var/log/git.log