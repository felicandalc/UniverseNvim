" Leader
let mapleader=" "
nnoremap <SPACE> <Nop>

" JK to exit
inoremap jk <ESC>
vnoremap jk <ESC>
cnoremap jk <ESC>

" Copy + paste from system clipboard
nmap <C-y> "+y
nmap <C-v> "+p
nnoremap <CR> :noh<CR><CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Insert two lines
nnoremap <leader>O O<ESC>O
nnoremap <leader>o o<cr>

" Save
noremap <leader>s :update<CR>
