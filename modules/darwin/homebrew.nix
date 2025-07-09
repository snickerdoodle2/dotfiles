{...}: {
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "uninstall";
    };
    casks = [
      "zen"
      "raycast"
      "1password"
    ];
    masApps = {
      "Hidden Bar" = 1452453066;
    };
  };
}
