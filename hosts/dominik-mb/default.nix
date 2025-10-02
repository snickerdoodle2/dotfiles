{...}: {
  homebrew.masApps = {
    "Affinity Photo" = 1616822987;
  };
  homebrew.casks = [
    "microsoft-teams"
  ];
  home-manager.users.domi.imports = [./home.nix];
}
