{
  plugins.mini = {
    enable = true;
    modules = {
      ai = {};

      basics = {};

      cursorword = {};

      move = {};

      surround = {};

      starter = {};

      pick = {};

      statusline = {};

      extra = {};
    };
  };

  keymaps = [
    # Find files
    {
      mode = "n";
      key = "<Leader>ff";
      action = "<Cmd>Pick files<CR>";
    }

    # Grep
    {
      mode = "n";
      key = "<Leader>fg";
      action = "<Cmd>Pick grep_live<CR>";
    }

    # Buffers
    {
      mode = "n";
      key = "<Leader>fb";
      action = "<Cmd>Pick buffers<CR>";
    }

    # Help
    {
      mode = "n";
      key = "<Leader>fh";
      action = "<Cmd>Pick help<CR>";
    }

    # Diagnostics
    {
      mode = "n";
      key = "<Leader>ld";
      action = "<Cmd>Pick diagnostic<CR>";
    }
  ];
}
