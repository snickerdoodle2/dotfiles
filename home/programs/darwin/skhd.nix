{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options.skhd-keybinds = mkOption {
    type = types.listOf (types.submodule {
      options = {
        modifiers = mkOption {
          type = types.listOf (types.enum [
            "cmd"
            "ctrl"
            "alt"
            "shift"
            "fn"
            "lcmd"
            "rcmd"
            "lctrl"
            "rctrl"
            "lalt"
            "ralt"
            "lshift"
            "rshift"
            "hyper"
            "meh"
          ]);
        };
        key = mkOption {
          type = types.str;
          example = "brightness_up";
        };
        action = mkOption {
          type = types.str;
          example = "echo \"Hello, world!\"";
        };
      };
    });
  };
  config = {
    services.skhd = {
      enable = builtins.length config.skhd-keybinds > 0;
      package = pkgs.skhd;
      config = lib.concatStringsSep "\n" (map (keybind: let
        modifiers = lib.concatStringsSep " + " keybind.modifiers;
      in "${modifiers} - ${keybind.key} : ${keybind.action}")
      config.skhd-keybinds);
    };
  };
}
# wayland.windowManager.hyprland.settings.monitor =
#   map
#   (
#     m: let
#       resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
#       position = "${toString m.x}x${toString m.y}";
#     in "${m.name},${
#       if m.enabled
#       then "${resolution},${position},1"
#       else "disable"
#     }"
#   )
#   (config.monitors);

