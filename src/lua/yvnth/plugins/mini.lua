require("mini.ai").setup({})
require("mini.bufremove").setup({})
require("mini.comment").setup({})
require("mini.cursorword").setup({})
require("mini.indentscope").setup({})
require("mini.move").setup({})

require("mini.notify").setup({
  content = {
    format = function(notif)
      return notif.msg
    end,
  },
  window = {
    config = function()
      return {
        title = "",
        anchor = "SE",
        row = vim.o.lines - 2,
        col = vim.o.columns,
        border = "none",
      }
    end,
  },
})

vim.notify = require("mini.notify").make_notify()

require("mini.pairs").setup({})
require("mini.surround").setup({})
require("mini.trailspace").setup({})
