#!/usr/bin/bash

set -e

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

print() {
    echo -e "${1}${2}${RESET}"
}

# todo: dependencies check

PKGDIR="$( cd -- "$(dirname "$0")/.." >/dev/null 2>&1; pwd -P )"
DOTS_DIR="$HOME/.config"
CONFIG_DIRS=("dunst" "fastfetch" "hypr" "kitty" "quickshell" "scripts" "wallpapers" "wofi")

echo "This script will overwrite $DOTS_DIR with the files this script is packaged with ($PKGDIR)."
echo "Following directories will be overwritten:"
for dir in ${CONFIG_DIRS[@]}; do
    echo "$DOTS_DIR"/"$dir"
done

read -r -p "Do you wish to create a backup of these directories? [Y/n] " yn
if [[ "$yn" =~ ^([nN][oO]|[nN])$ ]] ; then
    print "$YELLOW" "warning:: Proceeding with no backup."
else
    BAKNAME="$HOME/config-$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

    if ! tar czf $BAKNAME $(printf "$DOTS_DIR/%s " "${CONFIG_DIRS[@]}") ; then
        print "$RED" "error:: Could not create backup, exiting..." >&2
        exit 1
    fi

    print "$GREEN" "Successfully created backup @ "$BAKNAME""
fi

for dir in ${CONFIG_DIRS[@]} ; do
    if rm -rf $DOTS_DIR/$dir && cp -Tr $PKGDIR/$dir $DOTS_DIR/$dir ; then
        print "$GREEN" "[v] Copied "$PKGDIR/$dir" -> "$DOTS_DIR/$dir""
    else
        print "$RED" "[x] Could not copy "$PKGDIR/$dir""
        exit 1
    fi
done

hyprctl reload >/dev/null

print "$GREEN" "Successfully loaded lvcc0/dotfiles!"
echo "You may restart your computer if you want."
