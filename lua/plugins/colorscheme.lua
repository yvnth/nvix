require("catppuccin").setup({
  flavour = "frappe",
  transparent_background = true,
  integrations = {
    nvimtree = true,
    lualine = {},
  },
  custom_highlights = function(colors)
    local accent = colors.pink
    return {
      NvimTreeNormal = { bg = "none" },
      NvimTreeNormalNC = { bg = "none" },
      NvimTreeEndOfBuffer = { bg = "none" },
      NvimTreeWinSeparator = { bg = "none" },
      Normal = { bg = "none" },
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none", fg = accent },
      SignColumn = { bg = "none" },
      CursorLineNr = { fg = accent, bold = true },
      TinyCmdlineBorder = { fg = accent },
      TinyCmdlineTitle = { fg = accent },
      Search = { bg = accent, fg = colors.base },
      IncSearch = { bg = accent, fg = colors.base },
    }
  end,
})
vim.cmd.colorscheme("catppuccin-frappe")
