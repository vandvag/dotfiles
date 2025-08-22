#!/usr/bin/env bash

# This script is based on the tmux-sessionizer script by ThePrimeagen
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

if ! [ -x "$(command -v tmux)" ]; then
    echo "This script requires tmux! Make sure to install it"
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
    selected=$(find ~/dev ~/.dotfiles ~/qmk_firmware/ -mindepth 0 -maxdepth 2 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
