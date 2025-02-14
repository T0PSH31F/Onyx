# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  inputs,
  modulesPath,
  pkgs,
  ...
  }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];


  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "uas" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" "i2c-dev" "i2c-piix4" ];
  boot.kernelParams = [ "i915.force_probe=a721" ];
  services.hardware.openrgb.enable = true;
  services.udev.packages = [ pkgs.openrgb ];
  hardware.i2c.enable = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1b4a87df-48a1-4348-b2f3-32578668ae58";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  boot.initrd.luks.devices."luks-06d8f842-3fc1-43ab-a711-238660c7b9b9".device = "/dev/disk/by-uuid/06d8f842-3fc1-43ab-a711-238660c7b9b9";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/1b4a87df-48a1-4348-b2f3-32578668ae58";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/1b4a87df-48a1-4348-b2f3-32578668ae58";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/1b4a87df-48a1-4348-b2f3-32578668ae58";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/1b4a87df-48a1-4348-b2f3-32578668ae58";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/35A1-CD02";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/ae04c719-001c-41ea-a82a-7acc29cc7ab4"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.networkmanager.unmanaged = [ "interface-name:wlan*" ];
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
