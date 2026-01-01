#!/usr/bin/bash

PKGDIR="$( cd -- "$(dirname "$0")/.." >/dev/null 2>&1; pwd -P )"
DIRS=("dunst" "hypr" "kitty" "scripts" "wallpapers" "waybar" "wofi")

echo "This script will overwrite $HOME/.config with the files this script is packaged with ($PKGDIR)."
echo "Following directories will be overwritten:"
for dir in ${DIRS[@]}; do
    echo $HOME/.config/$dir
done

read -r -p "Do you wish to create a backup of these directories? [Y/n] " response
if [[ "$response" =~ ^([nN][oO]|[nN])$ ]]; then
    echo "Proceeding without backup."
else
    BACKUPNAME="$HOME/config-$(date +%Y-%m-%d).tar.gz"

    if ! tar czf $BACKUPNAME $(printf "$HOME/.config/%s " "${DIRS[@]}"); then
        echo "error:: could not create backup." >&2
        exit 1
    fi

    echo "Created backup "$BACKUPNAME"."
fi

for dir in ${DIRS[@]}; do
    rm -rf $HOME/.config/$dir && cp -Trv $PKGDIR/$dir $HOME/.config/$dir
done

