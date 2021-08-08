{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./configs/alacritty.nix
    ./configs/starship.nix
    ./configs/lsd.nix
    ./services/nextcloud-client.nix
  ];

  home = {
    username = "jay";
    homeDirectory = "/home/jay";
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
      yubikey-personalization

      # Fonts
      nerdfonts

      # Productivity
      nextcloud-client
      keepassxc
      authy
      libvirt
      yubikey-manager-qt
      unzip

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
      slack
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
