return function(capabilities)
  vim.filetype.add({
    extension = {
      tf = "terraform",
      tfvars = "terraform-vars",
    },
  })

  vim.lsp.config("terraformls", {
    capabilities = capabilities,
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "terraform-vars" },
    root_markers = { ".terraform", ".git" },
  })

  vim.lsp.config("tflint", {
    capabilities = capabilities,
    cmd = { "tflint", "--langserver" },
    filetypes = { "terraform" },
    root_markers = { ".tflint.hcl", ".terraform", ".git" },
  })
end
