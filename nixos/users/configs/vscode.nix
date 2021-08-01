{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.bbenoist.Nix
      vscode-extensions.redhat.vscode-yaml
      vscode-extensions.matklad.rust-analyzer
      vscode-extensions.file-icons.file-icons
      vscode-extensions.msjsdiag.debugger-for-chrome
      vscode-extensions.dracula-theme.theme-dracula
    ];
  };
}
