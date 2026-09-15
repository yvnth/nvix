return function(capabilities)
  vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", ".git" },
    single_file_support = true,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = true,
        check = {
          command = "clippy",
        },
      },
    },
  })
end
