

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
nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-N> :tabnew<CR>

map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F5> :NERDTree <CR>
map <C-f> :FindInFiles 
map <C-l> :execute "/" . expand("<cword>")<CR>
nmap <F8> :TagbarToggle<CR>
