local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("yvnth.lsp.ccp")(capabilities)
require("yvnth.lsp.docker")(capabilities)
require("yvnth.lsp.go")(capabilities)
require("yvnth.lsp.json")(capabilities)
require("yvnth.lsp.lua")(capabilities)
require("yvnth.lsp.nix")(capabilities)
require("yvnth.lsp.odin")(capabilities)
require("yvnth.lsp.python")(capabilities)
require("yvnth.lsp.rust")(capabilities)
require("yvnth.lsp.shell")(capabilities)
require("yvnth.lsp.typst")(capabilities)
require("yvnth.lsp.yaml")(capabilities)
require("yvnth.lsp.zig")(capabilities)

vim.lsp.enable({
  "bashls",
  "clangd",
  "dockerls",
  "gopls",
  "jsonls",
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
