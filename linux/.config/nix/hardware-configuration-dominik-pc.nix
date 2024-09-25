# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c2112585-b6bd-42e5-85e5-bb3f01579944";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/c2112585-b6bd-42e5-85e5-bb3f01579944";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/opt" =
    { device = "/dev/disk/by-uuid/c2112585-b6bd-42e5-85e5-bb3f01579944";
      fsType = "btrfs";
      options = [ "subvol=@opt" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/c2112585-b6bd-42e5-85e5-bb3f01579944";
      fsType = "btrfs";
      options = [ "subvol=@var" ];
    };

  fileSystems."/.swap" =
    { device = "/dev/disk/by-uuid/c2112585-b6bd-42e5-85e5-bb3f01579944";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3715-3ECA";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ { device =  "/.swap/swapfile"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp34s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}