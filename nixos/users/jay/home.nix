{ config, pkgs, lib, ... }:
let
  machine = import ./machine.nix;
  isLinux = machine.operatingSystem != "Darwin";
  isDarwin = machine.operatingSystem == "Darwin";
in {

  imports = [
    ./common.nix
    ./configs/alacritty.nix
    ./configs/starship.nix
    ./configs/lsd.nix
  ] ++ lib.optional isLinux [ ./services/nextcloud-client.nix ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = if isLinux then "jay" else "jrovacsek";
    homeDirectory = if isLinux then "/home/jay" else "/Users/jrovacsek";
    packages = with pkgs;
      [
        # CLI Utilities
        alacritty
        aws
        starship
        lsd
        jq
        htop
        killall
        tree
        nmap
        zsh
        oh-my-zsh

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
        aws
        yubikey-personalization
        pciutils

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

  home.activation = {
    copyApplications = let
      apps = pkgs.buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
      };
    in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      baseDir="$HOME/Applications/Home Manager Apps"
      if [ -d "$baseDir" ]; then
        rm -rf "$baseDir"
      fi
      mkdir -p "$baseDir"
      for appFile in ${apps}/Applications/*; do
        target="$baseDir/$(basename "$appFile")"
        $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
        $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
      done
    '';
  };

  programs.zsh = {
    enable = true;
    history.size = 10000;
    initExtraFirst = ''ZSH="/Users/jrovacsek/.oh-my-zsh"'';
    initExtra = ''
      HYPHEN_INSENSITIVE="true"
      ENABLE_CORRECTION="true"
      COMPLETION_WAITING_DOTS="true"

      # Preferred editor for local and remote sessions
      if [[ -n $SSH_CONNECTION ]]; then
          export EDITOR='vim'
      else
          export EDITOR='vim'
      fi

      export WASMTIME_HOME="~/.wasmtime"

      export PATH="$WASMTIME_HOME/bin:$PATH"
      export PATH="/usr/bin:$PATH"
      export PATH=$PATH:$(go env GOPATH)/bin
      export GOPATH=$(go env GOPATH)
      eval "$(starship init zsh)"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "zsh-completions"
      ];
    };

    shellAliases = {
      nano = "vim";
      l = "lsd -al";
      ls = "lsd";
      python = "python3";
      pip = "pip3";
      update = "sudo nix-channel --update";
      rebuild = "sudo nixos-rebuild switch";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "jay@rovacsek.com";
    userName = "jayrovacsek";
  };
}
