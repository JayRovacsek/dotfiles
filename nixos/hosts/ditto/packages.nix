let pkgs = import <nixpkgs> { config.allowUnfree = true; };
in {

  environment.systemPackages = with pkgs; [
    alacritty
    binutils
    cherrytree
    chromium
    curl
    dnsutils
    elfutils
    firefox
    git
    htop
    iputils
    jq
    macchanger
    nix-zsh-completions
    oh-my-zsh
    vim
    wget
    zsh-autosuggestions

    # hecker toolz
    arping
    binwalk
    burpsuite
    clang
    crunch
    dirb
    fierce
    gobuster
    hashcat
    hashdeep
    hcxtools
    john
    masscan
    medusa
    metasploit
    mitmproxy
    netsniff-ng
    nmap
    nmap-graphical
    pwnat
    sqlite
    sqlitebrowser
    sqlmap
    sslscan
    swaks
    tcpflow
    wafw00f
    wfuzz
    wireshark
    xorex
    zap
  ];
}
