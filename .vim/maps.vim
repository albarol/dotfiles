

""""""""""""""""
" Remove arrows
""""""""""""""""
map <up> <nop>
map <left> <nop>
map <down> <nop>
map <right> <nop>

"""""""""""""""""""""""
" Remapping navigation
"""""""""""""""""""""""
noremap ç l
noremap l k
noremap k j
noremap j h

map <leader>ç :wincmd l<CR>
map <leader>l :wincmd k<CR>
map <leader>k :wincmd j<CR> 
map <leader>j :wincmd h<CR> 

nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-N> :tabnew<CR>
nnoremap <C-W> :q<CR>

"""""""""""""""""""""""
" Shotcurts 
"""""""""""""""""""""""
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <C-f> :FindInFiles 
map <F5> :NERDTree <CR>
map <leader>s :w <CR>

