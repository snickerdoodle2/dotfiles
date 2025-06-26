{
  config,
  pkgs,
  ...
}: {
  programs.gh = {
    enable = true;
    package = pkgs.gh;
    extensions = [
      pkgs.gh-dash
      pkgs.gh-poi
    ];
    settings = {
      git_protocol = "ssh";
      color_labels = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
}
