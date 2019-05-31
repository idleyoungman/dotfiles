call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'hashivim/vim-terraform'
Plug 'lotabout/skim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pearofducks/ansible-vim'
Plug 'rodjek/vim-puppet'
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

"toothpaste theme
colorscheme toothpaste

" syntastic opts
let g:syntastic_go_checkers=['go', 'gofmt', 'golint', 'govet']
let g:syntastic_python_checkers=['pylint']
let g:syntastic_perl_checkers=['perlcritic']
let g:syntastic_puppet_puppet_exe = 'LC_ALL=' . $LC_ALL . ' puppet'
let g:syntastic_puppet_puppetlint_exe='LC_ALL=' . $LC_ALL . ' puppet-lint'
let g:syntastic_ruby_checkers=['mri', 'ruby-lint', 'rubocop']

