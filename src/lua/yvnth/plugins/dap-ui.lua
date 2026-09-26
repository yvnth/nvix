local dap, dapui = require("dap"), require("dapui")

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

dapui.setup()

local map = vim.keymap.set

map("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
map("n", "<leader>do", dap.step_over, { desc = "DAP step over" })
map("n", "<leader>di", dap.step_into, { desc = "DAP step into" })
map("n", "<leader>dO", dap.step_out, { desc = "DAP step out" })
map("n", "<leader>dx", dap.terminate, { desc = "DAP stop" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Condition: "))
end, { desc = "Conditional breakpoint" })
map("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
