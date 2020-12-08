#!/usr/bin/env bash

# Deploy UPM branch
# Author:	AndrewMJordan
# Version:	1.0.1

# Validate parameters
if [ -z "$1" ]
then
	echo "Parameter \"packageRoot\" is invalid"
	echo "Usage: ./deploy.sh <packageRoot>"
	exit 1
fi

packageRoot="$1"

# Prepare package assets
find "$packageRoot" \( -iname "*.cs" -o -iname "*.shader" \) | while read fname; do
	cat "preamble.txt" | goo transform inject "${fname}"
done
goo transform hide-folder "${packageRoot}/Samples"
goo package ignore-folder "${packageRoot}" "Samples"

# Preserve package files
tmp_dir=$(mktemp -d -t deploy-XXXX)
cp -r "$packageRoot"/. "$tmp_dir"/

# Prepare working tree for upm branch
git checkout -f upm 2> /dev/null || (git checkout -fb upm)
git clean -fd && git rm -r *
# Restore package files
mv "$tmp_dir"/* .
rm -rf $tmp_dir

# Commit
version=`goo package get-version .`
git add -A
git commit -m "Deploy $version"
git tag -a -m "Release tag" "$version"

# Push
git push origin upm && git push origin --tags

# Restore working tree
git checkout -f develop && git clean -fdx
