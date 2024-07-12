{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;

        clangd.enable = true;

        cmake.enable = true;

        cssls.enable = true;

        dartls.enable = true;

        dockerls.enable = true;

        emmet-ls.enable = true;

        eslint.enable = true;

        gdscript.enable = true;

        gopls.enable = true;

        graphql.enable = true;

        html.enable = true;

        phpactor.enable = true;

        jsonls.enable = true;

        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        marksman.enable = true;

        nil-ls.enable = true;

        nushell.enable = true;

        pylsp.enable = true;

        pyright.enable = true;

        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = false;
        };

        svelte.enable = true;

        texlab.enable = true;

        tsserver.enable = true;

        yamlls.enable = true;

        zls.enable = true;
      };
      keymaps = {
        silent = true;
        diagnostic = {
          "<Leader>k" = {
            action = "goto_prev";
            desc = "Goto Prev Diagnostic";
          };
          "<Leader>j" = {
            action = "goto_next";
            desc = "Goto Next Diagnostic";
          };
          "<Leader>e" = {
            action = "open_float";
            desc = "Show Line Diagnostics";
          };
        };

        lspBuf = {
          "gd" = {
            action = "definition";
            desc = "Goto Definition (assignment)";
          };
          "gD" = {
            action = "declaration";
            desc = "Goto Declaration (first occurrence)";
          };
          "gy" = {
            action = "type_definition";
            desc = "Goto Type Defition";
          };
          "gi" = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          "gr" = {
            action = "references";
            desc = "Goto References";
          };
          "K" = {
            action = "hover";
            desc = "Hover";
          };
          "<Leader>ca" = {
            action = "code_action";
            desc = "Code Actions";
          };
          "<Leader>rn" = {
            action = "rename";
            desc = "Rename Symbol";
          };
          "<Leader>cf" = {
            action = "format";
            desc = "Format";
          };
          "<Leader>sh" = {
            action = "signature_help";
            desc = "Signature Help";
          };
          "<Leader>wa" = {
            action = "add_workspace_folder";
            desc = "Add Workspace Folder";
          };
          "<Leader>wr" = {
            action = "remove_workspace_folder";
            desc = "Remove Workspace Folder";
          };
        };
      };
    };

    lspkind.enable = true;
  };
}
