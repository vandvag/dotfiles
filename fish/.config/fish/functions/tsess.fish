function tsess --description 'Tmux sessionizer script'
    if not type -q tmux
        echo "This script requires tmux! Make sure to install it" >&2
        return 1
    end

    if not type -q fzf
        echo "This script requires fzf! Make sure to install it" >&2
        return 1
    end

    if set -q argv[1]
        set selected $argv[1]
    else
        set selected (find ~/dev ~/.dotfiles ~/qmk_firmware/ -mindepth 0 -maxdepth 2 -type d | fzf)
    end

    if test -z "$selected"
        return 0
    end

    set session_name (basename "$selected" | tr . _)
    set tmux_running (pgrep tmux)

    if not set -q TMUX; and test -z "$tmux_running"
        tmux new-session -s $session_name -c $selected
        return 0
    end

    if not tmux has-session -t=$session_name 2>/dev/null
        tmux new-session -ds $session_name -c $selected
    end

    tmux switch-client -t $session_name
end
