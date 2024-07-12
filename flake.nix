{
  description = "My Nixvim configuration";

  inputs = {
    # TODO: Back to nixos-unstable
    nixpkgs.url = "github:NixOS/nixpkgs/fb2e1920b2f0d9970c83e26319f7a1285ecbf2fe";
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
