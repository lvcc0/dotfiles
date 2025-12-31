#!/bin/bash

if [ $# -ne 1 ]; then
    echo "error:: must specify target directory." >&2
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "error:: $1 is not a directory or does not exist." >&2
    exit 1
fi

cp -r $HOME/.config/{dunst,hypr,kitty,scripts,wallpapers,waybar,wofi} $1

