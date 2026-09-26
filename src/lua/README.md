This directory holds my Neovim Lua configuration, loaded via `require("yvnth.config")`.

Namespaced under `yvnth` to avoid module name collisions with plugin internals.

## Structure

- `config/` - core Neovim settings and general setup
- `lsp/` - language server configs, one file per language
- `plugins/` - plugin configuration, one file per plugin. Most plugins load immediately at startup; a few are lazy-loaded on a command, filetype, or keypress using [lz.n](https://github.com/lumen-oss/lz.n), configured in `plugins/lazy.lua`

## Adding something new

- New language server: add a file to `lsp/`, require it in `lsp/init.lua`, add its name to `vim.lsp.enable({...})`
- New plugin: add a file to `plugins/`, require it in `plugins/init.lua` (or add a lazy-load entry in `plugins/lazy.lua`), and list its package in `nvix.nix`
