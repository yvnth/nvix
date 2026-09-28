require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    list = {
      selection = { preselect = false, auto_insert = false },
    },
    menu = {
      draw = {
        columns = {
          { "kind_icon" },
          { "label",    "label_description", gap = 1 },
          { "kind" },
        },
      },
    },
    documentation = { auto_show = true },
  },

  signature = { enabled = true },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
