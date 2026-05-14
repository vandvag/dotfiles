if type -q bat
    function cat --wraps=bat --description 'alias cat=bat'
        bat $argv
    end
else
    function cat --wraps=cat --description 'cat'
        command cat $argv
    end
end
