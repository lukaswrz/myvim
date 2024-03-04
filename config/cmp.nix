{
  plugins.nvim-cmp = {
    enable = true;
    snippet.expand = "luasnip";
    autoEnableSources = true;
    sources = [
      {name = "nvim_lsp";}
      {name = "path";}
      {name = "buffer";}
      {name = "luasnip";}
    ];

    mapping = {
      "<C-d>" = "cmp.mapping.scroll_docs(-4)";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-e>" = "cmp.mapping.close()";
      "<CR>" = "cmp.mapping.confirm({ select = false })";
      "<Tab>" = {
        action = ''
          function(fallback)
            local check_backspace = function()
              local col = vim.fn.col(".") - 1
              return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
            end

            local luasnip = require "luasnip"

            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end
        '';
        modes = ["i" "s"];
      };
    };
    mappingPresets = ["insert"];
  };
}
