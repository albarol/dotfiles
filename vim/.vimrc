
""""""""""""""
" => General "
""""""""""""""
set sh=/bin/bash
set t_Co=256
set number relativenumber
set ls=2
set title
set nocompatible
language en_US.utf8

set ruler
set cursorline
set incsearch
set showmode
set history=1000
set splitbelow
set splitright
syntax on
filetype indent plugin on

set nobackup
set autowrite
set noswapfile

set nowrap
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=4
set backspace=indent,eol,start
set autoindent
set nofoldenable

setglobal complete=.,w,b,u,t
setlocal complete=.,w,b,u,t

""""""""""""""
" => Plugins "
""""""""""""""
source ~/.vim/plugins.vim

""""""""""""""""
" => Functions "
""""""""""""""""
source ~/.vim/functions/general.vim

"""""""""""""""
" => Mappings "
"""""""""""""""
source ~/.vim/maps.vim

"""""""""""""
" => Scheme "
"""""""""""""
colorscheme apprentice
