" EDITOR
set shiftwidth=2
set softtabstop=2

" IDE
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'eslint'

" Shortcuts
noremap <silent> <C-_>l :SyntasticCheck<CR>
