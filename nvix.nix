{ pkgs, ... }:
with pkgs;
with pkgs.vimPlugins;

{
  aliases = [
    "vi"
    "vim"
  ];

  extraBinPath = [
    bash-language-server
    dockerfile-language-server
    dockerfmt
    fd
    lazygit
    lua
    lua-language-server
    nixd
    nixfmt
    nodejs
    ripgrep
    shellcheck
    shfmt
    tinymist
    typst
    vscode-json-languageserver
    websocat
    yaml-language-server
    yamlfmt
    yazi
  ];

  initLua = ''
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    require("yvnth.config")
  '';

  plugins = {
    dev.nvix = {
      pure = ./src;
      impure = "/home/yvnth/repos/nvix/src";
    };

    opt = [
      lazygit-nvim
      lualine-nvim
      markdown-preview-nvim
      trouble-nvim
      typst-preview-nvim
      which-key-nvim
    ];

    start = [
      catppuccin-nvim
      ccc-nvim
      cmp-buffer
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      friendly-snippets
      gitsigns-nvim
      harpoon2
      lspsaga-nvim
      lspkind-nvim
      lz-n
      mini-nvim
      nvim-cmp
      nvim-dap
      nvim-dap-ui
      nvim-hlslens
      nvim-lspconfig
      nvim-nio
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      plenary-nvim
      render-markdown-nvim
      telescope-nvim
      undotree
      vim-tmux-navigator
      yazi-nvim
    ];

    startAttrs = { };
  };
}
