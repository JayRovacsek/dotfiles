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
      members = [ "jellyfin" "sonarr" "radarr" "lidarr" "tdarr" "prowlarr" ];
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
      members = [ "download" "sonarr" "radarr" "lidarr" "prowlarr" ];
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

    games = {
      gid = 10017;
      members = [ "minecraft" "valheim" ];
    };

    duin = {
      gid = 10018;
      members = [ "duin" ];
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
      group = "jellyfin";
    };

    portainer = {
      inherit isSystemUser createHome description;
      uid = 997;
      group = "portainer";
    };

    speedtest = {
      inherit isSystemUser createHome description;
      uid = 996;
      group = "speedtest";
    };

    authelia = {
      inherit isSystemUser createHome description;
      uid = 991;
      group = "authelia";
    };

    lidarr = {
      inherit isSystemUser createHome description;
      uid = 990;
      group = "download";
    };

    minecraft = {
      inherit isSystemUser createHome description;
      uid = 989;
      group = "games";
    };

    nextcloud = {
      inherit isSystemUser createHome description;
      uid = 988;
      group = "nextcloud";
    };

    nginx = {
      inherit isSystemUser createHome description;
      uid = 987;
      group = "nginx";
    };

    radarr = {
      inherit isSystemUser createHome description;
      uid = 986;
      group = "download";
    };

    sonarr = {
      inherit isSystemUser createHome description;
      uid = 985;
      group = "download";
    };

    download = {
      inherit isSystemUser createHome description;
      uid = 984;
      group = "download";
    };

    backup = {
      inherit isSystemUser createHome description;
      uid = 983;
      group = "backup";
    };

    db = {
      inherit isSystemUser createHome description;
      uid = 982;
      group = "db";
    };

    home_assistant = {
      inherit isSystemUser createHome description;
      uid = 981;
      group = "home_assistant";
    };

    jackett = {
      inherit isSystemUser createHome description;
      uid = 980;
      group = "download";
    };

    pihole = {
      inherit isSystemUser createHome description;
      uid = 979;
      group = "pihole";
    };

    redis = {
      inherit isSystemUser createHome description;
      uid = 978;
      group = "redis";
    };

    unify = {
      inherit isSystemUser createHome description;
      uid = 977;
      group = "unify";
    };

    swag = {
      inherit isSystemUser createHome description;
      uid = 976;
      group = "swag";
    };

    valheim = {
      inherit isSystemUser createHome description;
      uid = 975;
      group = "games";
    };

    tdarr = {
      inherit isSystemUser createHome description;
      uid = 974;
      group = "media";
    };

    ombi = {
      inherit isSystemUser createHome description;
      uid = 973;
      group = "media";
    };

    duin = {
      inherit isSystemUser createHome description;
      uid = 972;
      group = "duin";
    };

    prowlarr = {
      inherit isSystemUser createHome description;
      uid = 971;
      group = "media";
    };

  };
}
