local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lsp.bash")(capabilities)
require("lsp.ccp")(capabilities)
require("lsp.docker")(capabilities)
require("lsp.go")(capabilities)
require("lsp.haskell")(capabilities)
require("lsp.lua")(capabilities)
require("lsp.nix")(capabilities)
require("lsp.odin")(capabilities)
require("lsp.python")(capabilities)
require("lsp.rust")(capabilities)
require("lsp.typst")(capabilities)
require("lsp.yaml")(capabilities)
require("lsp.zig")(capabilities)

vim.lsp.enable({
  "bashls",
  "clangd",
  "dockerls",
  "gopls",
  "hls",
  "lua_ls",
  "nixd",
  "ols",
  "pyright",
  "ruff",
  "rust_analyzer",
  "tinymist",
  "yamlls",
  "zls",
})
