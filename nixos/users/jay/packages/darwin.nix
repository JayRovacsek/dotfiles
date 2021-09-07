{
  darwin = with import <nixpkgs> { }; [
    # CLI Utilities
    alacritty
    aws
    starship
    lsd
    jq
    htop
    tree
    nmap
    zsh
    oh-my-zsh
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    yubikey-personalization
    pciutils

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
  ];
}
