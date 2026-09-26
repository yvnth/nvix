local palette = require("catppuccin.palettes").get_palette("frappe")
local theme = require("catppuccin.utils.lualine")("frappe")

theme.normal.a.bg = palette.pink
theme.normal.a.fg = palette.base

local pink = { fg = palette.pink }

require("lualine").setup({
  options = {
    theme = theme,
    icons_enabled = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "branch", color = pink }, "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { { "filetype", color = pink } },
    lualine_y = { { "progress", color = pink } },
    lualine_z = { "location" },
  },
})
