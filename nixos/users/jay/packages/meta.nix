let
  profile = import ../profile.nix;
  linuxPkgs = import ./linux.nix;
  darwinPkgs = import ./darwin.nix;
  isDarwin = profile.operatingSystem != "linux";
in {
  imports = if isDarwin then [ ] else [ ./services/nextcloud-client.nix ];
  packages = if isDarwin then darwinPkgs else linuxPkgs ++ darwinPkgs;
}
