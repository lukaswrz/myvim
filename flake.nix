{
  description = "My Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    nixpkgs,
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
        };
        package = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

        packages.default = package;

        formatter = pkgs.alejandra;
      };
    };
}
