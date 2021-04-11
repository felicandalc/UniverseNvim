" Leader
let mapleader=" "
nnoremap <SPACE> <Nop>
inoremap jk <ESC>
vnoremap jk <ESC>
cnoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
vmap <C-y> "+y
vmap <A-P> "+p
nnoremap <CR> :noh<CR><CR>
inoremap <key> <C-o>de

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <leader>O O<ESC>O
nnoremap <leader>o o<cr>

noremap w b
noremap <leader>w vb
noremap <leader>e ve
