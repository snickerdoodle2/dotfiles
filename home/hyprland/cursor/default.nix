{
  config,
  pkgs,
  ...
}: let
  macosCursor = pkgs.fetchFromGitHub {
    owner = "driedpampas";
    repo = "macOS-hyprcursor";
    rev = "94b831a2ac5acb9162862efb84102c2b88dc1fa2";
    sha256 = "1hxa0c27w3vg5wyrzjkxxjq3l7gsxqmc2r05mg8r0a01j36ac6ak";
  };
in {
  home.file.".local/share/icons/macOS" = {
    source = "${macosCursor}/src/macOS (SVG)";
    recursive = true;
  };
  wayland.windowManager.hyprland.settings.env = [
    "HYPRCURSOR_THEME,MacOS"
    "HYPRCURSOR_SIZE,24"
  ];
}
