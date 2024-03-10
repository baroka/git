#!/bin/sh
# Entrypoint for git

# Git update image
git_update_image() {
	cd "$1$GIT_FOLDER"
	git config --global --add safe.directory "$1$GIT_FOLDER"
	git add -A
	git commit -am "commit"
	git push https://$GIT_TOKEN@github.com/$GIT_NAME/$1.git
}

# Git start
echo "git start.."

# Git set mail and user
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# Git update all images
cd /git
for dir in /git/*/ ; do
	echo "$dir"
	if [ -d "$dir/$GIT_FOLDER" ]; then
		git_update_image $dir
	fi
done