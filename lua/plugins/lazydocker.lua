vim.cmd.packadd("toggleterm.nvim")

require("lazydocker").setup({
  border = "single",
  width = 0.9,
  height = 0.9,
})

vim.keymap.set("n", "<leader>ld", function()
  require("lazydocker").open()
end, { desc = "Open Lazydocker floating window" })
