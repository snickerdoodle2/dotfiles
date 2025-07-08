{
  pkgs,
  lib,
  ...
}: let
  package = pkgs.aerospace;
in {
  programs.aerospace = {
    enable = true;
    package = package;
    userSettings = {
      start-at-login = true;
      gaps = {
        inner = {
          horizontal = 8;
          vertical = 8;
        };
        outer = {
          top = 8;
          left = 8;
          right = 8;
          bottom = 8;
        };
      };
    };
  };

  skhd-keybinds = builtins.concatMap (i: let
    key = toString (lib.mod i 10);
  in [
    {
      inherit key;
      modifiers = ["lalt"];
      action = "${package}/bin/aerospace workspace ${toString i}";
    }
    {
      inherit key;
      modifiers = ["lalt" "lshift"];
      action = "${package}/bin/aerospace move-node-to-workspace ${toString i}";
    }
  ]) (lib.range 1 10);
}
