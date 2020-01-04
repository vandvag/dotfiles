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

" Autoformat plugin
Plug 'Chiel92/vim-autoformat'

" Vim Fugitive (git)
Plug 'tpope/vim-fugitive'
call plug#end()


"""""""""""""""""
"  UI Settings  " 
"""""""""""""""""
set number
set cursorline " Highlight current line
set showmatch  " Highlight matching [{()}]
syntax on " Enable syntax highlighting
set background=dark " Set dark colorscheme
colorscheme gruvbox
set laststatus=2 " Display statusline
set noshowmode " Hide the mode at the right bottom (since we are using lightline)


"""""""""""""""""""""""""""""""""
"  Gruvbox theme configuration  "
"""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark='medium'


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


"""""""""""""""""""""""""""""
"  Lightline configuration  "
"""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
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

" vim-autoformat config
noremap <F3> :Autoformat<CR>

" Automatically load external changes
set autoread
