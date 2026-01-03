{
  config,
  pkgs,
  pkgs-unstable,
  lib,
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
        show-cryptographic-signatures = true;
      };
      signing = {
        behavior = "own";
        backend = "ssh";
        key = config.ssh-key;
        backends.ssh.program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      template-aliases = {
        "format_short_signature(signature)" = "signature.name()";
        "format_short_cryptographic_signature(sig)" = ''
          if(sig,
            "signed",
            "not signed",
          )
        '';
      };
    };
  };
}
