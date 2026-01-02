#!/usr/bin/bash

PKGDIR="$( cd -- "$(dirname "$0")/.." >/dev/null 2>&1; pwd -P )"
DIRS=("dunst" "hypr" "kitty" "scripts" "wallpapers" "waybar" "wofi")

if [[ "$(id -u)" -ne 0 ]]; then
    echo "This script must be run with sudo in order to load ly config."

    read -r -p "Do you wish to proceed without sudo? (ly config won't be loaded) [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        echo "Proceeding without ly config."
    else
        echo "Exiting. Please, restart script with sudo."
        exit 0
    fi
else
    HOME="/home/$SUDO_USER"
fi

echo "This script will overwrite $HOME/.config with the files this script is packaged with ($PKGDIR)."
echo "Following directories and files will be overwritten:"
for dir in ${DIRS[@]}; do
    echo $HOME/.config/$dir
done
if [[ "$(id -u)" -eq 0 ]]; then
    echo /etc/ly/config.ini
fi

read -r -p "Do you wish to create a backup of ~/.config? (without /etc/ly/config.ini) [Y/n] " response
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

if [[ "$(id -u)" -eq 0]]; then
    cp -v $PKGDIR/ly/config.ini /etc/ly
fi
