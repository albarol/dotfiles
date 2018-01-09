"""""""""""
" Plugins "
"""""""""""

call plug#begin('~/.vim/plugged')
" Misc
Plug 'tpope/vim-dispatch'
Plug 'gabesoft/vim-ags'
Plug 'mhinz/vim-startify'

" CVS (Content Version Control)
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Prompt
Plug 'bling/vim-airline'

" Filesystem
" Plugin 'kien/ctrlp.vim.git'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" IDE
Plug 'tomtom/tlib_vim'
Plug 'troydm/zoomwintab.vim'
Plug 'majutsushi/tagbar'
Plug 'gcmt/taboo.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'vim-syntastic/syntastic'

" Languages
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Editor
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'

filetype plugin indent on
call plug#end()


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

" IDE
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:ags_enable_async = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" identLine
let g:indentLine_color_term = 238

" config FZF_DEFAULT_COMMAND
let $FZF_DEFAULT_COMMAND = 'ag -l --ignore={}'
