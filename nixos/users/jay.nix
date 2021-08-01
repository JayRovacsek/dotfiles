{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./configs/alacritty.nix
    ./configs/starship.nix
    ./configs/lsd.nix
    ./configs/vscode.nix
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

      # Communication
      slack
      discord
    ];
  };

  programs.firefox = { enable = true; };

  programs.git = {
    enable = true;
    userEmail = "jay@rovacsek.com";
    userName = "jayrovacsek";
  };
}
