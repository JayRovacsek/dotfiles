{
  imports = [ ./common.nix ./alacritty.nix ./starship.nix ];
  home = {
    username = "jay";
    homeDirectory = "/home/jay";
    packages = with pkgs; [
      # CLI Utilities
      alacritty
      starship
      lsd
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
      ## Rust
      rust-analyzer
      rustc
      rustfmt
      ## NodeJS
      nodejs
      nodePackages.npm
      nodePackages.typescript
      ## Python
      python310

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
