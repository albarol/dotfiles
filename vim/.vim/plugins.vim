"""""""""""
" Plugins "
"""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" CVS (Content Version Control)
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Prompt
Plugin 'bling/vim-airline'

" Filesystem
Plugin 'kien/ctrlp.vim.git'
Plugin 'scrooloose/nerdtree.git'

" Python IDE
Plugin 'klen/python-mode.git'
Plugin 'tomtom/tlib_vim'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""
" Plugins Confugiration "
"""""""""""""""""""""""""

" Prompt
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" Filesystem
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pyo,*.pyd
let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$', }


" Python IDE
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

set nofoldenable
let g:pymode_lint_on_write = 1
let g:pymode_lint_ignore = 'E501'
let g:pymode_options_max_line_length = 119
let g:pymode_rope_goto_definition_cmd = 'tabnew'
let g:pymode_rope_completion = 0
