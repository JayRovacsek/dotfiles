{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
    ./networking.nix
    ./packages/meta.nix
    ./services.nix
    ./system-config.nix
    ./users.nix
    ./virt/meta.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "zfs" ];
    kernelParams = [ "amd_iommu=on" ];
  };
}

