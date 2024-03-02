{
  keymaps = [
    # Fast split switching
    {
      mode = "n";
      key = "<A-j>";
      action = "<C-W><C-J>";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<C-W><C-K>";
    }
    {
      mode = "n";
      key = "<A-l>";
      action = "<C-W><C-L>";
    }
    {
      mode = "n";
      key = "<A-h>";
      action = "<C-W><C-H>";
    }

    # Move text in visual mode
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
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

    # Remove ex keymap
    {
      mode = "n";
      key = "Q";
      action = "<Nop>";
    }

    # QuickFix
    {
      mode = "n";
      key = "<C-k>";
      action = "<Cmd>cnext<CR>zz";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<Cmd>cprev<CR>zz";
    }
    {
      mode = "n";
      key = "<Leader>k";
      action = "<Cmd>lnext<CR>zz";
    }
    {
      mode = "n";
      key = "<Leader>j";
      action = "<Cmd>lprev<CR>zz";
    }
  ];
}
