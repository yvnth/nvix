local fzf = require("fzf-lua")

fzf.setup({
  file_ignore_patterns = {
    "%.git/",
    "%.direnv/",
    "%.venv/",
    "__pycache__/",
    "target/",
    "build/",
    "%.gradle/",
    "zig%-cache/",
    "zig%-out/",
    "cmake%-build%-.*/",
  },

  files = {
    hidden = true,
  },

  buffers = {
    ignore_current_buffer = false,
  },
})

local keymap = vim.keymap.set

keymap("n", "<leader>ff", fzf.files, { desc = "FZF Files" })
keymap("n", "<leader>fc", function()
  fzf.files({ cwd = vim.fn.expand("~/dotfiles") })
end, { desc = "FZF my dotfiles" })
keymap("n", "<leader>fg", fzf.live_grep, { desc = "FZF Live Grep" })
keymap("n", "<leader>fb", fzf.buffers, { desc = "FZF Buffers" })
keymap("n", "<leader>fB", fzf.builtin, { desc = "FZF Builtin Commands" })
keymap("n", "<leader>fh", fzf.help_tags, { desc = "FZF Help Tags" })
keymap("n", "<leader>fx", fzf.diagnostics_document, { desc = "FZF Diagnostics Document" })
keymap("n", "<leader>fX", fzf.diagnostics_workspace, { desc = "FZF Diagnostics Workspace" })
keymap("n", "<leader>fR", fzf.resume, { desc = "FZF Resume" })
