return function(capabilities)
  vim.lsp.config("tinymist", {
    capabilities = capabilities,
    cmd = { "tinymist" },
    filetypes = { "typst" },
    root_markers = { "typst.toml", ".git" },
    single_file_support = true,
  })
end
