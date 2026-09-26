require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
      },
    },

    file_ignore_patterns = {
      "%.git/",
      "%.direnv/",
      "%.venv/",
      "__pycache__/",
      "target/",
      "build/",
      "%.gradle/",
      "zig-cache/",
      "zig-out/",
      "cmake-build-.*/",
    },
  },

  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

local builtin = require("telescope.builtin")
local keymap = vim.keymap.set

keymap("n", "<leader>ff", builtin.find_files, {
  desc = "Telescope Files",
})

keymap("n", "<leader>fg", builtin.live_grep, {
  desc = "Telescope Live Grep",
})

keymap("n", "<leader>fb", builtin.buffers, {
  desc = "Telescope Buffers",
})

keymap("n", "<leader>fh", builtin.help_tags, {
  desc = "Telescope Help Tags",
})

keymap("n", "<leader>fx", builtin.diagnostics, {
  desc = "Telescope Diagnostics",
})
