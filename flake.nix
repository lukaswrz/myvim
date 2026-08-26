{
  description = "myvim";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (nixpkgs) lib;

      systems = nixpkgs.lib.systems.flakeExposed;

      forAllSystems =
        f:
        lib.genAttrs systems (
          system:
          f {
            inherit system;
            pkgs = nixpkgs.legacyPackages.${system};
            selfPackages = self.packages.${system};
          }
        );
    in
    {
      devShells = forAllSystems (
        { pkgs, selfPackages, ... }:
        {
          default = pkgs.mkShell {
            packages = [
              selfPackages.default

              # Formatters
              pkgs.treefmt
              pkgs.nixfmt
              pkgs.prettier
              pkgs.taplo
              pkgs.stylua
            ];
          };
        }
      );

      formatter = forAllSystems ({ pkgs, ... }: pkgs.treefmt);

      packages = forAllSystems (
        { pkgs, ... }:
        {
          default = pkgs.callPackage ./package.nix { };
        }
      );
    };
}
