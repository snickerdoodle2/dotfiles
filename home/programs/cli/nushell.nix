{
  config,
  pkgs,
  inputs,
  ...
}: let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in {
  programs.nushell = {
    enable = true;
    package = pkgs-unstable.nushell;
    plugins = [
      pkgs-unstable.nushellPlugins.gstat
    ];
  };
}
