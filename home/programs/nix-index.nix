{
  inputs,
  pkgs-unstable,
  ...
}: {
  imports = [
    inputs.nix-index-database.homeModules.default
  ];

  programs.nix-index-database.comma.enable = true;

  programs.nix-index = {
    enable = true;
    package = pkgs-unstable.nix-index;
  };
}
