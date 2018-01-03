
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
nnoremap <C-N> :tabnew<CR>
noremap <F3> :execute "Ags " . expand("<cword>") <CR>
noremap <F5> :NERDTree <CR>
noremap <F8> :TagbarToggle<CR>
noremap <silent> <C-_>h :set hlsearch! hlsearch?<CR>
noremap <silent> <C-_>y :let @+=expand("<cword>")<CR>
