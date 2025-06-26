{
  config,
  lib,
  ...
}: let
  iconDirs = builtins.attrNames (lib.filterAttrs (_: v: v == "directory") (builtins.readDir ./.));

  icons = builtins.listToAttrs (map (name: {
      name = "${config.home.homeDirectory}/.local/share/icons/${name}";
      value = {
        source = ./. + "/${name}";
        recursive = true;
      };
    })
    iconDirs);
in {
  home.file = icons;
}
