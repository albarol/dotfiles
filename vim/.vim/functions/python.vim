
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
