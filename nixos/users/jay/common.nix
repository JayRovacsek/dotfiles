{ config, pkgs, lib, ... }:
let
  machine  = import ./machine.nix;
  isLinux = machine.operatingSystem != "Darwin";
  isDarwin = machine.operatingSystem == "Darwin";
in
{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.gpg-agent = {
    enable = isLinux;
    defaultCacheTtl = 1800;
    enableSshSupport = isLinux;
  };

  home.stateVersion = "21.11";
}
