{
  imports = [
    ./files.nix
    ./ide
    ./keymaps.nix
    ./mini.nix
    ./neovide.nix
    ./settings.nix
  ];

  globals.mapleader = " ";

  colorschemes.ayu.enable = true;

  plugins = {
    which-key.enable = true;

    undotree.enable = true;

    lastplace.enable = true;
  };
}
