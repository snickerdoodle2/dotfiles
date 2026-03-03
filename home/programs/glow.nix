{pkgs, ...}: let
  themes = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "glamour";
    rev = "00c97fa3823d272d9d041d5d872ae6335555a776";
    hash = "sha256-SI/COnVFdKltMRqeqLTbR/Rh0xUJcWSqiX/YlR221eo=";
  };

  yaml = pkgs.formats.yaml {};
in {
  home.packages = [
    pkgs.glow
  ];

  xdg.configFile."glow/glow.yml".source = yaml.generate "glow.yml" {
    style = "${themes}/themes/catppuccin-mocha.json";
    pager = true;
  };
}
