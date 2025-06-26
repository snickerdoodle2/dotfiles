{
  config,
  pkgs,
  ...
}: let
  themes = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "delta";
    rev = "313b3ac74c44c0f5264b974bf8bc0cec0e3382f9";
    sha256 = "0kpsgv3qhfjml1dqls04disggaixmy2cnfiliwqkrzxpgyf28m83";
  };
in {
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

    include.path = [
      "${themes}/catppuccin.gitconfig"
    ];

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
      features = "catppuccin-mocha";
    };
  };
}
# [interactive]
#     diffFilter = delta --color-only
#
# [include]
#     path = ~/.gitconfig.local

