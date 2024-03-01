{
  plugins.nvim-tree = {
    enable = true;
    disableNetrw = true;
    hijackNetrw = true;
    hijackCursor = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<Leader>ne";
      action = "<Cmd>NvimTreeToggle<CR>";
      options.desc = "Toggle file tree";
    }
    {
      mode = "n";
      key = "<Leader>nf";
      action = "<Cmd>NvimTreeFindFile<CR>";
      options.desc = "Show current file in tree";
    }
  ];
}
