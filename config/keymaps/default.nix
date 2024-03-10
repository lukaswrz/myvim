{
  imports = [
  ];

  keymaps = [
    # Keep cursor position when joining lines
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
    }

    # Remove search highlighting
    {
      mode = "n";
      key = "<Leader>/";
      action = "<Cmd>nohlsearch<CR>";
    }
  ];
}
