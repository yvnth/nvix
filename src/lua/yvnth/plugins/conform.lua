require("conform").setup({
	formatters_by_ft = {
		nix = { "nixfmt" },
		sh = { "shfmt" },
		lua = { "stylua" },
		bash = { "shfmt" },
		zsh = { "shfmt" },
		python = { "ruff_organize_imports", "ruff_format" },
		yaml = { "yamlfmt" },
		dockerfile = { "dockerfmt" },
		terraform = { "terraform_fmt" },
		["terraform-vars"] = { "terraform_fmt" },
		haskell = { "ormolu" },
		rust = { "rustfmt" },
		go = { "gofmt" },
		zig = { "zigfmt" },
		odin = { "odinfmt" },
	},

	default_format_opts = {
		lsp_format = "fallback",
		timeout_ms = 2000,
	},
})
