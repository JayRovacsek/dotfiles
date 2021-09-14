{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users = {
      jay = {
        uid = 1000;
        hashedPassword =
          "$6$qzMZ0KA6USn$cgJ7wqEDkTyK/q6n1oDnX5EwCAsT84hayVXTT.XmrDB0imMvx0PzTPcyQAVI3Rwp9.Gr1TKKTnQSD2QejWg2l/";
        isNormalUser = true;
        extraGroups =
          [ "wheel" "docker" "video" "networkmanager" "users" "libvirtd" ];
        subGidRanges = [{
          startGid = 10000;
          count = 1000;
        }];
      };

      root = {
        hashedPassword =
          "$6$wRRIfT/GbE4O9sCu$4SVNy.ig6x.qFiefE0y/aG4kdbKEdXF23bew7f53tn.ZxBDKra64obi0CoSnwRJBT1p5NlLEXh5m9jhX6.k3a1";
      };
    };
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
      members = [ "download" "sonarr" "radarr" "lidarr" ];
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

    speedtest = {
      gid = 10016;
      members = [ "speedtest" ];
    };
  };

  users.extraUsers = let
    isSystemUser = true;
    createHome = false;
    description = "User account generated for running a specific service";
  in {
    jellyfin = {
      inherit isSystemUser createHome description;
      uid = 998;
    };

    portainer = {
      inherit isSystemUser createHome description;
      uid = 997;
    };

    speedtest = {
      inherit isSystemUser createHome description;
      uid = 996;
    };

    authelia = {
      inherit isSystemUser createHome description;
      uid = 991;
    };

    lidarr = {
      inherit isSystemUser createHome description;
      uid = 990;
    };

    minecraft = {
      inherit isSystemUser createHome description;
      uid = 989;
    };

    nextcloud = {
      inherit isSystemUser createHome description;
      uid = 988;
    };

    nginx = {
      inherit isSystemUser createHome description;
      uid = 987;
    };

    radarr = {
      inherit isSystemUser createHome description;
      uid = 986;
    };

    sonarr = {
      inherit isSystemUser createHome description;
      uid = 985;
    };

    download = {
      inherit isSystemUser createHome description;
      uid = 984;
    };

    backup = {
      inherit isSystemUser createHome description;
      uid = 983;
    };

    db = {
      inherit isSystemUser createHome description;
      uid = 982;
    };

    home_assistant = {
      inherit isSystemUser createHome description;
      uid = 981;
    };

    jackett = {
      inherit isSystemUser createHome description;
      uid = 980;
    };

    pihole = {
      inherit isSystemUser createHome description;
      uid = 979;
    };

    redis = {
      inherit isSystemUser createHome description;
      uid = 978;
    };

    unify = {
      inherit isSystemUser createHome description;
      uid = 977;
    };

    swag = {
      inherit isSystemUser createHome description;
      uid = 976;
    };
  };
}
