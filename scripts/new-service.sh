#!/bin/sh
set -eu
kind="${1:?kind: go-service|python-service|terraform-module}"
dest="${2:?destination directory}"
src="$(dirname "$0")/../templates/${kind}"
test -d "$src"
mkdir -p "$dest"
cp -R "$src"/. "$dest"
echo "copied ${kind} -> ${dest}"
