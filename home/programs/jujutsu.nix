{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = [
    pkgs.mergiraf
  ];

  # TODO: more configuration, commit signing
  # example: https://github.com/jj-vcs/jj/discussions/5812
  programs.jujutsu = {
    enable = true;
    package = pkgs-unstable.jujutsu;
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
