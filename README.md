## VIM Configuration

Configuración de VIM propia, está siendo constantemente iterada.

##### Themes

Out of the box themes:

- Nord.
- One dark.

```bash
:colorscheme onedark | nord
```

##### Profiling

_Nota: Se podría implementar una pequeña función_

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
:noautocmd qall! | :qall!
```
