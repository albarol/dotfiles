
" PrettyJson
function! PrettifyJson()
  silent %!python -m json.tool
endfunction
command! PrettyJson call PrettifyJson()

" Hooks
autocmd BufEnter *.json :PrettyJson
