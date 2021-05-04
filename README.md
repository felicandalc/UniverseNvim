## Neovim Configuration

Configuración de Neovim propia, está siendo constantemente iterada.

##### Themes
_Nota: El default theme puede variar._

Out of the box themes:

- Nord.
- One dark.

```bash
:colorscheme onedark | nord
```

##### Plugins
_El plugin manager usado es [vim-plug](https://github.com/junegunn/vim-plug)._
_Nota: hay plugins que se borrarán y agregarán, debido a funcionalidad repetida._

1. [vim-polyglot](https://github.com/sheerun/vim-polyglot)
2. [auto-pairs](https://github.com/jiangmiao/auto-pairs)
3. [vim-prettier](https://github.com/prettier/vim-prettier)
4. [eslint](https://github.com/eslint/eslint)
5. [NERDTree](https://github.com/preservim/nerdtree)
6. [NERDTree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
7. [vim-NERDTree-syntax-highlight](vim-nerdtree-syntax-highlight)
8. [vim-devicons](https://github.com/ryanoasis/vim-devicons)
9. [vim-fugitive](https://github.com/tpope/vim-fugitive)
10. [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
11. [NERDCommenter](https://github.com/preservim/nerdcommenter)
12. [godoctor](https://github.com/godoctor/godoctor.vim)
13. [vim-go](https://github.com/fatih/vim-go)
14. [deoplete-go](https://github.com/deoplete-plugins/deoplete-go)
15. [vim-godebug](https://github.com/jodosha/vim-godebug)
16. [vim-airline](https://github.com/vim-airline/vim-airline)
17. [vim-javascript](https://github.com/pangloss/vim-javascript)
18. [typescript-vim](https://github.com/leafgarland/typescript-vim)
19. [vim-jsx-pretty](https://github.com/MaxMEllon/vim-jsx-pretty)
20. [vim-jsx-typescript](https://github.com/peitalin/vim-jsx-typescript)
21. [vim-styled-components](https://github.com/styled-components/vim-styled-components)
22. [vim-graphql](https://github.com/jparise/vim-graphql)
23. [vim-hexokinase](https://github.com/RRethy/vim-hexokinase)
24. [ctrlp](https://github.com/kien/ctrlp.vim)
25. [vim-surround](https://github.com/tpope/vim-surround)
26. [emmet-vim](https://github.com/mattn/emmet-vim)
27. [asyncrun](https://github.com/skywind3000/asyncrun.vim)
28. [vim-alias](https://github.com/Konfekt/vim-alias)
29. [vim-startify](https://github.com/mhinz/vim-startify)
<details>
  <summary>coc-vim</summary>

  [repo](https://github.com/neoclide/coc.nvim)
    * coc-tsserver
    * coc-angular
    * coc-css
</details>

##### Profiling

_Nota: Se podría implementar una pequeña función._

```bash
:profile start [NAME].log
```

```bash
:profile func *
```

```bash
:profile file *
```

- Realizar acciones

```bash
:profile pause
```

- Salir de VIM

```bash
:noautocmd qall! | :qall!1.
```
