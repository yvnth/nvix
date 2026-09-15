return function(capabilities)
  vim.lsp.config("hls", {
    capabilities = capabilities,
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { "haskell", "lhaskell" },
    root_markers = {
      "hie.yaml",
      "cabal.project",
      "stack.yaml",
      "*.cabal",
      "package.yaml",
      ".git",
    },
  })
end
