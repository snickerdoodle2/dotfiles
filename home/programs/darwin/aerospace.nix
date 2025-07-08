{
  pkgs,
  lib,
  ...
}: let
  package = pkgs.aerospace;
  bin = "${package}/bin/aerospace";
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

  # https://github.com/nikitabobko/AeroSpace/issues/1012
  skhd-keybinds =
    builtins.concatLists (
      builtins.attrValues (
        builtins.mapAttrs (key: dir: [
          {
            modifiers = ["lalt"];
            inherit key;
            action = "${bin} focus ${dir}";
          }
          {
            modifiers = ["lalt" "lshift"];
            inherit key;
            action = "${bin} move ${dir}";
          }
        ])
        {
          h = "left";
          j = "down";
          k = "up";
          l = "right";
        }
      )
    )
    ++ builtins.concatMap (i: let
      key = toString (lib.mod i 10);
    in [
      {
        inherit key;
        modifiers = ["lalt"];
        action = "${bin} workspace ${toString i}";
      }
      {
        inherit key;
        modifiers = ["lalt" "lshift"];
        action = "${bin} move-node-to-workspace ${toString i}";
      }
    ]) (lib.range 1 10);
}
