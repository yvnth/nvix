require("lz.n").load({
  {
    "flash.nvim",
    keys = {
      { "gs", mode = { "n", "x", "o" }, desc = "Flash jump" },
      { "gS", mode = { "n", "x", "o" }, desc = "Flash treesitter" },
      { "r",  mode = "o",               desc = "Flash remote" },
    },
    after = function()
      require("plugins.flash")
    end,
  },
  {
    "lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    keys = { "<leader>lg" },
    after = function()
      require("plugins.lazygit")
    end,
  },
  {
    "lualine.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("plugins.lualine")
    end,
  },
  {
    "markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    before = function()
      require("plugins.markdown-preview")
    end,
  },
  {
    "trouble.nvim",
    cmd = "Trouble",
    keys = { "<leader>xx", "<leader>xX", "<leader>cs", "<leader>cl", "<leader>xL", "<leader>xQ" },
    after = function()
      require("plugins.trouble")
    end,
  },
  {
    "typst-preview.nvim",
    ft = "typst",
    after = function()
      require("plugins.typst-preview")
    end,
  },
  {
    "which-key.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("plugins.which-key")
    end,
  },
})
