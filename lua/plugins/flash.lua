require("flash").setup({})

vim.keymap.set({ "n", "x", "o" }, "gs", function()
  require("flash").jump()
end, { desc = "Flash jump" })

vim.keymap.set({ "n", "x", "o" }, "gS", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter" })

vim.keymap.set("o", "r", function()
  require("flash").remote()
end, { desc = "Flash remote" })
