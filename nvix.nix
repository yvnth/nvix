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
    lazydocker
    lazygit
    lua
    lua-language-server
    nixd
    nixfmt
    nodejs
    shellcheck
    shfmt
    tinymist
    typst
    websocat
    yaml-language-server
    yamlfmt
    yazi
  ];

  initLua = ''
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    require("config")
  '';

  plugins = {
    dev.nvix = {
      impure = "/home/yvnth/repos/nvix";
      pure = ./.;
    };

    opt = [
      lazydocker-nvim
      lazygit-nvim
      lualine-nvim
      markdown-preview-nvim
      toggleterm-nvim
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
      fzf-lua
      friendly-snippets
      gitsigns-nvim
      lspsaga-nvim
      lspkind-nvim
      lz-n
      mini-nvim
      nvim-cmp
      nvim-dap
      nvim-dap-ui
      nvim-lspconfig
      nvim-nio
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      plenary-nvim
      vim-tmux-navigator
      yazi-nvim
    ];

    startAttrs = { };
  };
}
