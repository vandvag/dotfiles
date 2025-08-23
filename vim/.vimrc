set number
set relativenumber
set cursorline

" search
set hlsearch
set incsearch
set ignorecase
set grepprg="rg -i"

set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

set shortmess=atTI


set showmatch

set noswapfile

syntax on
" Show partial command as you type
set showcmd

set shiftwidth=8
set tabstop=8
set softtabstop=8
set expandtab "convert tabs into spaces

"------------------STATUS_LINE------------------

" Status line
set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=%1*
set statusline+=\ 
set statusline+=%3*
set statusline+=\ 
set statusline+=%f
set statusline+=\ 
set statusline+=\ 
set statusline+=%4*
set statusline+=%m
set statusline+=%=
set statusline+=%h
set statusline+=%r
set statusline+=%4*
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=,
set statusline+=%c
set statusline+=\ 
set statusline+=%1*
set statusline+=|
set statusline+=%y
set statusline+=\ 
set statusline+=%4*
set statusline+=%P
set statusline+=\ 
set statusline+=%3*
set statusline+=t:
set statusline+=%n
set statusline+=\ 

" Colors
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User1 ctermbg=brown ctermfg=white guibg=black guifg=white
hi User3 ctermbg=brown  ctermfg=lightcyan guibg=black guifg=lightblue
hi User4 ctermbg=brown ctermfg=green guibg=black guifg=lightgreen


" Mode
function! StatuslineMode()
        let l:mode=mode()
        if l:mode==#"n"
                return "NORMAL"
        elseif l:mode==#"V"
                return "VISUAL LINE"
        elseif l:mode==?"v"
                return "VISUAL"
        elseif l:mode==#"i"
                return "INSERT"
        elseif l:mode ==# "\<C-V>"
                return "V-BLOCK"
        elseif l:mode==#"R"
                return "REPLACE"
        elseif l:mode==?"s"
                return "SELECT"
        elseif l:mode==#"t"
                return "TERMINAL"
        elseif l:mode==#"c"
                return "COMMAND"
        elseif l:mode==#"!"
                return "SHELL"
        else
                return "VIM"
        endif
endfunction

"------------------KEYMAPS------------------

let mapleader = " "

map <leader>e :Lex<cr>
map <leader>o :Explore<cr>


map <leader>q :copen<cr>
map [q :cprev<cr>
map ]q :cnext<cr>

