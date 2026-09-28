My Neovim configuration as a Nix flake, built with [mnw](https://github.com/Gerg-L/mnw) and lazy-loaded with [lz.n](https://github.com/lumen-oss/lz.n)

## Try

```bash
nix run github:yvnth/nvix
```

## Add to your flake

```nix
{
  inputs = {
    nvix = {
      url = "github:yvnth/nvix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

### System-wide

```nix
{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.nvix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
```

### Per-user (home-manager)

```nix
{
  home-manager.users.<name>.imports = [
    inputs.nvix.homeModules.default
  ];
}
```

## Dev mode (hot reload after config changes)

```bash
nix run .#dev
```
