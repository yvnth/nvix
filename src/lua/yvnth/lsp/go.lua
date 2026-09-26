return function(capabilities)
  vim.lsp.config("gopls", {
    capabilities = capabilities,
    filetypes = { "go" },
  })

  local dap = require("dap")

  dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
      command = "dlv",
      args = { "dap", "-l", "127.0.0.1:${port}" },
    },
  }

  dap.configurations.go = {
    {
      type = "delve",
      name = "Debug file",
      request = "launch",
      program = "${file}",
    },
    {
      type = "delve",
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "${file}",
    },
  }
end
