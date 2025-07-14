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
      "docker"
    ];
    masApps = {
      "Hidden Bar" = 1452453066;
    };
  };
}
