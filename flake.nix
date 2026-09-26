{
  description = "yvnth's Neovim configuration as a Nix flake";

  inputs = {
    mnw = {
      type = "github";
      owner = "gerg-l";
      repo = "mnw";
    };

    neovim-nightly = {
      type = "github";
      owner = "nix-community";
      repo = "neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };
  };

  outputs =
    {
      mnw,
      neovim-nightly,
      nixpkgs,
      self,
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      eachSystem = nixpkgs.lib.genAttrs systems;

      pkgsFor = eachSystem (
        system:
        import nixpkgs {
          inherit system;
          overlays = [
            neovim-nightly.overlays.default
          ];
        }
      );
    in
    {
      packages = eachSystem (system: {
        default = mnw.lib.wrap pkgsFor.${system} ./nvix.nix;

        dev = (mnw.lib.wrap pkgsFor.${system} ./nvix.nix).devMode;
      });

      homeModules.default =
        { pkgs, ... }:
        {
          home.packages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.default
          ];
        };
    };
}
