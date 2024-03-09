{lib, ...}: {
  keymaps =
    # Keep cursor position when joining lines
    [
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
      }
    ]
    ++
    # Fast split movement
    (
      map (
        k: {
          mode = "n";
          key = "<C-${k}>";
          action = "<C-w><C-${k}>";
        }
      ) ["h" "j" "k" "l"]
    )
    ++
    # Fast tab movement
    (
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
    )
    ++
    # Use system clipboard
    (
      map (
        k: {
          mode = ["n" "v"];
          key = "<Leader>${k}";
          action = "\"+${k}";
        }
      ) ["y" "Y" "d" "D" "p" "P"]
    );
}
