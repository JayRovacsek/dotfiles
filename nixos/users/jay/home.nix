{ config, pkgs, lib, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  isLinux = !isDarwin;
  meta = import ./packages/meta.nix;
in {
  imports = [ ./common.nix ] ++ meta.services;

  nixpkgs.config.allowUnfree = true;

  home = {
    username = if isLinux then "jay" else "jrovacsek";
    homeDirectory = if isLinux then "/home/jay" else "/Users/jrovacsek";
    packages = meta.packages;
  };

  home.activation = if isLinux then
    { }
  else {
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
    initExtraFirst = ''
      ZSH="/${if isLinux then "home/jay" else "Users/jrovacsek"}/.oh-my-zsh"'';
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
}
