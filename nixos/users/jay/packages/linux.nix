let
  pkgs = import <nixpkgs> { };
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  isLinux = !isDarwin;
in {
  services = if isLinux then [ ../services/nextcloud-client.nix ] else [ ];
  packages = if isLinux then
    with pkgs; [
      # CLI Utilities
      killall
      exiftool

      # Productivity
      nextcloud-client
      gimp
      yubikey-manager-qt

      # Browsers
      tor-browser-bundle-bin
      ungoogled-chromium

      ## X Utils
      libpng
      libxkbcommon
      xorg.libX11.dev
      xorg.libXtst
      xorg.xcbutil
      xorg.xcbutilkeysyms

      ## OpenGL
      glfw

      # Games
      lutris
      runelite
      minecraft

      # Game Requirements
      ## Origin: https://github.com/lutris/docs/blob/master/Origin.md
      alsaPlugins
      dbus
      gnutls
      libgcrypt
      libgpgerror
      libxml2
      mono
      protontricks
      SDL2
      wine
      winetricks

      # Communication
      discord
      signal-desktop
      thunderbird
      teamviewer
    ]
  else
    [ ];
}
