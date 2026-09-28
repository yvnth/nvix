local harpoon = require("harpoon")
harpoon:setup()

local keymap = vim.keymap.set

keymap("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon add file" })

keymap("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon quick menu" })

keymap("n", "<C-p>", function()
  harpoon:list():prev()
end, { desc = "Harpoon prev" })

keymap("n", "<C-n>", function()
  harpoon:list():next()
end, { desc = "Harpoon next" })

keymap("n", "<leader>fl", function()
  local fzf = require("fzf-lua")
  local file_paths = {}
  for _, item in ipairs(harpoon:list().items) do
    table.insert(file_paths, item.value)
  end
  fzf.fzf_exec(file_paths, {
    prompt = "Marked files> ",
    previewer = "builtin",
    actions = fzf.defaults.actions.files,
  })
end, { desc = "Harpoon fzf list" })
