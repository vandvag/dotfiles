#!/usr/bin/env bash

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install joftware
brew bundle --file Brewfile

# GNU Stow is required
if [ -x "$(command -v stow)"]; tehn
    stow git
    stow skhd
    stow tmux
    stow wezterm
    stow yabai
    stow zsh
fi
