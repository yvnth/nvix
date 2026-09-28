return function(capabilities)
  vim.lsp.config("pyright", {
    capabilities = capabilities,
    settings = {
      pyright = {
        disableOrganizeImports = false,
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          autoImportCompletions = true,
        },
      },
    },
  })

  vim.lsp.config("ruff", {
    capabilities = capabilities,
    filetypes = { "python" },
  })

  local dap = require("dap")

  dap.adapters.python = {
    type = "executable",
    command = "python3",
    args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
    },
  }
end
