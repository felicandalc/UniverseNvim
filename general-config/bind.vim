" Leader
let mapleader=" "
nnoremap <SPACE> <Nop>

" JK to exit
inoremap jk <ESC>
cnoremap jk <ESC>

" Copy + paste from system clipboard
nmap <C-c> "+y
nmap <C-v> "+p
vmap <C-c> "+y
vmap <C-v> "+p
nnoremap <CR> :noh<CR><CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Insert two lines
nnoremap <leader>O O<ESC>O
nnoremap <leader>o o<cr>

" Save
noremap <leader>s :w<CR>

" Moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Close current buffer
noremap <C-w> :bdelete<CR>

" Move between buffers
noremap <C-a> :bprevious<CR>
noremap <C-s> :bnext<CR>
