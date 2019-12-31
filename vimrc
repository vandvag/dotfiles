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
call plug#end()


"""""""""""""""""
"  UI Settings  " 
"""""""""""""""""
set number
set cursorline " Highlight current line
set showmatch  " Highlight matching [{()}]
syntax on


""""""""""""""""""""""""
"  Indenting behavior  "
""""""""""""""""""""""""
set autoindent
set smartindent
set shiftwidth=4
set expandtab " Tabs are sapces
set smarttab
set softtabstop=4
set cinkeys-=0#
set indentkeys-=0#

" Shift Y -> copy from cursor till end of line instead of complete line
nmap <Y> y$

" Lightline configuration
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" NERDTree Configuration
map <C-o> :NERDTreeToggle<CR>


""""""""""""""""""""
"  Split behavior  "
""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
