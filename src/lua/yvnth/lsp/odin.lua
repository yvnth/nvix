return function(capabilities)
  vim.lsp.config("ols", {
    capabilities = capabilities,
    cmd = { "ols" },
    filetypes = { "odin" },
    root_markers = { "ols.json", "Makefile", ".git" },
  })

  local dap = require("dap")

  dap.adapters.lldb = {
    type = "executable",
    command = "lldb-dap",
    name = "lldb",
  }

  dap.configurations.odin = {
    {
      name = "Launch (lldb)",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end
