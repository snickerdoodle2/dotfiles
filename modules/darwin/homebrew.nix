{...}: {
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };
    casks = [
      "zen"
      "raycast"
      "1password"
    ];
  };
}
