{
  pkgs,
  inputs,
  lib,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  op-ssh-sign =
    if isDarwin
    then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
    else lib.getExe' pkgs._1password-gui "op-ssh-sign";

  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in {
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
        default-command = ["status"];
        merge-editor = "mergiraf";
        diff-formatter = ["${pkgs.difftastic}/bin/difft" "--color=always" "$left" "$right"];
        show-cryptographic-signatures = true;
      };
      aliases = {
        tug = ["bookmark" "move" "--from" "heads(::@ & bookmarks())" "--to" "closest_pushable(@)"];
      };
      revsets = {
        log = "(trunk()..@):: | (trunk()..@)-";
      };
      revset-aliases = {
        "closest_pushable(to)" = ''heads(::to & mutable() & ~description(exact:"") & (~empty() | merges()))'';
      };
      signing = {
        behavior = "own";
        backend = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN+yQBBLAqIPgDYfcIrXhgwfdE+XW4nqQCM/+ussS+dJ";
        backends.ssh.program = op-ssh-sign;
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
