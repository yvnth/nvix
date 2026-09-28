local palette = require("catppuccin.palettes").get_palette("frappe")
local theme = require("catppuccin.utils.lualine")("frappe")

theme.normal.a.bg = palette.pink
theme.normal.a.fg = palette.base

local pink = { fg = palette.pink }

local mode_labels = {
  ["NORMAL"] = "N",
  ["O-PENDING"] = "O",
  ["INSERT"] = "I",
  ["VISUAL"] = "V",
  ["V-LINE"] = "V-L",
  ["V-BLOCK"] = "V-B",
  ["SELECT"] = "S",
  ["S-LINE"] = "S-L",
  ["S-BLOCK"] = "S-B",
  ["REPLACE"] = "R",
  ["V-REPLACE"] = "V-R",
  ["COMMAND"] = "C",
  ["EX"] = "E",
  ["TERMINAL"] = "T",
}

require("lualine").setup({
  options = {
    theme = theme,
    icons_enabled = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return mode_labels[str] or str:sub(1, 1)
        end,
      },
    },
    lualine_b = { { "branch", color = pink }, "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { { "filetype", color = pink } },
    lualine_y = { { "progress", color = pink } },
    lualine_z = { "location" },
  },
})
