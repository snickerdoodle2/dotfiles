{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker;
    storageDriver = "btrfs";
  };
  users.extraGroups.docker.members = ["domi"];
}
