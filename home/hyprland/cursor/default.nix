{
  config,
  pkgs,
  ...
}: let
  macosCursor = pkgs.fetchurl {
    url = "https://github.com/driedpampas/macOS-hyprcursor/releases/download/v1/macOS.Hyprcursor.SVG.tar.gz";
    sha256 = "xflMx4OmNAye6rZBaphUt7IZ46OX5GGGA/08M1v5BdE=";
  };
in {
  home.file.".local/share/icons/macOS" = {
    source = "${macosCursor}";
    recursive = true;
  };
  wayland.windowManager.hyprland.settings.env = [
    "HYPRCURSOR_THEME,MacOS"
    "HYPRCURSOR_SIZE,24"
  ];
}
