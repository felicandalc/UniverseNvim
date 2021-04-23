" Ignore
let g:ctrlp_user_command = ['/.git', 'cd %s && git ls-files -co --exclude-standard']

" Mappings
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("v")': ['<c-b>'],
    \ }
