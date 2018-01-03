" Filesystem
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pyo,*.pyd
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.pyd$']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|pyc|pyo|pyd))$'

" Python IDE
set nofoldenable
let g:pymode_lint_on_write = 0
let g:pymode_options_max_line_length = 119
let g:pymode_lint_ignore = "E501"
let g:pymode_rope_goto_definition_cmd = 'tabnew'
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_regenerate_on_write = 0


" Shortcuts
noremap <silent> <C-_>c :call ModuleToClipboard() <CR>
noremap <silent> <C-_>l :PymodeLint<CR>
