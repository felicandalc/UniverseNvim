" Enable autoformatting
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html PrettierAsync

" Force prettier to run async
let g:prettier#exec_cmd_async = 1

" Search for config
let g:prettier#autoformat_config_present = 1

" Name of config files
let g:prettier#autoformat_config_files = ['.prettierrc', '.prettierrc.js', '.prettierrc.json']

" Override config with project's one
let g:prettier#config#config_precedence = 'file-override'

" Disable quickfix
let g:prettier#quickfix_enabled = 0

" Tab width
let g:prettier#config#tab_width = '4'

" Use tabs
let g:prettier#config#use_tabs = 'true'
