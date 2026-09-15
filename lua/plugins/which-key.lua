require("which-key").setup({})

require("which-key").add({
  { "<leader>lg", desc = "LazyGit" },
  { "<leader>ld", desc = "Lazydocker" },
})

vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
