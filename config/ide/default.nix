{
  imports = [
    ./cmp.nix
    ./lsp.nix
    ./snippets.nix
  ];

  plugins = {
    trouble.enable = true;

    comment.enable = true;

    treesitter.enable = true;

    direnv.enable = true;

    todo-comments.enable = true;

    gitsigns.enable = true;

    indent-o-matic.enable = true;

    nvim-autopairs.enable = true;
  };
}
