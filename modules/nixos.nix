{
  config,
  lib,
  pkgs,
  hostname,
  ...
}: {
  imports = [
    ./nix.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  time.timeZone = lib.mkDefault "Europe/Warsaw";
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.domi = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
