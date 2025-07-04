{
  pkgs,
  lib,
  ...
}: let
  onePassPath = "~/.1password/agent.sock";
  inherit (lib) mkIf;
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in {
  home.packages = mkIf (!isDarwin) [
    pkgs._1password-gui
  ];
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ${onePassPath}
    '';
  };

  programs.git.extraConfig = {
    gpg.format = "ssh";
    "gpg \"ssh\"".program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
    commit.gpgsign = true;
    user.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN+yQBBLAqIPgDYfcIrXhgwfdE+XW4nqQCM/+ussS+dJ";
  };
}
