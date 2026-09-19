require("fzf-lua").setup({
  buffers = {
    ignore_current_buffer = true,
  },
})

local keymap = vim.keymap.set

keymap("n", "<leader>ff", function()
  require("fzf-lua").files()
end, { desc = "FZF Files" })

keymap("n", "<leader>fg", function()
  require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })

keymap("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })

keymap("n", "<leader>fh", function()
  require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })

keymap("n", "<leader>fx", function()
  require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })

keymap("n", "<leader>fX", function()
  require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })
