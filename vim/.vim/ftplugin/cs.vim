""""""""""""""""
" => Editor    "
""""""""""""""""
set shiftwidth=4
set softtabstop=4

"""""""""""""""""
" => Configs    "
"""""""""""""""""
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.pyd$']

" FZF python
let $FZF_DEFAULT_COMMAND = 'ag -l -p $HOME/.zsh-configs/ag/cs.ignore -g ""'
