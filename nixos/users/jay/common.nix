let
  pkgs = import <nixpkgs> { };
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  isLinux = !isDarwin;
  firefox = import ./configs/firefox.nix;
in {
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
    firefox = {
      enable = isLinux;
      extensions = firefox.extensions;
      profiles = firefox.profiles;
    };
  };

  home.stateVersion = "21.11";
}
