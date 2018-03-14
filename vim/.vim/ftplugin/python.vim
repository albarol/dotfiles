""""""""""""""""
" => Functions "
""""""""""""""""

" This function copies the complete module path to clipboard
function! ModuleToClipboard()
  let l:word=expand("<cword>")

  if l:word != ""
    let l:package=expand("%:r")
  else
    let l:word=expand("%:t:r")
    let l:package=expand("%:h:r")
  endif

  let l:path = "from " . l:package . " import " . l:word

  let l:path=substitute(l:path, "/", ".", "g")
  let @+=l:path
endfunction

" This function shows the test path for that file
function! GetPytestPath()
  let l:word=expand("<cword>")

  if l:word != ""
    let l:path=expand("%") . " -k " . l:word
  else
    let l:path=expand("%")
  endif

  let @+=l:path
  echo l:path
endfunction

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
let $FZF_DEFAULT_COMMAND = 'ag -l -p $HOME/.zsh-configs/ag/python.ignore -g ""'

" Python IDE
let g:ale_linters = {'py': ['flake8']}
let g:ale_python_flake8_options = '--config=$HOME/.zsh-configs/linters/.flake8'
let g:ale_open_list = 1

" Mapping
noremap <silent> <C-_>c :call ModuleToClipboard()<CR>
noremap <silent> <leader>b :call marvim#run('python:ipdb')<CR>
noremap <silent> <C-_>t :term python<CR>

" Commands
command! PytestPath :call GetPytestPath()
