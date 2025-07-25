# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4c587696-2d77-453e-8365-c707753ca80f";
    fsType = "btrfs";
    options = ["subvol=@" "compress=zstd"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/4c587696-2d77-453e-8365-c707753ca80f";
    fsType = "btrfs";
    options = ["subvol=@home" "compress=zstd"];
  };

  fileSystems."/opt" = {
    device = "/dev/disk/by-uuid/4c587696-2d77-453e-8365-c707753ca80f";
    fsType = "btrfs";
    options = ["subvol=@opt" "compress=zstd"];
  };

  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/4c587696-2d77-453e-8365-c707753ca80f";
    fsType = "btrfs";
    options = ["subvol=@var" "compress=zstd"];
  };

  fileSystems."/.snapshots" = {
    device = "/dev/disk/by-uuid/4c587696-2d77-453e-8365-c707753ca80f";
    fsType = "btrfs";
    options = ["subvol=@snapshots" "compress=zstd"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/4c587696-2d77-453e-8365-c707753ca80f";
    fsType = "btrfs";
    options = ["subvol=@nix" "compress=zstd" "noatime"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/B0D6-341D";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/.swap" = {
    device = "/dev/disk/by-uuid/4c587696-2d77-453e-8365-c707753ca80f";
    fsType = "btrfs";
    options = ["subvol=@swap" "noatime"];
  };

  swapDevices = [
    {
      device = "/.swap/swapfile";
      size = 8 * 1024;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp34s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
