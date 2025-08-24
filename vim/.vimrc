"
" ~/.vimrc
"
" Author: Evangelos Vandoros
"
" Description
" -----------
"
" This is my Vim configuration file. The purpose of this configuration file is to keep things simple. I use no plugins
" whatsoever, and have little keybindings. The goal here is to create a very portable Vim configuration that can work
" out of the box in every computer. Vim is just a text editor. This configuration provides some sane defaults.
"
" This file is part of my dotfiles: https://github.com/vandvag/dotfiles.git
"

set nocompatible   "do not preserve compatibility with vi
set encoding=utf-8 "default character encoding
set autoread       "detect when a file has been modified externally
set updatetime=300
set undolevels=1000 "how many undo levels to keep in memory
set showcmd         "show commands as you type them
set number
set relativenumber
set cursorline
set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P
set shortmess=atTI
set autoindent
set shiftwidth=8
set tabstop=8
set softtabstop=8
set expandtab "convert tabs into spaces
set smarttab
" search
set hlsearch
set incsearch
set ignorecase
set grepprg="rg -i"
set showmatch
" undo/swap files
set noswapfile
set nobackup
set history=1000
if version >= 703
        set undodir=~/.vim/backup
        set undofile
        set undoreload=10000
endif
syntax on

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

" Moving lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
