"""""""""""
" Plugins "
"""""""""""

call plug#begin('~/.vim/plugged')

" Misc
Plug 'gabesoft/vim-ags'
Plug 'mhinz/vim-startify'

" CVS (Content Version Control)
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Filesystem
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" IDE
Plug 'tomtom/tlib_vim'
Plug 'troydm/zoomwintab.vim'
Plug 'majutsushi/tagbar'
Plug 'gcmt/taboo.vim'
Plug 'w0rp/ale' " Async Linter

" Languages
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'ap/vim-css-color', { 'for': 'css' }

" Editor
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'

" Prompt
Plug 'vim-airline/vim-airline'
Plug 'mkitt/tabline.vim'

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

let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 0

" identLine
let g:indentLine_color_term = 238

" config FZF_DEFAULT_COMMAND
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

 "Set json as javascript
autocmd BufNewFile,BufRead *.json set ft=javascript
