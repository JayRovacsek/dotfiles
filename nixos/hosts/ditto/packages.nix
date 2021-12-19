let pkgs = import <nixpkgs> { config.allowUnfree = true; };
in {

  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
    firefox
    chromium
    dnsutils
    htop
    zsh-autosuggestions
    nix-zsh-completions
    jq
    oh-my-zsh
    alacritty
    iputils
    cherrytree
    elfutils
    binutils
    macchanger

    # hecker toolz
    metasploit
    arping
    burpsuite
    clang
    binwalk
    crunch
    hashdeep
    fierce
    hashcat
    hcxtools
    john
    medusa
    dirb
    masscan
    nmap
    nmap-graphical
    mitmproxy
    netsniff-ng
    tcpflow
    xorex
    pwnat
    sqlmap
    sqlite
    sqlitebrowser
    sslscan
    wafw00f
    wfuzz
    swaks
    wireshark
    zap
  ];
}
