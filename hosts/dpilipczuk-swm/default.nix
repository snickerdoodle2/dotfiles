{...}: {
  home-manager.users.domi.imports = [
    ./home.nix
  ];
  layout = "iso";
}
