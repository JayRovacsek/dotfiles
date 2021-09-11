{
  packages = with import <nixpkgs> { config.allowUnfree = true; }; [
    # CLI Utilities
    killall

    # Productivity
    nextcloud-client
    yubikey-manager-qt

    # Browsers
    tor-browser-bundle-bin
    ungoogled-chromium

    # Gnome
    gjs
    gnome.gnome-tweaks
    gnome.nautilus

    ## Gnome Extensions
    gnomeExtensions.application-volume-mixer
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-panel
    gnomeExtensions.screenshot-tool

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
    steam

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
  ];
}
