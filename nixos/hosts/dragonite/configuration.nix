{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "zfs" ];
  };

  fileSystems = let
    fsType = "zfs";
    options = [ "nofail" ];
  in {
    "/mnt/zfs" = {
      device = "tank";
      inherit fsType options;
    };

    "/mnt/zfs/storage" = {
      device = "tank/storage";
      inherit fsType options;
    };

    "/mnt/zfs/cache" = {
      device = "tank/cache";
      inherit fsType options;
    };

    "/mnt/zfs/containers" = {
      device = "tank/containers";
      inherit fsType options;
    };

    "/mnt/zfs/isos" = {
      device = "tank/isos";
      inherit fsType options;
    };

    "/mnt/zfs/tv" = {
      device = "tank/tv";
      inherit fsType options;
    };

    "/mnt/zfs/backup" = {
      device = "tank/backup";
      inherit fsType options;
    };

    "/mnt/zfs/personal_video" = {
      device = "tank/personal_video";
      inherit fsType options;
    };

    "/mnt/zfs/work" = {
      device = "tank/work";
      inherit fsType options;
    };

    "/mnt/zfs/games" = {
      device = "tank/games";
      inherit fsType options;
    };

    "/mnt/zfs/movies" = {
      device = "tank/movies";
      inherit fsType options;
    };

    "/mnt/zfs/nextcloud" = {
      device = "tank/nextcloud";
      inherit fsType options;
    };

    "/mnt/zfs/music" = {
      device = "tank/music";
      inherit fsType options;
    };

    "/mnt/zfs/photos" = {
      device = "tank/photos";
      inherit fsType options;
    };

    "/mnt/zfs/downloads" = {
      device = "tank/downloads";
      inherit fsType options;
    };

    "/mnt/zfs/databases" = {
      device = "tank/databases";
      inherit fsType options;
    };

    "/mnt/zfs/home_assistant" = {
      device = "tank/home_assistant";
      inherit fsType options;
    };
  };

  services.xserver = { videoDrivers = [ "nvidia" ]; };

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

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users = {
      jay = {
        uid = 1000;
        hashedPassword =
          "$6$qzMZ0KA6USn$cgJ7wqEDkTyK/q6n1oDnX5EwCAsT84hayVXTT.XmrDB0imMvx0PzTPcyQAVI3Rwp9.Gr1TKKTnQSD2QejWg2l/";
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" "video" "networkmanager" "users" ];
        subGidRanges = [{
          startGid = 10000;
          count = 1000;
        }];
      };
    };
  };

  networking = {
    wireless.enable = false;
    hostId = "acd009f4";
    hostName = "dragonite";
    useDHCP = false;
    interfaces.enp9s0.useDHCP = true;
  };

  users.groups = {
    users = { gid = 100; };
    portainer = {
      gid = 10000;
      members = [ "portainer" ];
    };

    jellyfin = {
      gid = 10001;
      members = [ "jellyfin" ];
    };

    media = {
      gid = 10002;
      members = [ "jellyfin" "sonarr" "radarr" "lidarr" ];
    };

    nextcloud = {
      gid = 10003;
      members = [ "nextcloud" ];
    };

    minecraft = {
      gid = 10004;
      members = [ "minecraft" ];
    };

    download = {
      gid = 10005;
      members = [ "download" "sonarr" "radarr" "lidarr" "amd" ];
    };

    authelia = {
      gid = 10006;
      members = [ "authelia" ];
    };

    nginx = {
      gid = 10007;
      members = [ "nginx" ];
    };

    home_assistant = {
      gid = 10008;
      members = [ "home_assistant" ];
    };

    jackett = {
      gid = 10009;
      members = [ "jackett" ];
    };

    unify = {
      gid = 10010;
      members = [ "unify" ];
    };

    redis = {
      gid = 10011;
      members = [ "redis" ];
    };

    db = {
      gid = 10012;
      members = [ "db" ];
    };

    pihole = {
      gid = 10013;
      members = [ "pihole" ];
    };

    backup = {
      gid = 10014;
      members = [ "backup" ];
    };

    swag = {
      gid = 10015;
      members = [ "swag" "jay" ];
    };
  };

  users.extraUsers = let
    isSystemUser = true;
    createHome = false;
    description = "User account generated for running a specific service";
  in {
    portainer = {
      inherit isSystemUser createHome description;
      uid = 997;
    };

    jellyfin = {
      inherit isSystemUser createHome description;
      uid = 998;
    };

    sonarr = {
      inherit isSystemUser createHome description;
      uid = 985;
    };

    radarr = {
      inherit isSystemUser createHome description;
      uid = 986;
    };

    lidarr = {
      inherit isSystemUser createHome description;
      uid = 990;
    };

    authelia = {
      inherit isSystemUser createHome description;
      uid = 991;
    };

    nginx = {
      inherit isSystemUser createHome description;
      uid = 987;
    };

    nextcloud = {
      inherit isSystemUser createHome description;
      uid = 988;
    };

    minecraft = {
      inherit isSystemUser createHome description;
      uid = 989;
    };

    amd = {
      inherit isSystemUser createHome description;
      uid = 992;
    };

    download = {
      inherit isSystemUser createHome description;
      uid = 984;
    };

    home_assistant = {
      inherit isSystemUser createHome description;
      uid = 981;
    };

    jackett = {
      inherit isSystemUser createHome description;
      uid = 980;
    };

    unify = {
      inherit isSystemUser createHome description;
      uid = 977;
    };

    swag = {
      inherit isSystemUser createHome description;
      uid = 976;
    };

    redis = {
      inherit isSystemUser createHome description;
      uid = 978;
    };

    db = {
      inherit isSystemUser createHome description;
      uid = 982;
    };

    pihole = {
      inherit isSystemUser createHome description;
      uid = 979;
    };

    backup = {
      inherit isSystemUser createHome description;
      uid = 983;
    };
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
    openssh.enable = true;
    zfs.autoSnapshot.enable = true;
    zfs.autoScrub.enable = true;
  };

  # Open ports in the firewall.
  networking.firewall = { allowedTCPPorts = [ 80 443 22 9000 ]; };

  systemd.enableUnifiedCgroupHierarchy = false;
  systemd.services.docker.after = [ "zfs-mount.service" ];
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

