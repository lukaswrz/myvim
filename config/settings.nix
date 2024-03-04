{
  config = {
    options = {
      number = true;
      relativenumber = true;

      scrolloff = 5;

      colorcolumn = "80";

      undofile = true;

      guifont = "monospace:h12";
    };

    globals = {
      mapleader = " ";

      netrw_banner = 0;
      netrw_liststyle = 3;

      neovide_transparency = 0.9;

      neovide_floating_blur_amount_x = 2.0;
      neovide_floating_blur_amount_y = 2.0;
      neovide_floating_shadow = true;
      neovide_floating_z_height = 10;
      neovide_light_angle_degrees = 45;
      neovide_light_radius = 5;

      neovide_scroll_animation_length = 0.1;
      neovide_scroll_animation_far_lines = 1;

      neovide_hide_mouse_when_typing = true;

      neovide_confirm_quit = true;

      neovide_remember_window_size = true;

      neovide_cursor_animation_length = 0.01;
      neovide_cursor_trail_size = 0.2;
      neovide_cursor_animate_in_insert_mode = true;
      neovide_cursor_animate_command_line = true;
      neovide_cursor_unfocused_outline_width = 0.125;
      neovide_cursor_vfx_mode = "wireframe";
      neovide_cursor_vfx_opacity = 50.0;
    };
  };

  config.extraConfigLua = ''
    if vim.g.neovide == true then
      vim.api.nvim_set_keymap("n", "<C-=>", "<Cmd>lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  1.0)<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-->", "<Cmd>lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-+>", "<Cmd>lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.05, 1.0)<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-_>", "<Cmd>lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.05, 0.0)<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-0>", "<Cmd>lua vim.g.neovide_scale_factor = 0.5<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<C-)>", "<Cmd>lua vim.g.neovide_transparency = 0.9<CR>", { silent = true })
    end
  '';
}
