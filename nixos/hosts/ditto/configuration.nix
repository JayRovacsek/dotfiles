{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ./packages.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ditto";
  time.timeZone = "Australia/NSW";

  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  services.xserver = {
    enable = true;
    displayManager.gdm = { enable = true; };
    desktopManager = { gnome.enable = true; };
  };

  services.xserver.videoDrivers =
    lib.mkForce [ "vmware" "virtualbox" "modesetting" ];

  systemd.services.virtualbox-resize = {
    description = "Virtualbox Guest Resizing";
    wantedBy = [ "multi-user.target" ];
    requires = [ "dev-vboxguest.device" ];
    after = [ "dev-vboxguest.device" ];

    unitConfig.ConditionVirtualization = "oracle";

    serviceConfig.ExecStart =
      "@${config.boot.kernelPackages.virtualboxGuestAdditions}/bin/VBoxClient -fv --vmsvga";
  };

  services.xserver.layout = "us";
  services.gvfs.enable = true;

  users.defaultUserShell = pkgs.zsh;

  users.users.jay = {
    initialPassword =
      "this is the initial password, it's not really that secretive";
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxsf" ];
  };

  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
    };
  };

  system.stateVersion = "21.05"; # Did you read the comment?
}

