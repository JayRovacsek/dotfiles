{
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  powerManagement.enable = false;

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

  time.timeZone = "Australia/NSW";
}
