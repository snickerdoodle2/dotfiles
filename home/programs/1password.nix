{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv.hostPlatform) isDarwin;

  onePassPath =
    if isDarwin
    then "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\""
    else "~/.1password/agent.sock";

  op-ssh-sign =
    if isDarwin
    then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
    else lib.getExe' pkgs._1password-gui "op-ssh-sign";
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
    "gpg \"ssh\"".program = op-ssh-sign;
    commit.gpgsign = true;
    user.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN+yQBBLAqIPgDYfcIrXhgwfdE+XW4nqQCM/+ussS+dJ";
  };
}
