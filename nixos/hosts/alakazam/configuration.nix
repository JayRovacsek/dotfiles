{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
    efiInstallAsRemovable = true;
    useOSProber = true;
    enableCryptodisk = true;
  };

  boot.initrd.luks.devices.crypted = {
    device = "/dev/disk/by-uuid/7cf02c33-9404-45af-9e53-2fa65aa59027";
    preLVM = true;
  };

  time.timeZone = "Australia/NSW";

  networking = {
    hostName = "alakazam";
    useDHCP = false;
    firewall.allowedTCPPorts = [ 22 27036 27037 ];
    firewall.allowedUDPPorts = [ 27031 27036 ];
  };

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
    libvirtd.onBoot = "start";
    libvirtd.onShutdown = "shutdown";
    libvirtd.qemuPackage = pkgs.qemu_kvm;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users = { 
    jay = {
      isNormalUser = true;
      useDefaultShell = true;
      extraGroups = [ "wheel" "docker" "libirt" ];
    };
    sarah = {
      isNormalUser = true;
      useDefaultShell = true;
      extraGroups = [ "wheel" ];
    };
  };

  programs = {
    gnome-terminal.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    steam.enable = true;
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
  };

  environment.systemPackages = with pkgs; [
    cifs-utils
    dnsutils
    exfat
    gnupg
    libfido2
    linuxPackages.nvidia_x11
    nerdfonts
    paperkey
    pinentry-curses
    pinentry-gnome
    traceroute
    vim
    vulkan-extension-layer
    vulkan-headers
    vulkan-tools
    wget
    wget
    wine
    zsh
    oh-my-zsh
    firefox
    virt-manager
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome.cheese
    gnome-photos
    gnome.gnome-music
    gnome.gedit
    epiphany
    evince
    gnome.gnome-characters
    gnome.totem
    gnome.tali
    gnome.iagno
    gnome.hitori
    gnome.atomix
    gnome.gnome-weather
    gnome.gnome-screenshot
    gnome.gnome-contacts
    gnome.gnome-maps
    gnome.geary
    gnome-tour
    gnome-connections
  ];

  fonts.fonts = with pkgs; [ (nerdfonts.override { fonts = [ "Hack" ]; }) ];

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
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";
  system.stateVersion = "21.11";
}

