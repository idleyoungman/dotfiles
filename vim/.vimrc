call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
call plug#end()

"indent
set autoindent
filetype plugin indent on

"solarized
set background=dark
colorscheme solarized
