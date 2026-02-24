{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  inherit (lib) mkOption types;
in {
  options = {
    ghosttyFontSize = mkOption {
      type = types.int;
      default = 15;
    };
  };
  config = {
    programs.ghostty = {
      enable = true;
      package =
        if isDarwin
        then null
        else pkgs.ghostty;
      clearDefaultKeybinds = true;
      settings = {
        theme = "Catppuccin Mocha";
        background = "000000";
        font-family = "Berkeley Mono";
        font-style = "Medium";
        font-style-bold = "ExtraBold";
        font-size = config.ghosttyFontSize;
        window-padding-x = 8;
        window-padding-y = 4;
        command = "${pkgs.bash}/bin/bash -i -c \"${config.programs.zellij.package}/bin/zellij a -c main\"";
        confirm-close-surface = false;
        macos-option-as-alt = "left";
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
