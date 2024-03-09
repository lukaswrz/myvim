{
  lib,
  pkgs,
  ...
}: {
  plugins.oil = {
    enable = true;
    defaultFileExplorer = true;
    deleteToTrash = true;
    trashCommand = lib.getExe' pkgs.trash-cli "trash-put";
  };
}
