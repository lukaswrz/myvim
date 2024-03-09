{
  keymaps = [
    {
      mode = "n";
      key = "<C-=>";
      action = ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-->";
      action = ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-+>";
      action = ":lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.05, 1.0)<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-_>";
      action = ":lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.05, 0.0)<CR>";
      options.silent = true;
    }
  ];
}
