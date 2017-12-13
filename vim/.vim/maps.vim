
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
noremap <silent> <C-_><C-c> :call ModuleToClipboard() <CR>
noremap <C-_><C-_> :set hlsearch! hlsearch?<CR>
noremap <C-_><C-f> :CtrlPFunky<CR>
noremap <C-_><C-l> :PymodeLint<CR>
noremap <silent> <C-_><C-y> :let @+=expand("<cword>")<CR>
