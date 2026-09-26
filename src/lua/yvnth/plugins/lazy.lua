require("lz.n").load({
  {
    "lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    keys = { "<leader>lg" },
    after = function()
      require("yvnth.plugins.lazygit")
    end,
  },
  {
    "lualine.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("yvnth.plugins.lualine")
    end,
  },
  {
    "markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    before = function()
      require("yvnth.plugins.markdown-preview")
    end,
  },
  {
    "trouble.nvim",
    cmd = "Trouble",
    keys = { "<leader>xx", "<leader>xX", "<leader>cs", "<leader>cl", "<leader>xL", "<leader>xQ" },
    after = function()
      require("yvnth.plugins.trouble")
    end,
  },
  {
    "typst-preview.nvim",
    ft = "typst",
    after = function()
      require("yvnth.plugins.typst-preview")
    end,
  },
  {
    "which-key.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("yvnth.plugins.which-key")
    end,
  },
})
