# nvim
My configuration of nvim includes:
- telescope
- gruvbox theme
- lualine & bufferline
- confort (formatter)
- mason/mason-lsp (lsp manager)
- term (terminal in editor) *bugs*
- cmp (completations) + luasnip
- snacks
- plenary
- incline
- which-key

## Install

1. backup your current files (enable sudo if necessary)
```shell
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

2. clone my repo
```
git clone https://github.com/renatosanz/nvim ~/.config/nvim
```

3. remove the .git 
```
rm -rf ~/.config/nvim/.git
```

4. enter to nvim
```
nvim
```

## Keymaps
Some Keymaps I use are from LazyVim configuration, others from default libraries config.

| Description                   | `Command`               |
|-------------------------------|--------------------|
| exit insert mode              | `jk`               |
| open telescope                | `<leader><leader>` |
| open telescope (ripgrep)      | `<leader>ff`       |
| open telescope (buffers)      | `<leader>fb`       |
| open Mason                    | `<leader>m`        |
| open lazy                     | `<leader>l`        |
| save current file             | `<leader>ww`       |
| exit file/nvim                | `q`                |
| save file & exit              | `<leader>wq`       |
| search a word in current file | `<leader>ds`       |
| close current file            | `<leader>bd`       |
| toggle term                   | `<leader>fd`       |
| open ~/.config/nvim           | `<leader>n`        |

