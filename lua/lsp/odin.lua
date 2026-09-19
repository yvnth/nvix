return function(capabilities)
  vim.lsp.config("ols", {
    capabilities = capabilities,
    cmd = { "ols" },
    filetypes = { "odin" },
    root_markers = { "ols.json", "Makefile", ".git" },
  })
end
