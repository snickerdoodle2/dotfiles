{
  config,
  pkgs,
  ...
}: {
  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = {
      git = {
        paging = {
          colorArg = "always";
          pager = "${pkgs.delta}/bin/delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\"";
        };
        branchLogCmd = "${pkgs.git}/bin/git log --color=always --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n' {{branchName}}";
      };

      gui = {
        filterMode = "fuzzy";
        sidePanelWidth = 0.2;
        expandedSidePanelWeight = 2;
        expandFocusedSidePanel = true;

        timeFormat = "02-01-2006 15:04";
        shortTimeFormat = "15:04";

        commitLength.show = false;
        showRootItemInFileTree = false;
        showCommandLog = false;
        nerdFontsVersion = 3;
        commitHashLength = 0;
        border = "single";
        statusPanelView = "allBranchesLog";

        spinner = {
          rate = 100;
          frames = [
            "⣾"
            "⢿"
            "⡿"
            "⣷"
            "⣯"
            "⢟"
            "⡻"
            "⣽"
          ];
        };
      };

      promptToReturnFromSubprocess = false;
      disableStartupPopups = false;
    };
  };
}
