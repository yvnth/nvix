local mc = require("multicursor-nvim")
mc.setup()

local set = vim.keymap.set

set({ "n", "x" }, "<leader>mk", function()
  mc.lineAddCursor(-1)
end, { desc = "Add cursor above" })

set({ "n", "x" }, "<leader>mj", function()
  mc.lineAddCursor(1)
end, { desc = "Add cursor below" })

set({ "n", "x" }, "<leader>mK", function()
  mc.lineSkipCursor(-1)
end, { desc = "Skip line above" })

set({ "n", "x" }, "<leader>mJ", function()
  mc.lineSkipCursor(1)
end, { desc = "Skip line below" })

set({ "n", "x" }, "<leader>mn", function()
  mc.matchAddCursor(1)
end, { desc = "Add cursor at next match" })

set({ "n", "x" }, "<leader>ms", function()
  mc.matchSkipCursor(1)
end, { desc = "Skip next match" })

set({ "n", "x" }, "<leader>mN", function()
  mc.matchAddCursor(-1)
end, { desc = "Add cursor at previous match" })

set({ "n", "x" }, "<leader>mS", function()
  mc.matchSkipCursor(-1)
end, { desc = "Skip previous match" })

set({ "n", "x" }, "<leader>mA", mc.matchAllAddCursors, { desc = "Add cursors at all matches" })

set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add/remove cursor with mouse" })
set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Mouse drag cursors" })
set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Mouse release cursors" })

set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle cursor" })
set("n", "<leader>mg", mc.restoreCursors, { desc = "Restore cursors" })
set("n", "<leader>ma", mc.alignCursors, { desc = "Align cursors" })
set("x", "S", mc.splitCursors, { desc = "Split selection into cursors" })
set("x", "M", mc.matchCursors, { desc = "Match cursors in selection" })
set("x", "I", mc.insertVisual, { desc = "Insert at start of each line" })
set("x", "A", mc.appendVisual, { desc = "Append at end of each line" })
set({ "n", "x" }, "g<c-a>", mc.sequenceIncrement, { desc = "Increment sequence" })
set({ "n", "x" }, "g<c-x>", mc.sequenceDecrement, { desc = "Decrement sequence" })

mc.addKeymapLayer(function(layerSet)
  layerSet({ "n", "x" }, "<left>", mc.prevCursor, { desc = "Previous cursor" })
  layerSet({ "n", "x" }, "<right>", mc.nextCursor, { desc = "Next cursor" })
  layerSet({ "n", "x" }, "<leader>mx", mc.deleteCursor, { desc = "Delete main cursor" })
  layerSet("n", "<esc>", function()
    if not mc.cursorsEnabled() then
      mc.enableCursors()
    else
      mc.clearCursors()
    end
  end, { desc = "Enable/clear cursors" })
end)

local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { reverse = true })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
