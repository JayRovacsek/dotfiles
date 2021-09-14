{ config, lib, pkgs, ... }: {
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  virtualisation.libvirtd.onBoot = "start";
  virtualisation.libvirtd.onShutdown = "shutdown";
  virtualisation.libvirtd.qemuPackage = pkgs.qemu_kvm;
  virtualisation.libvirtd.enable = true;
}
