return function(capabilities)
  vim.lsp.config("hls", {
    capabilities = capabilities,
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { "haskell", "lhaskell", "cabal" },
    root_markers = { "hie.yaml", "stack.yaml", "cabal.project", "package.yaml", ".git" },
    settings = {
      haskell = {
        formattingProvider = "ormolu",
        checkProject = true,
        maxCompletions = 40,
      },
    },
  })
end
