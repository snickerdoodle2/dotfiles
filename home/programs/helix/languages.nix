{pkgs, ...}: {
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
      name = "markdown";
      language-servers = ["marksman" "markdown-oxide" "harper-ls"];
    }
    {
      name = "jjdescription";
      language-servers = ["harper-ls"];
    }
  ];
}
