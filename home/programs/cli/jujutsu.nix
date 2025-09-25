{
  pkgs,
  config,
  ...
}: {
  programs.jujutsu = {
    enable = true;
    package = pkgs.jujutsu;
    settings = {
      user = {
        name = "Dominik Pilipczuk";
        email = "63516830+snickerdoodle2@users.noreply.github.com";
      };
      ui = {
        default-command = ["log" "--reversed"];
        merge-editor = "mergiraf";
        diff-formatter = ["${config.programs.git.difftastic.package}/bin/difft" "--color=always" "$left" "$right"];
      };
    };
  };
}
