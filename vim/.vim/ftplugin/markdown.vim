augroup RemoveWhiteSpace
  autocmd!
augroup END
autocmd BufEnter,BufRead *.md :setlocal conceallevel=0

noremap <silent> <C-_>t :LivedownPreview<CR>
