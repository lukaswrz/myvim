{
  # Use system clipboard
  keymaps = (
    map (
      k: {
        mode = ["n" "v"];
        key = "<Leader>${k}";
        action = "\"+${k}";
      }
    ) ["y" "Y" "d" "D" "p" "P"]
  );
}
