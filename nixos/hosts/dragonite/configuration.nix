{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./filesystems.nix
    ./firewall.nix
    ./users.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "zfs" ];
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

  nixpkgs.config.allowUnfree = true;

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  time.timeZone = "Australia/NSW";

  networking = {
    wireless.enable = false;
    hostId = "acd009f4";
    hostName = "dragonite";
    useDHCP = false;
    interfaces.enp9s0.useDHCP = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    exfat
    cifs-utils
    dnsutils
    curl
    zfs
    htop
    pciutils
    zsh-autosuggestions
    nix-zsh-completions
    jq
    oh-my-zsh
    nvidia-docker
    linuxPackages.nvidia_x11_beta
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "risto";
    };
  };

  services = {
    xserver = { videoDrivers = [ "nvidia" ]; };
    openssh.enable = true;
    zfs.autoSnapshot.enable = true;
    zfs.autoScrub.enable = true;
    samba = {
      enable = true;
      securityType = "user";
      extraConfig = ''
        workgroup = WORKGROUP
        server string = smbnix
        netbios name = smbnix
        security = user 
        hosts allow = 192.168.1.0/24 192.168.8.0/24 localhost
        hosts deny = 0.0.0.0/0
        guest account = nobody
        map to guest = bad user
      '';
      shares = {
        isos = {
          path = "/mnt/zfs/isos";
          browseable = "yes";
          "read only" = true;
          "guest ok" = "yes";
          comment = "Public ISO Share";
        };
      };
    };
  };

  systemd.enableUnifiedCgroupHierarchy = false;
  systemd.services.docker.after = [ "zfs-mount.service" ];
  systemd.services.smbd.after = [ "zfs-mount.service" ];
  systemd.services.docker.unitConfig.RequiresMountsFor = "/var/lib/docker";

  system = {
    autoUpgrade.enable = true;
    autoUpgrade.allowReboot = true;
    autoUpgrade.dates = "04:30";
    stateVersion = "21.05";
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  powerManagement.enable = false;
}

