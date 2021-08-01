# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "alakazam"; # Define your hostname.

  time.timeZone = "Australia/NSW";

  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;

  services.gnome.core-utilities.enable = false;

  services.gvfs.enable = true;

  location.latitude = -32.917;
  location.longitude = 151.8;

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

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      modesetting.enable = true;
    };
  };

  services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "nvidia" ];
    displayManager = { gdm.enable = true; };
    desktopManager.gnome.enable = true;
  };

  services.udev.packages = [ pkgs.yubikey-personalization ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  virtualisation = {
    docker = {
      enable = true;
      enableNvidia = true;
      autoPrune = { enable = true; };
    };
    libvirtd.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.jay = {
    isNormalUser = true;
    useDefaultShell = true;
    extraGroups = [ "wheel" "docker" ];
  };

  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [ "git" "sudo" ];
        theme = "risto";
      };
    };
    gnome-terminal.enable = true;
  };

  environment.systemPackages = with pkgs; [
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
    wget
    firefox
    tor-browser-bundle-bin
    ungoogled-chromium
    git
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-panel
    nerdfonts
  ];

  fonts.fonts = with pkgs; [ (nerdfonts.override { fonts = [ "Hack" ]; }) ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  networking.firewall.allowedTCPPorts = [ 22 ];

  services.openssh.enable = true;

  # Automate purging
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    allowedUsers = [ "@wheel" "jay" ];
    autoOptimiseStore = true;
    optimise.automatic = true;
  };

  # Auto-update options
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "04:00";
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-21.05";
  system.stateVersion = "21.05";
}

