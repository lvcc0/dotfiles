#!/usr/bin/bash

set -e

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

print() {
    echo -e "${1}${2}${RESET}"
}

if [ $# -ne 1 ]; then
    print "$RED" "error:: must specify target directory." >&2
    exit 1
fi

if [ ! -d "$1" ]; then
    print "$RED" "error:: $1 is not a directory or does not exist." >&2
    exit 1
fi

CONFIG_DIRS=("dunst" "fastfetch" "hypr" "kitty" "quickshell" "scripts" "wallpapers" "wofi")

read -r -p "This will copy current config directories to \"$1\". Continue? [Y/n] " yn
if [[ "$yn" =~ ^([nN][oO]|[nN])$ ]] ; then
    echo "exiting..."
    exit 0
fi

for dir in "${CONFIG_DIRS[@]}" ; do
    if cp -r $HOME/.config/$dir $1 ; then
        print "$GREEN" "[v] copied $dir to $1"
    else
        print "$RED" "[x] could not copy $dir to $1"
    fi
done
