#!/bin/sh
# Entrypoint for git

# Git update image
git_update_image() {
	echo "Update $1"
	
	cd "$1"
	git config --global --add safe.directory "$1"
	#create repository on github if not exists
	#git init if not created -> docker run -it -v xxx/repo:/git --entrypoint=/bin/sh baroka/git:latest
	git add -A
	git commit -am "commit"
	filename=`basename $1`
	git push https://$GIT_TOKEN@github.com/$GIT_NAME/$filename HEAD
}

# Git start
echo "git start.."

# Git set mail and user
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# Git update all images
for dir in /git/* ; do
	if [ -d "$dir" ]; then
		git_update_image $dir
	fi
done

# Git stop
echo "git stop.."