" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Better syntax
  Plug 'sheerun/vim-polyglot'
  " Auto pairs for delimiters
  Plug 'jiangmiao/auto-pairs'
  " Prettier
  Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }
  " ESLint
  Plug 'eslint/eslint' 
  " Themes
  Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim'
  " COC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " NERDTree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdcommenter'
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
  
call plug#end()
