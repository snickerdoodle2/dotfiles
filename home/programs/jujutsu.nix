{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}: let
  lock-files =
    [
      "Cargo.lock"
      "bun.lock"
      "flake.lock"
      "go.sum"
      "mix.lock"
      "package-lock.json"
      "uv.lock"
      "yarn.lock"
    ]
    |> lib.lists.map (x: "**/${x}")
    |> lib.strings.concatStringsSep " | ";
in {
  home.packages = [
    pkgs.mergiraf
  ];

  # TODO: more configuration
  # example: https://github.com/jj-vcs/jj/discussions/5812
  # TODO: use fileset-aliases once 0.39 drops
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
        tug = ["bookmark" "advance"];
        d = ["diff" "~lock"];
      };
      revsets = {
        log = "(trunk()..@):: | (trunk()..@)-";
        bookmark-advance-to = "closest_pushable(@)";
      };
      revset-aliases = {
        "closest_pushable(to)" = ''heads(::to & mutable() & ~description(exact:"") & (~empty() | merges()))'';
        "wip()" = ''description(glob:"wip:*")'';
        "private()" = ''description(glob:"private:*")'';
        "blacklist()" = ''wip() | private()'';
      };
      fileset-aliases = {
        lock = lock-files;
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
      git = {
        private-commits = "blacklist()";
      };
      remotes = {
        origin = {
          auto-track-bookmarks = "main|master";
          auto-track-created-bookmarks = "*";
        };
        upstream.auto-track-bookmarks = "main|master";
      };
    };
  };
}
