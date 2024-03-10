{lib, ...}: {
  keymaps = (
    map (
      k: {
        mode = "n";
        key = "<C-${k}>";
        action = "<C-w><C-${k}>";
      }
    ) ["h" "j" "k" "l"]
  );
}
