return function(capabilities)
  vim.lsp.config("zls", {
    capabilities = capabilities,
    cmd = { "zls" },
    filetypes = { "zig" },
    root_markers = { "build.zig", ".git" },
  })
end
