
" Prettify XML
" ------------
"
" This function gets any xml to apply a prettyfication
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXml call DoPrettyXML()

" Prettify Json
" ------------
"
" This function gets any json to apply a prettyfication
function! DoPrettyJson()
  silent %!python -m json.tool
endfunction
command! PrettyJson call DoPrettyJson()

" RemoveTab
" ------------
"
" This function replaces all tabs to spaces
command! -nargs=0 RemoveTab execute "%s/\t/    /gi" <Bar> cw


" ModuleToClipboard
" -----------------
"
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
