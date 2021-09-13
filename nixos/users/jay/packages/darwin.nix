let pkgs = import <nixpkgs> { };
in {
  services = [ ];
  packages = with pkgs; [
    # CLI Utilities
    alacritty
    aws
    git
    htop
    jq
    lsd
    nmap
    oh-my-zsh
    pciutils
    starship
    tree
    yubikey-personalization
    zsh
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting

    # Fonts
    nerdfonts

    # Productivity
    keepassxc
    libvirt
    pigz
    wireshark
    unzip

    # Development
    vscode

    ## C
    gcc

    ## Rust
    cargo
    rust-analyzer
    rustc
    rustfmt

    ## NodeJS
    nodejs
    nodePackages.npm
    nodePackages.typescript

    ## Python
    python310

    ## Nix
    nixfmt

    ## Golang
    delve
    go
    go-outline
    go-tools
    gopls

    ## Docker
    docker-compose

    ## Tex
    texlive.combined.scheme-full

    ## Misc
    hunspell
    hunspellDicts.en-au
    pkg-config

    # Communication
    slack
  ];
}
