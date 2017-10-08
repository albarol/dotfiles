
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

map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j %" <Bar> cw<CR>
map <F5> :NERDTree <CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-_> :set hlsearch! hlsearch?<CR>
