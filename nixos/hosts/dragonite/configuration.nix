{ config, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "zfs" ];
  };

  fileSystems =
  let 
    fsType = "zfs";
    options = [ "nofail" ];
  in
  {
    "/mnt/zfs" = { 
      device = "tank";
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
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];
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
    interfaces.enp8s0.useDHCP = true;
    interfaces.wlp6s0.useDHCP = false;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users = {
      jay = {
        uid = 1000;
        hashedPassword = "$6$qzMZ0KA6USn$cgJ7wqEDkTyK/q6n1oDnX5EwCAsT84hayVXTT.XmrDB0imMvx0PzTPcyQAVI3Rwp9.Gr1TKKTnQSD2QejWg2l/";
        isNormalUser = true;
        extraGroups = [ 
          "wheel"
          "docker"
          "video"
          "networkmanager"
        ];
        subGidRanges = [{
          startGid = 10000;
          count = 1000;
        }];
      };
    };
  };

  users.groups = {
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
      members = [ 
        "jellyfin"
        "sonarr"
        "radarr"
        "lidarr"
      ];
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
      members = [ 
        "download"
        "sonarr"
        "radarr"
        "lidarr"
        "amd"
      ];
    };

    authelia = {
      gid = 10006;
      members = [ "authelia" ];
    };

    nginx = {
      gid = 10007;
      members = [ "nginx" ];
    };

  };

  users.extraUsers = 
    let
      isSystemUser = true;
      createHome = false;
      description = "User account generated for running a specific service - reference name";
    in 
    {
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
      home-assistant = { inherit isSystemUser createHome description; };
      jackett = { inherit isSystemUser createHome description; };
      unify = { inherit isSystemUser createHome description; };
      redis = { inherit isSystemUser createHome description; };
      db = { inherit isSystemUser createHome description; };
      pihole = { inherit isSystemUser createHome description; };
      backup = { inherit isSystemUser createHome description; };
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
  networking.firewall.allowedTCPPorts = [
    80
    443
    22
    9000
    8096 
  ];

  systemd.enableUnifiedCgroupHierarchy = false;
 
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

