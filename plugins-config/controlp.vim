" Search from
" let g:ctrlp_working_path_mode = 'wa'

" Additional markers than .git
let g:ctrlp_root_markers = 'package.json'

" Custom ignore
let g:ctrlp_user_command = ['/.git', 'cd %s && git ls-files -co --exclude-standard']

" Ignore
 let g:ctrlp_custom_ignore = './node_modules'

" Mappings
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("v")': ['<c-b>'],
    \ }

" Display hidden files
let g:ctrlp_show_hidden = 1
