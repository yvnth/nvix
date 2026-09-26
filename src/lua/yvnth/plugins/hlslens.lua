require("hlslens").setup()

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

vim.keymap.set("n", "n", function()
  vim.cmd("normal! " .. vim.v.count1 .. "nzzzv")
  require("hlslens").start()
end, opts("Next search result (centered)"))

vim.keymap.set("n", "N", function()
  vim.cmd("normal! " .. vim.v.count1 .. "Nzzzv")
  require("hlslens").start()
end, opts("Previous search result (centered)"))

vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts("Search word forward"))
vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts("Search word backward"))
vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts("Search partial word forward"))
vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts("Search partial word backward"))

-- clear search highlight once the cursor leaves a match
vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function()
        vim.cmd.nohlsearch()
      end)
    end
  end,
})
