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
    zsh = {
      enable = true;
      history.size = 10000;
      initExtraFirst = ''
        ZSH="/${
          if isLinux then
            "home/jay/.nix-profile/share/oh-my-zsh"
          else
            "Users/jrovacsek/.oh-my-zsh"
        }"'';
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

        export PATH=$PATH:$(go env GOPATH)/bin
        export GOPATH=$(go env GOPATH)
        eval "$(starship init zsh)"
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
          "zsh-completions"
        ];
        theme = "risto";
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
  };

  home.stateVersion = "21.11";
}
