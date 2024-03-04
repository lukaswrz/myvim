{
  keymaps = [
    # Fast split switching
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
    }

    # Keep cursor position when joining lines
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
    }

    # Center the cursor when moving up or down the document
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
    }

    # Center the cursor when searching
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
    }

    # Paste without losing paste buffer
    {
      mode = "x";
      key = "<Leader>p";
      action = "\"_dP";
    }

    # Yank and delete to system clipboard
    {
      mode = "n";
      key = "<Leader>y";
      action = "\"+y";
    }
    {
      mode = "v";
      key = "<Leader>y";
      action = "\"+y";
    }
    {
      mode = "n";
      key = "<Leader>Y";
      action = "\"+Y";
    }
    {
      mode = "n";
      key = "<Leader>d";
      action = "\"_d";
    }
    {
      mode = "v";
      key = "<Leader>d";
      action = "\"_d";
    }
  ];
}
