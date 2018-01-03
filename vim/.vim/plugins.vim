"""""""""""
" Plugins "
"""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Misc
Plugin 'tpope/vim-dispatch'
Plugin 'gabesoft/vim-ags'
Plugin 'mhinz/vim-startify'

" CVS (Content Version Control)
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Prompt
Plugin 'bling/vim-airline'

" Filesystem
Plugin 'kien/ctrlp.vim.git'
Plugin 'scrooloose/nerdtree.git'

" IDE
Plugin 'tomtom/tlib_vim'
Plugin 'troydm/zoomwintab.vim'
Plugin 'majutsushi/tagbar'
Plugin 'gcmt/taboo.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'vim-syntastic/syntastic'

" Languages
Plugin 'klen/python-mode.git'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'

" Editor
Plugin 'tpope/vim-surround'
Plugin 'wellle/targets.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""
" Plugins Configuration "
"""""""""""""""""""""""""

" Prompt
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" CVS
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Filesystem
let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$', }

" IDE
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:ags_enable_async = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" identLine
let g:indentLine_color_term = 238
