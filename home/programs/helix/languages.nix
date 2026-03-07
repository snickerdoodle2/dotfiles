# Upstream configs: https://github.com/helix-editor/helix/blob/master/languages.toml
{pkgs, ...}: {
  programs.helix.languages.language-server = {
    tinymist.config = {
      formatterMode = "typstyle";
    };
    rust-analyzer.config.check.command = "clippy";
  };

  programs.helix.languages.language = [
    {
      name = "nix";
      formatter = {
        command = "${pkgs.alejandra}/bin/alejandra";
        args = ["-"];
      };
      auto-format = true;
    }
    {
      name = "typst";
      auto-format = true;
      language-servers = ["tinymist" "harper-ls"];
    }
    {
      name = "markdown";
      language-servers = ["marksman" "markdown-oxide" "harper-ls"];
    }
    {
      name = "jjdescription";
      language-servers = ["harper-ls"];
    }
  ];
}
