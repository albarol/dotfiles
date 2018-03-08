augroup RemoveWhiteSpace
  autocmd!
augroup END
autocmd BufEnter,BufRead *.md :set conceallevel=0

noremap <silent> <C-_>t :LivedownPreview<CR>
