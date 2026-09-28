This is the plugin root that mnw wraps. Both `pure` and `impure` in `nvix.nix` point here, which is what makes `require("yvnth.config")` resolve.

- `lua/yvnth/`: the actual Neovim Lua config (settings, LSP configs, plugin configs), namespaced under `yvnth` to avoid clashing with plugin module names
- `pkgs/`: Nix derivations for Neovim plugins not available in [nixpkgs](https://github.com/nixos/nixpkgs) or my own fork/version, pulled into `nvix.nix` via `callPackage`
