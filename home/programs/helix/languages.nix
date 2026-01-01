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
  ];
}
