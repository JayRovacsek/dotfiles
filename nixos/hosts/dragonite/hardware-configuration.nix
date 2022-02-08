{ config, lib, pkgs, modulesPath, ... }:

let patchDriver = import ./nvenc-unlock.nix;
in {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules =
    [ "kvm-amd" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
  boot.extraModulePackages = [ ];
  boot.extraModprobeConfig = "options vfio-pci ids=04:00.0,04:00.1";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/910a3375-cfe7-4c14-a6ec-5f2c1306548a";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0372-A22D";
    fsType = "vfat";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/de692380-3788-4375-8afb-33a6195fa9e6"; }];

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    nvidia = {
      package = patchDriver config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
    };
  };

}
