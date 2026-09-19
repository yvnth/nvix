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
    fzf
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
      flash-nvim
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
      fzf-lua
      friendly-snippets
      gitsigns-nvim
      lspsaga-nvim
      lspkind-nvim
      lz-n
      mini-nvim
      multicursor-nvim
      nvim-cmp
      nvim-dap
      nvim-dap-ui
      nvim-hlslens
      nvim-lspconfig
      nvim-nio
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      plenary-nvim
      tiny-cmdline-nvim
      vim-tmux-navigator
      yazi-nvim
    ];

    startAttrs = { };
  };
}
