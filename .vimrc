
""""""""""""""""""""""
" => General
""""""""""""""""""""""
set t_Co=256
set number
set ls=2
set title
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
autocmd BufWritePre * :%s/\s\+$//e

set ruler
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

""""""""""""""""""""""
" => Functions 
""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
source ~/.vim/functions.vim

"""""""""""""""""""""
" => Mappings
""""""""""""""""""""
source ~/.vim/maps.vim

""""""""""""""""""""""
" => Scheme
""""""""""""""""""""""
colorscheme Monokai

""""""""""""""""""""""
" => Plugins 
""""""""""""""""""""""
source ~/.vim/plugins.vim

