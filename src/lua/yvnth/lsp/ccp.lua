-- file name is a not a typo, it's named because it's for both C and Cc/cpP files

return function(capabilities)
  vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
  })

  local dap = require("dap")

  dap.adapters.lldb = {
    type = "executable",
    command = "lldb-dap",
    name = "lldb",
  }

  local function launch()
    return {
      name = "Launch (lldb)",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    }
  end

  dap.configurations.c = { launch() }
  dap.configurations.cpp = { launch() }
end
