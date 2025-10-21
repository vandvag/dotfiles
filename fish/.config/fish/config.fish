if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Abbreviations

# Neovim
abbr -a v nvim

# Lazygit
abbr -a lgit lazygit
abbr -a z zoxide

# Starship
starship init fish | source

# Zoxide
zoxide init fish | source
