"""""""""""
" Plugins "
"""""""""""

call plug#begin('~/.vim/plugged')

" Misc
Plug 'gabesoft/vim-ags', { 'on': 'Ags' }
Plug 'mhinz/vim-startify'
Plug 'fakeezz/marvim'

" CVS (Content Version Control)
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Filesystem
Plug 'junegunn/fzf', { 'on': 'FZF' }
Plug 'junegunn/fzf.vim', { 'on': ['Tags', 'BTags'] }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" IDE
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'w0rp/ale'

" Languages
Plug 'ap/vim-css-color', { 'for': 'css' }

" Editor
Plug 'Yggdroot/indentLine'

" Prompt
Plug 'vim-airline/vim-airline'
Plug 'mkitt/tabline.vim'

filetype plugin indent on
call plug#end()


"""""""""""""""""""""""""
" Plugins Configuration "
"""""""""""""""""""""""""

" Prompt
let g:airline_symbols = get(g:, 'airline_symbols', {})

" CVS
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" IDE
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:ags_enable_async = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1
let g:ale_fix_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_completion_enabled = 0

" identLine
let g:indentLine_color_term = 238

" config FZF_DEFAULT_COMMAND
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" marvim
let g:marvim_find_key = '<C-m>f'
let g:marvim_store_key = '<C-m>k'
let g:marvim_prefix_on_load = 0

" Hooks
autocmd BufWritePre * :%s/\s\+$//e
