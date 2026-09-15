require("catppuccin").setup({
  flavour = "frappe",
  transparent_background = true,
  integrations = {
    nvimtree = true,
    lualine = {},
  },
  custom_highlights = function(colors)
    return {
      NvimTreeNormal = { bg = "none" },
      NvimTreeNormalNC = { bg = "none" },
      NvimTreeEndOfBuffer = { bg = "none" },
      NvimTreeWinSeparator = { bg = "none" },
      Normal = { bg = "none" },
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      SignColumn = { bg = "none" },
    }
  end,
})
vim.cmd.colorscheme("catppuccin-frappe")
