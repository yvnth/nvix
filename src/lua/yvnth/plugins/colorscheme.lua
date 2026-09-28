require("catppuccin").setup({
  flavour = "frappe",
  transparent_background = false,
  integrations = {
    lualine = {},
  },
  custom_highlights = function(colors)
    local accent = colors.pink
    return {
      FloatBorder = { fg = accent },
      CursorLineNr = { fg = accent, bold = true },
      TinyCmdlineBorder = { fg = accent },
      TinyCmdlineTitle = { fg = accent },
      Search = { bg = accent, fg = colors.base },
      IncSearch = { bg = accent, fg = colors.base },
    }
  end,
})
vim.cmd.colorscheme("catppuccin-frappe")
