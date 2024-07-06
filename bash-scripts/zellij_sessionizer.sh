#!/usr/bin/env bash

# https://gist.github.com/silicakes/ad6da190d9c05270bc651086c200f8b2

if ! [ -x "$(command -v zellij)" ]; then
    echo "This script requires zellij! Make sure to install it"
    exit 0
fi

if ! [ -x "$(command -v fzf)" ]; then
    echo "This script requires fzf! Make sure to install it"
    exit 0
fi

if [[ $# -eq 1 ]]; then
    selected=$1
else
    # Use fd if it's installed in the system
    # if [ -x "$(command -v fd)" ]; then
    #     selected=$(fd -a -d 2 -t d . ~/dev/ ~/.dotfiles | fzf)
    # else
    #     selected=$(find ~/dev/ ~/.dotfiles/ -mindepth 1 -maxdepth 1 -type d | fzf)
    # fi
    selected=$(find ~/dev ~/.dotfiles -mindepth 0 -maxdepth 2 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
zellij_running=$(pgrep zellij)

if [[ -z $ZELLIJ ]]; then
    cd $selected
    zellij attach $session_name -c
    exit 0
fi

zellij action new-pane

