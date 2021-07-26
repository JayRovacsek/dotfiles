{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
 
  networking.hostName = "Alakazam"; 

  time.timeZone = "Australia/NSW";

  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.core-utilities.enable = false;
  
  services.gvfs.enable = true;

  location.latitude = -32.917;
  location.longitude = 151.800;

  services.redshift = {
    enable = true;
    brightness = {
      day = "1";
      night = "1";
    };
    temperature = {
      day = 5500;
      night = 3700;
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.enable = true;
  hardware.pulseaudio.support32Bit = true;

  virtualisation.docker = {
    enable = true;

    autoPrune = {
      enable = true;
    };
  };

  fileSystems =
  let
    fileServer = "b8754b7bb5afe17f00da528503355a9607b9fb7c.unraid.net";
    automount_opts = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "iocharset=utf8"
      "rw"
      "_netdev"];
    options = [
      "credentials=/etc/nixos/smb-secrets"
      ] ++ automount_opts;
  in
  {
    "/mnt/_storage" = {
      device = "//${fileServer}/Storage";
      fsType = "cifs";
      inherit options;
    };
    "/mnt/_games" = {
      device = "//${fileServer}/Games";
      fsType = "cifs";
      inherit options;
    };
    "/mnt/_isos" = {
      device = "//${fileServer}/ISOs";
      fsType = "cifs";
      inherit options;
    };
    "/mnt/_music" = {
      device = "//${fileServer}/Music";
      fsType = "cifs";
      inherit options;
    };
    "/mnt/_personal_video" = {
      device = "//${fileServer}/PersonalVideo";
      fsType = "cifs";
      inherit options;
    };
    "/mnt/_photos" = {
      device = "//${fileServer}/Photos";
      fsType = "cifs";
      inherit options;
    };
    "/mnt/_video" = {
      device = "//${fileServer}/Video";
      fsType = "cifs";
      inherit options;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      jay = {
        isNormalUser = true;
        extraGroups = [ 
          "wheel"
          "docker"
        ];
      };
      sarah = {
        isNormalUser = true;
      };
    };
  };
  
  environment.systemPackages = with pkgs; [
    # Command Line Utilities
    zsh
    dnsutils
    exfat
    libfido2
    vim
    wget
    wine
    vulkan-tools
    vulkan-extension-layer
    vulkan-headers
    yubikey-personalization
    cifs-utils
    linuxPackages.nvidia_x11_beta
  ] ++ [
    # GUI Utilities
    firefox
    lutris
    runelite
    keepassxc
    vscode
    discord
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-panel
  ];

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  # Auto-update options
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "04:00";
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-21.05";

  # Automate purging
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  # Disable Power Management
  powerManagement.enable = false;

  system.stateVersion = "21.05"; 
}