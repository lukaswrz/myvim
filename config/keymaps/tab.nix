{lib, ...}: {
  # Fast tab movement
  keymaps = (
    map (
      n: {
        mode = "n";
        key = "<A-${
          if n == 10
          then "0"
          else builtins.toString n
        }>";
        action = "${builtins.toString n}gt";
      }
    ) (lib.range 1 10)
  );
}
