require("which-key").setup({})

-- manual descriptions: which-key doesn't show descriptions of lazy loaded
-- plugins unless used at least once and clears again after closing nvim.
-- so I had to add manual descriptions...
require("which-key").add({
  -- lazygit
  { "<leader>lg", desc = "LazyGit" },

  -- trouble
  { "<leader>xx", desc = "Workspace Diagnostics (Trouble)" },
  { "<leader>xX", desc = "Buffer Diagnostics (Trouble)" },
  { "<leader>cs", desc = "Symbols (Trouble)" },
  { "<leader>cl", desc = "LSP Definitions / references / ... (Trouble)" },
  { "<leader>xL", desc = "Location List (Trouble)" },
  { "<leader>xQ", desc = "Quickfix List (Trouble)" },
})

-- manual keymap: which-key itself is lazy loaded
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
