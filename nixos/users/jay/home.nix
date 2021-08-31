{ config, pkgs, lib, ... }:
let
  machine  = import ./machine.nix;
  isLinux = machine.operatingSystem != "Darwin";
  isDarwin = machine.operatingSystem == "Darwin";
in
{

  imports = [
    ./common.nix
    ./configs/alacritty.nix
    ./configs/starship.nix
    ./configs/lsd.nix
  ] ++ lib.optional isLinux 
  [
    ./services/nextcloud-client.nix
  ];

  home = {
    username = if isLinux then "jay" else "jrovacsek";
    homeDirectory = if isLinux then "/home/jay" else "/Users/jrovacsek";
    packages = with pkgs; [
      # CLI Utilities
      alacritty
      starship
      lsd
      jq
      htop
      killall
      tree
      oh-my-zsh
      zsh-completions
      zsh-autosuggestions
      zsh-syntax-highlighting
      nmap

      # Fonts
      nerdfonts

      # Productivity
      keepassxc
      libvirt
      unzip
      pigz

      # Development
      vscode

      ## C
      gcc

      ## Rust
      rust-analyzer
      rustc
      rustfmt
      cargo

      ## NodeJS
      nodejs
      nodePackages.npm
      nodePackages.typescript

      ## Python
      python310

      ## Nix
      nixfmt

      ## Golang
      go
      go-tools
      delve
      gopls
      go-outline

      ## Docker
      docker-compose

      ## Tex
      texlive.combined.scheme-full

      ## Misc
      pkg-config
      hunspell
      hunspellDicts.en-au

      # Communication
      slack
    ] ++ lib.optional isLinux [
      # CLI Utilities
      alacritty
      aws
      starship
      lsd
      jq
      htop
      killall
      tree
      oh-my-zsh
      zsh-completions
      zsh-autosuggestions
      zsh-syntax-highlighting
      yubikey-personalization
      pciutils
      nmap

      # Productivity
      nextcloud-client
      authy
      yubikey-manager-qt

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
      wineWowPackages.stable

      # Communication
      discord
      thunderbird
      signal-desktop
    ];
  };

  home.file = {
    ".zshrc".text = ''
      HYPHEN_INSENSITIVE="true"
      ENABLE_CORRECTION="true"
      COMPLETION_WAITING_DOTS="true"

      plugins=(
          git
          zsh-autosuggestions
          zsh-syntax-highlighting
      )

      # Preferred editor for local and remote sessions
      if [[ -n $SSH_CONNECTION ]]; then
          export EDITOR='vim'
      else
          export EDITOR='vim'
      fi

      # Application aliases
      alias nano=vim
      alias l="lsd -al"
      alias ls="lsd"
      alias python='python3'
      alias pip='pip3'
      alias update="sudo nix-channel --update"
      alias rebuild="sudo nixos-rebuild switch"

      if [[ "$OSTYPE" == "darwin"* ]]; then
          alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"
      fi

      export WASMTIME_HOME="~/.wasmtime"

      export PATH="$WASMTIME_HOME/bin:$PATH"
      export PATH="/usr/bin:$PATH"
      export PATH=$PATH:$(go env GOPATH)/bin
      export GOPATH=$(go env GOPATH)

      eval "$(starship init zsh)"
    '';
  };

  # programs.firefox = { enable = true; };

  programs.git = {
    enable = true;
    userEmail = "jay@rovacsek.com";
    userName = "jayrovacsek";
  };
}
