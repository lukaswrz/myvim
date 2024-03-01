{
  plugins.lsp = {
    enable = true;
    servers = {
      bashls.enable = true;

      clangd.enable = true;

      cmake.enable = true;

      cssls.enable = true;

      dartls.enable = true;

      dockerls.enable = true;

      emmet_ls.enable = true;

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

      nil_ls.enable = true;

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
        "[d" = {
          action = "goto_prev";
          desc = "Go to prev diagnostic";
        };
        "]d" = {
          action = "goto_next";
          desc = "Go to next diagnostic";
        };
        "<Leader>e" = {
          action = "open_float";
          desc = "Show Line Diagnostics";
        };
      };

      lspBuf = {
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
        "gd" = {
          action = "definition";
          desc = "Goto definition (assignment)";
        };
        "gD" = {
          action = "declaration";
          desc = "Goto declaration (first occurrence)";
        };
        "gy" = {
          action = "type_definition";
          desc = "Goto Type Defition";
        };
        "gi" = {
          action = "implementation";
          desc = "Goto Implementation";
        };
        "<Leader>k" = {
          action = "hover";
          desc = "Hover";
        };
        "<Leader>ls" = {
          action = "signature_help";
          desc = "Signature Help";
        };
      };
    };
  };
}
