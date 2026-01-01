{
  pkgs,
  pkgs-unstable,
  ...
}: let
  jj = pkgs-unstable.jujutsu;
  jjWrapped =
    pkgs.runCommand "jj-wrapped" {
      buildInputs = [pkgs.makeWrapper];
    } ''
      mkdir -p $out/bin
      makeWrapper ${jj}/bin/jj $out/bin/jj \
        --prefix PATH : ${pkgs.mergiraf}/bin

        for bin in ${jj}/bin/*; do
          if [ "$(basename $bin)" != "jj" ]; then
            ln -s $bin $out/bin/$(basename $bin)
          fi
        done
    '';
in {
  # TODO: more configuration, commit signing
  # example: https://github.com/jj-vcs/jj/discussions/5812
  programs.jujutsu = {
    enable = true;
    package = jjWrapped;
    settings = {
      user = {
        name = "Dominik Pilipczuk";
        email = "63516830+snickerdoodle2@users.noreply.github.com";
      };
      ui = {
        default-command = ["log" "--reversed"];
        merge-editor = "mergiraf";
        diff-formatter = ["${pkgs.difftastic}/bin/difft" "--color=always" "$left" "$right"];
      };
    };
  };
}
