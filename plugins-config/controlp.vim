" Custom ignore
let g:ctrlp_user_command = ['/.git', 'cd %s && git ls-files -co --exclude-standard']

" Ignore
let g:ctrlp_custom_ignore = {
    \ 'dir': 'node_modules',
    \ 'dir': '.git'
} 

" Mappings
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("v")': ['<c-b>'],
    \ }

let g:ctrlp_working_path_mode = 'cr'
