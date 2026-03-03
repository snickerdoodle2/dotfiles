{
  pkgs,
  lib,
  ...
}: {
  programs.nushell.extraConfig =
    # nu
    ''
      def renamer [] {
        get name | to text | ${lib.getExe' pkgs.pipe-rename "renamer"}
      }
    '';
}
