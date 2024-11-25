{
  imports = [
    ./files.nix
    ./mini.nix
    ./session.nix
  ];

  plugins = {
    which-key.enable = true;

    undotree.enable = true;

    web-devicons.enable = true;
  };
}
