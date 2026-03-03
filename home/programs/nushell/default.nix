{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}: let
  themes = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "nushell";
    rev = "815dfc6ea61f2746ff27b54ef425cfeb7b51dda8";
    hash = "sha256-124T2pCmwirl8eLAy3h1fDOQZJf//3KJ7GwIP+u6YQ4=";
  };

  catppuccin-mocha = builtins.toFile "catppuccin_mocha.nu" (builtins.readFile "${themes}/themes/catppuccin_mocha.nu" + "\n$env.colors = $theme");

  inherit (lib) getExe';
in {
  programs.nushell = {
    enable = true;
    package = pkgs-unstable.nushell;
  };

  programs.nushell.settings = {
    show_banner = false;
    rm.always_trash = true;
    cursor_shape.emacs = "block";
    use_kitty_protocol = true;
    footer_mode = "auto";
    table = {
      mode = "single";
      index_mode = "auto";
      trim = {
        methodology = "truncating";
        truncating_suffix = "...";
      };
      missing_value_symbol = "✕";
    };
    keybindings = [
      {
        name = "foreground";
        modifier = "control";
        keycode = "char_z";
        mode = "emacs";
        event = [
          {edit = "Clear";}
          {
            edit = "InsertString";
            value = "job unfreeze";
          }
          {send = "Enter";}
        ];
      }
    ];
  };

  programs.nushell.environmentVariables = {
    EDITOR = getExe' config.programs.helix.package "hx";
  };

  programs.nushell.shellAliases = {
    cat = getExe' config.programs.bat.package "bat";
    la = "ls -a";
    tree = "${getExe' pkgs.lsd "lsd"} --tree";
  };

  programs.nushell.extraEnv =
    # nu
    ''
      $env.LS_COLORS = (${getExe' pkgs.vivid "vivid"} generate catppuccin-mocha)
    '';

  programs.nushell.extraConfig =
    # nu
    ''
      source ${catppuccin-mocha}
    '';

  programs.zoxide.enable = true;
  programs.carapace.enable = true;

  imports = [
    ./atuin.nix
    ./commands.nix
    ./direnv.nix
    ./prompt.nix
  ];
}
