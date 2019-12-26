" .vimrc, Evangelos Vandoros
"
set number
syntax on

" Plugins

call plug#begin('~/.vim/plugged')
" Lightline
Plug 'itchyny/lightline.vim'

" NERDTree
Plug 'scrooloose/nerdtree'

" Gitgutter
Plug 'vim-scripts/vim-gitgutter'
call plug#end()

" Indenting behavior
set autoindent
set smartindent
set shiftwidth=4  expandtab
set smarttab
set softtabstop=4
set cinkeys-=0#
set indentkeys-=0#

" Shift Y -> copy from cursor till end of line instead of complete line
nmap <Y> y$

" Lightline configurations
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" NERDTree Configuration
map <C-o> :NERDTreeToggle<CR>
