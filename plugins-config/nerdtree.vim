let g:NERDTreeHijackNetrw = 0

augroup NERDTreeHijackNetrw
  autocmd VimEnter * silent! autocmd! FileExplorer
augroup END

" sync open file with NERDTree
 " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! SyncTree()
  "if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()
"au VimEnter * NERDTree

" Toggle NERDTree
nmap <C-n> :NERDTreeToggle<cr>

" Comment line
vmap <C-k> <plug>NERDCommenterToggle
nmap <C-k> <plug>NERDCommenterToggle

" Show hidden files
let NERDTreeShowHidden = 1

" Hide node_modules
let NERDTreeIgnore=['node_modules', '.git']
