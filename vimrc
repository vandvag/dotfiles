" .vimrc, Evangelos Vandoros
"

"""""""""""""
"  Plugins  "
"""""""""""""
call plug#begin('~/.vim/plugged')
" Lightline
Plug 'itchyny/lightline.vim'

" NERDTree
Plug 'scrooloose/nerdtree'

" Gitgutter
Plug 'vim-scripts/vim-gitgutter'

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'

"Onedark colorscheme
Plug 'joshdick/onedark.vim'

" Linter
" Plug 'dense-analysis/ale'

" Vim Fugitive (git)
Plug 'tpope/vim-fugitive'
call plug#end()


"""""""""""""
"  General  "
"""""""""""""
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Define the leader key
nnoremap <Space> <NOP>
let mapleader = "\<Space>"

" Quicker Saving
nmap <leader>w :w!<cr>

" Quicker quiting
nmap <leader>q :q<cr>

" Shift Y -> copy from cursor till end of line instead of complete line
nmap <Y> y$


"""""""""""""""""
"  UI Settings  "
"""""""""""""""""
set number " Show line numbers
set cursorline " Highlight current line
set showmatch  " Highlight matching [{()}]
syntax on " Enable syntax highlighting
set background=dark " Set dark colorscheme
" colorscheme onedark " Enable gruvbox colorscheme
set laststatus=2 " Display statusline
set noshowmode " Hide the mode at the right bottom (since we are using lightline)
" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set encoding=utf8 " Default encoding


"""""""""""""""""""""""""""""""""
"  Gruvbox theme configuration  "
"""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark='medium'


""""""""""""""""""""""""
"  Indenting behavior  "
""""""""""""""""""""""""
set expandtab " Tabs are spaces
set autoindent
set smartindent
set shiftwidth=4
set smarttab
set softtabstop=4
set cinkeys-=0#
set indentkeys-=0#


"""""""""""""""
"  Searchnig  "
"""""""""""""""
set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching

" Highlight matching search patterns
set hlsearch

"This unsets the "last search pattern" register by hitting return
" nnoremap <CR> :noh<CR><CR>:<backspace>
map <silent> <leader><cr> :noh<cr>


"""""""""""""""""""""""""""""
"  Files, backups and undo  "
"""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


""""""""""""""""""""
"  Split behavior  "
""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


"""""""""""""""""""""""""""""
"  Lightline configuration  "
"""""""""""""""""""""""""""""
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }


""""""""""""""""""""""""""""
"  NERDTree Configuration  "
""""""""""""""""""""""""""""
map <C-o> :NERDTreeToggle<CR>


" vim-autoformat config
noremap <F3> :Autoformat<CR>

