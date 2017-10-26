
""""""""""""""
" => General "
""""""""""""""
set sh=/bin/bash
set t_Co=256
set number relativenumber
set ls=2
set title
set nocompatible
filetype off

autocmd BufWritePre * :%s/\s\+$//e

set ruler
set cursorline
set showmode
set history=1000
syntax on

set nobackup
set autowrite
set noswapfile

set nowrap
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set autoindent

""""""""""""""
" => Plugins "
""""""""""""""
source ~/.vim/plugins.vim

""""""""""""""""
" => Functions "
""""""""""""""""
source ~/.vim/functions.vim

"""""""""""""""
" => Mappings "
"""""""""""""""
source ~/.vim/maps.vim

"""""""""""""
" => Scheme "
"""""""""""""
colorscheme apprentice
