" auto-install vim-plug
let _vim = stdpath('config')
if empty(glob(_vim . '/autoload/plug.vim'))
    silent execute '!curl -fLo ' . _vim . '/autoload/plug.vim --create-dirs '
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Better syntax
  Plug 'sheerun/vim-polyglot'
  " Auto pairs for delimiters
  Plug 'jiangmiao/auto-pairs'
  " Prettier
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  " ESLint
  Plug 'eslint/eslint'
  " Themes
  Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'dracula/vim'
  Plug 'gosukiwi/vim-atom-dark'
  Plug 'ghifarit53/tokyonight-vim'
  " COC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " NERDFont
  Plug 'lambdalisue/nerdfont.vim'
  " Fern
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  Plug 'lambdalisue/fern-git-status.vim'
  Plug 'lambdalisue/fern-hijack.vim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'APZelos/blamer.nvim'
  " Go
  Plug 'godoctor/godoctor.vim'
  Plug 'fatih/vim-go'
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-go'
  Plug 'jodosha/vim-godebug'
  " Airline
  Plug 'vim-airline/vim-airline'
  " JavaScript
  Plug 'pangloss/vim-javascript'
  " TypeScript
  Plug 'leafgarland/typescript-vim'
  " JSX
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'peitalin/vim-jsx-typescript'
  " JSDoc
  Plug 'heavenshell/vim-jsdoc', { 
    \ 'for': ['javascript', 'javascript.jsx','typescript'], 
    \ 'do': 'make install'
  \}
  " Styled components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  " GraphQL
  Plug 'jparise/vim-graphql'
  " Hexokinase (colorizer)
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  " ctrlp
  Plug 'ctrlpvim/ctrlp.vim'
  " Surround
  Plug 'tpope/vim-surround'
  " Emmet
  Plug 'mattn/emmet-vim'
  " Asyncrun
  Plug 'skywind3000/asyncrun.vim'
  " Alias
  Plug 'Konfekt/vim-alias'
  " Startup
  Plug 'mhinz/vim-startify'
  " Prisma
  Plug 'pantharshit00/vim-prisma'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Commentaries
  Plug 'tpope/vim-commentary'
  " Tables
  Plug 'dhruvasagar/vim-table-mode'

call plug#end()
