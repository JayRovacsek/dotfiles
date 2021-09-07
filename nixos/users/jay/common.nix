{ config, pkgs, lib, ... }:
let
  profile = import ./profile.nix;
  isLinux = profile.operatingSystem == "linux";
  isDarwin = !isLinux;
in {
  nixpkgs.config.allowUnfree = true;

  imports =
    [ ./configs/alacritty.nix ./configs/starship.nix ./configs/lsd.nix ];

  services.gpg-agent = {
    enable = isLinux;
    defaultCacheTtl = 1800;
    enableSshSupport = isLinux;
  };

  programs = {
    git = {
      enable = true;
      userEmail = "jay@rovacsek.com";
      userName = "jayrovacsek";
    };
    home-manager.enable = true;
  };

  home.stateVersion = "21.11";
}
