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
  local conf = require("telescope.config").values
  local themes = require("telescope.themes")
  local file_paths = {}
  for _, item in ipairs(harpoon:list().items) do
    table.insert(file_paths, item.value)
  end
  require("telescope.pickers").new(themes.get_ivy({ prompt_title = "Working List" }), {
    finder = require("telescope.finders").new_table({ results = file_paths }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end, { desc = "Harpoon telescope list" })
