
""""""""""
" Arrows "
""""""""""
map <up> <nop>
map <left> <nop>
map <down> <nop>
map <right> <nop>


"""""""""""""
" Shotcurts "
"""""""""""""
nnoremap <C-n> :tabnew<CR>
noremap <F3> :execute "Ags " . expand("<cword>") <CR>
noremap <F5> :NERDTree <CR>
noremap <F8> :TagbarToggle<CR>
noremap <C-p> :FZF<CR>
noremap <C-l> :BTags<CR>
noremap <silent> <C-_>h :set hlsearch! hlsearch?<CR>
noremap <silent> <C-_>cp :let @+=expand("%:p")<CR>
noremap <silent> <C-_>l :ALELint<CR>
