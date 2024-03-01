{
  plugins.telescope = {
    enable = true;

    keymaps = {
      "<Leader>ff" = {
        action = "find_files";
        desc = "Find files";
      };
      "<Leader>fg" = {
        action = "live_grep";
        desc = "Grep in project";
      };
      "<Leader>fb" = {
        action = "buffers";
        desc = "Buffers";
      };
      "<Leader>fh" = {
        action = "help_tags";
        desc = "Help tags";
      };
      "<Leader>s" = {
        action = "lsp_document_symbols";
        desc = "Symbols";
      };
      "<Leader>S" = {
        action = "lsp_dynamic_workspace_symbols";
        desc = "Workspace Symbols";
      };
      "<Leader>gr" = {
        action = "lsp_references";
        desc = "Goto references";
      };
    };

    extensions.ui-select.enable = true;
  };
}
