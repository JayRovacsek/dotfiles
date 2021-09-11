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
    gnome.nautilus
    gnome.gnome-tweaks
    gjs

    ## Gnome Extensions
    gnomeExtensions.caffeine
    gnomeExtensions.screenshot-tool
    gnomeExtensions.dash-to-panel
    gnomeExtensions.application-volume-mixer

    ## X Utils
    libxkbcommon
    xorg.xcbutil
    xorg.libXtst
    libpng
    xorg.xcbutilkeysyms
    xorg.libX11.dev

    ## OpenGL
    glfw

    # Games
    steam
    lutris
    runelite

    # Game Requirements
    ## Origin: https://github.com/lutris/docs/blob/master/Origin.md
    gnutls
    libgpgerror
    libxml2
    alsaPlugins
    SDL2
    dbus
    libgcrypt
    wine
    mono

    winetricks
    protontricks

    # Communication
    discord
    thunderbird
    signal-desktop
  ];
}
