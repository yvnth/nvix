local M = {}

M.on_attach = function(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if not client then
    return
  end
  local bufnr = event.buf

  local function keymap(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, {
      noremap = true,
      silent = true,
      buffer = bufnr,
      desc = desc,
    })
  end

  keymap("<leader>gd", "<cmd>Lspsaga goto_definition<CR>", "Go to definition")
  keymap("<leader>gD", "<cmd>Lspsaga peek_definition<CR>", "Peek definition")
  keymap("<leader>gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", "Go to definition in vsplit")
  keymap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code action")
  keymap("<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename symbol")
  keymap("<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagnostics")
  keymap("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor diagnostics")
  keymap("<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous diagnostic")
  keymap("<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic")
  keymap("K", "<cmd>Lspsaga hover_doc<CR>", "Hover docs")

  keymap("<leader>fd", "<cmd>FzfLua lsp_finder<CR>", "LSP finder")
  keymap("<leader>fr", "<cmd>FzfLua lsp_references<CR>", "LSP references")
  keymap("<leader>ft", "<cmd>FzfLua lsp_typedefs<CR>", "LSP type definitions")
  keymap("<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", "LSP document symbols")
  keymap("<leader>fw", "<cmd>FzfLua lsp_workspace_symbols<CR>", "LSP workspace symbols")
  keymap("<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", "LSP implementations")

  if client:supports_method("textDocument/codeAction", bufnr) then
    keymap("<leader>oi", function()
      vim.lsp.buf.code_action({
        context = {
          only = { "source.organizeImports" },
          diagnostics = {},
        },
        apply = true,
        bufnr = bufnr,
      })
      vim.defer_fn(function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, 50)
    end, "Organize imports")
  end
end

return M
