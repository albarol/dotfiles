" EDITOR
set shiftwidth=4
set softtabstop=4
set tabstop=4
"
" Filesystem
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.pyo,*.pyd
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.pyd$']

" Python IDE
set nofoldenable
let g:pymode_lint_on_write = 0
let g:pymode_options_max_line_length = 119
let g:pymode_rope_goto_definition_cmd = 'tabnew'
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_regenerate_on_write = 0
let g:ale_linters = {'py': ['flake8']}
let g:ale_open_list = 1

" Shortcuts
noremap <silent> <C-_>c :call ModuleToClipboard() <CR>
