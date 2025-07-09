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
      accordion-padding = 64;
      key-mapping.preset = "qwerty";
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
      mode.window-managment.binding = {
        h = ["join-with left" "mode main"];
        j = ["join-with down" "mode main"];
        k = ["join-with up" "mode main"];
        l = ["join-with right" "mode main"];
      };
    };
  };

  # https://github.com/nikitabobko/AeroSpace/issues/1012
  skhd-keybinds =
    [
      {
        modifiers = ["lalt"];
        key = "f";
        action = "${bin} fullscreen";
      }
      {
        modifiers = ["lalt"];
        key = "q";
        action = "open -na Wezterm";
      }
      {
        modifiers = ["lalt" "lshift"];
        key = "w";
        action = "${bin} mode window-managment";
      }
    ]
    ++ builtins.concatLists (
      builtins.attrValues (
        builtins.mapAttrs (key: sign: [
          {
            inherit key;
            modifiers = ["lalt"];
            action = "${bin} resize smart ${sign}10";
          }
          {
            inherit key;
            modifiers = ["lalt" "lshift"];
            action = "${bin} resize smart ${sign}50";
          }
        ]) {
          "0x1B" = "-"; # -
          "0x18" = "+"; # =
        }
      )
    )
    ++ builtins.concatLists (
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
