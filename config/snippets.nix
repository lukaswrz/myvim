{pkgs, ...}: {
  plugins.luasnip = {
    enable = true;
    fromVscode = [{paths = builtins.toPath pkgs.vimPlugins.friendly-snippets;}];
  };
}
