{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules =
    [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/19f21b5d-0ffd-48eb-979c-199d2cc53e2e";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/CBF3-2AB1";
    fsType = "vfat";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/7dd06a70-6a7d-40ba-8c16-a3171738270d"; }];

  virtualisation.virtualbox.guest.enable = true;
}
