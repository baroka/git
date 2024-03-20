#!/bin/sh
# Entrypoint for git

# Git update image
git_update_image() {
	echo "Update $1"
	
	cd "$1"
	git config --global --add safe.directory "$1"
	echo a
	git add -A
	echo b
	git commit -am "commit"
	echo c
	filename=`basename $1`
	echo d
	git push https://$GIT_TOKEN@github.com/$GIT_NAME/$filename.git
	echo e
}

# Git start
echo "git start.."

# Git set mail and user
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# Git update all images
for dir in /git/*/ ; do
	if [ -d "$dir" ]; then
		git_update_image $dir
	fi
done

# Git stop
echo "git stop.."

touch /tmp/file.txt
tail -f /tmp/file.txt