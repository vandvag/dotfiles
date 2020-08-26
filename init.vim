"
" .vimrc Evangelos Vandoros
" last edit: 26.08.2020
"

" define the leader key
nnoremap <Space> <NOP>
let mapleader="\<Space>"

" Basic functionality
syntax on
set guicursor=
set number
set nohlsearch " No highlighting when searching
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set nobackup
set noswapfile " no annoying swap files everywhere
set incsearch
set encoding=utf8 " Default encoding
set laststatus=2 " Display statusline
set noshowmode " Hide the mode at the right bottom (since we are using lightline)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quicker Saving
nmap <leader>w :w!<cr>

" Quicker quiting
nmap <leader>q :q<cr>

" Shift Y -> copy from cursor till end of line instead of complete line
nmap <Y> y$

" <leader>y copies to system clipboard
" <leader>p pastes from system clipboard
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>P "*P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""
"  Split behavior  "
""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime leads to notoiceable 
" delays and poor user experience
set updatetime=50

call plug#begin(stdpath('data'))
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'itchyny/lightline.vim'
call plug#end()

" Gruvbox colorscheme
colorscheme gruvbox
set background=dark

let g:rainbow_active = 1

let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
