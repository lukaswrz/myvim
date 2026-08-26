{
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  callPackage,
  lib,
}:
let
  name = "myvim";

  languageServers = callPackage ./lsp.nix { };
  debugAdapters = callPackage ./dap.nix { };
  tools = callPackage ./tools.nix { };
  startPlugins = callPackage ./plugins.nix { };

  foldPlugins = builtins.foldl' (
    acc: next:
    acc
    ++ [
      next
    ]
    ++ (foldPlugins (next.dependencies or [ ]))
  ) [ ];

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

  packpath = runCommandLocal "packpath" { } ''
    mkdir -p $out/pack/${name}/{start,opt}

    ${lib.concatMapStringsSep "\n" (
      plugin: "ln -vsfT ${plugin} $out/pack/${name}/start/${lib.getName plugin}"
    ) startPluginsWithDeps}
  '';
in
symlinkJoin {
  pname = name;
  inherit (neovim-unwrapped) version;

  paths = [ neovim-unwrapped ];

  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/nvim \
      --add-flag --cmd \
      --add-flag 'set packpath^=${packpath}' \
      --suffix PATH : ${lib.makeBinPath (languageServers ++ debugAdapters ++ tools)} \
      --add-flag -u \
      --add-flag ${./init.lua} \
      --set-default NVIM_APPNAME ${name}
  '';

  passthru = { inherit packpath; };

  meta = {
    inherit (neovim-unwrapped.meta)
      description
      homepage
      changelog
      license
      mainProgram
      maintainers
      ;
  };
}
