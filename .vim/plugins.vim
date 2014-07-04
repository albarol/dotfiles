"""""""""""""""""""""""
" Plugins
""""""""""""""""""""""

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'bling/vim-airline'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'https://github.com/majutsushi/tagbar.git'
Bundle 'airblade/vim-gitgutter'
Bundle 'https://github.com/scrooloose/nerdtree.git'
"Bundle 'msanders/snipmate.vim'
"Bundle 'git://github.com/klen/python-mode.git'

"""""""""""""""""
" CtrlP 
"""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pyo,*.pyd

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ }

"""""""""""""""""
" Airlines
"""""""""""""""""
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '<'
"let g:airline_left_sep = '<'
"let g:airline_right_sep = '>'
"let g:airline_right_sep = '>'
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.branch = ''

""""""""""""""""
" Python-Mode
""""""""""""""""
"let g:pymode = 1
"let g:pymode_folding = 0

