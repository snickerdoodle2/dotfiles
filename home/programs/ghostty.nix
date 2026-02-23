{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options = {
    terminal-font-size = mkOption {
      type = types.int;
      default = 13;
    };
  };
  config = {
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty;
      clearDefaultKeybinds = true;
      settings = {
        theme = "Catppuccin Mocha";
        background = "000000";
        font-size = config.terminal-font-size;
        font-family = "Berkeley Mono";
        font-style = "Medium";
        font-style-bold = "Bold";
        window-decoration = "none";
        command = "${config.programs.tmux.package}/bin/tmux new-session -A -s main";
        confirm-close-surface = false;
        keybind = [
          "ctrl+shift+c=copy_to_clipboard"
          "ctrl+shift+v=paste_from_clipboard"
          "ctrl+==increase_font_size:1"
          "ctrl+-=decrease_font_size:1"
          "ctrl+0=reset_font_size"
        ];
      };
    };
  };
}
