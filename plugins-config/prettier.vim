" Enable autoformatting
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Force prettier to run async
let g:prettier#exec_cmd_async = 1

" Search for config
let g:prettier#autoformat_config_present = 1
