require("lz.n").load({
  {
    "lazydocker.nvim",
    keys = { "<leader>ld" },
    after = function()
      require("plugins.lazydocker")
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
