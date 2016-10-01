call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
call plug#end()

"brackets
set showmatch
set matchtime=7

"indent
set autoindent
filetype plugin indent on

"search
set hlsearch
set ignorecase
set smartcase

"solarized
set background=dark
colorscheme solarized

