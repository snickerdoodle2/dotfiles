{
  config,
  pkgs,
  inputs,
  ...
}: let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
  themes = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "nushell";
    rev = "05987d258cb765a881ee1f2f2b65276c8b379658";
    sha256 = "13a2am30w1v8lz7drc04z3762jrywdqflfbn446iab6slfpw23dm";
  };

  catppuccin-mocha = builtins.toFile "catppuccin_mocha.nu" (builtins.readFile "${themes}/themes/catppuccin_mocha.nu" + "\n$env.colors = $theme");
in {
  imports = [
    ./atuin.nix
    ./direnv.nix
    ./nushell.nix
  ];

  programs.nushell = {
    enable = true;
    package = pkgs-unstable.nushell;
    plugins = [
      pkgs-unstable.nushellPlugins.gstat
    ];
    extraEnv = ''
      $env.LS_COLORS = (${pkgs.vivid}/bin/vivid generate catppuccin-mocha)
    '';
    extraConfig = ''
      source ${catppuccin-mocha}
      source ${./prompt.nu}
    '';
  };

  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
  };

  programs.carapace = {
    enable = true;
    package = pkgs-unstable.carapace;
  };
}
