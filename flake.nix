{
  description = "yvnth's Neovim configuration as a Nix flake";

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    mnw = {
      url = "github:Gerg-L/mnw";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      mnw,
      neovim-nightly-overlay,
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
          overlays = [ neovim-nightly-overlay.overlays.default ];
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
          home.packages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.default ];
        };
    };
}
