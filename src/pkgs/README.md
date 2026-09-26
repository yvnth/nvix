# Custom Plugin Derivations

This directory holds Nix derivations for plugins that are not available in [nixpkgs](https://github.com/nixos/nixpkgs) or my fork/version.

## Adding a custom plugin

Create a file `pkgs/pluginname.nix`:

```nix
{ pkgs }:
pkgs.vimUtils.buildVimPlugin {
  pname = "pluginname";
  version = "unstable";
  src = pkgs.fetchFromGitHub {
    owner = "author";
    repo = "pluginname";
    rev = "commit-hash-or-branch";
    hash = "sha256-AAAA...";
  };
}
```

Then pull it into `nvix.nix`:

```nix
let
  myPlugin = pkgs.callPackage ./src/pkgs/pluginname.nix { };
in
{
  plugins = {
    start = [
      myPlugin
    ];
  };
}
```

Use `start` if the plugin should load immediately, or `opt` if it should be lazy-loaded via [lz.n](https://github.com/lumen-oss/lz.n) (with a matching `cmd`/`ft`/`keys`/`event` entry in `lazy.lua`).

## Getting the hash

Run `nix run .#dev` (or build the flake). It will fail with a hash mismatch and print the correct hash to use. Paste that value into the `hash` field.

## When not to use this

If the plugin is already packaged in nixpkgs, use it directly instead of writing a custom derivation. Check first:

```bash
nix search nixpkgs vimPlugins.pluginname
```
