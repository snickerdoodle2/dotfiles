{...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  programs.zsh.enable = true;
  environment.variables = {
    EDITOR = "nvim";
  };
}
