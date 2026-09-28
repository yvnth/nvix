require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true }),
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then
      return
    end
    if not vim.list_contains(require("nvim-treesitter.config").get_installed(), lang) then
      return
    end
    if pcall(vim.treesitter.language.add, lang) then
      vim.treesitter.start(args.buf)
    end
  end,
})
