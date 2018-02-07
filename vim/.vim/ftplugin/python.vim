" Load functions
source $HOME/.vim/functions/python.vim

" EDITOR
set shiftwidth=4
set softtabstop=4
set tabstop=4
"
" Filesystem
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pyo,*.pyd
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.pyd$']

" FZF python
let $FZF_DEFAULT_COMMAND = 'ag -l -p $HOME/.zsh-configs/ag/python.ignore -g ""'

" Python IDE
let g:ale_linters = {'py': ['flake8']}
let g:ale_open_list = 1

" Mapping
noremap <silent> <C-_>c :call ModuleToClipboard()<CR>
noremap <silent> <leader>b :call marvim#run('python:ipdb')<CR>
