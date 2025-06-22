{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.git;

    userName = "Dominik Pilipczuk";
    userEmail = "63516830+snickerdoodle2@users.noreply.github.com";

    ignores = [
      ".DS_Store"
    ];
  };

  programs.git.extraConfig = {
    core = {
      compression = 9;
      preloadindex = true;
      whitespace = "error";
      pager = "${pkgs.delta}/bin/delta";
    };

    url."git@github.com:snickerdoodle2/".insteadOf = "me:";
    url."git@github.com:".insteadOf = "gh:";

    init.defaultBranch = "main";

    interactive.diffFilter = "${pkgs.delta}/bin/delta --color-only";

    status = {
      branch = true;
      showStash = true;
      showUntrackedFiles = "all";
      short = true;
    };

    push = {
      autoSetupRemote = true;
      default = "current";
      followTags = true;
    };

    pull = {
      default = "current";
      rebase = true;
    };

    rebase = {
      autoStash = true;
      missingCommitsCheck = "warn";
    };

    merge = {
      conflictstyle = "zdiff3";
    };

    log.abbrevCommit = true;
  };

  programs.git.delta = {
    enable = true;
    package = pkgs.delta;
    options = {
      navigate = true;
      "side-by-side" = true;
      hyperlinks = true;
    };
  };
}
# [interactive]
#     diffFilter = delta --color-only
#
# [include]
#     path = ~/.gitconfig.local

