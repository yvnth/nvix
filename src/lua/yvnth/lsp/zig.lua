return function(capabilities)
  vim.lsp.config("zls", {
    capabilities = capabilities,
    cmd = { "zls" },
    filetypes = { "zig" },
    root_markers = { "build.zig", ".git" },
  })

  local dap = require("dap")

  dap.adapters.lldb = {
    type = "executable",
    command = "lldb-dap",
    name = "lldb",
  }

  dap.configurations.zig = {
    {
      name = "Launch (lldb)",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end
