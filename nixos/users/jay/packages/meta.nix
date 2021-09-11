let
  profile = import ../profile.nix;
  linux = import ./linux.nix;
  darwin = import ./darwin.nix;
  isDarwin = profile.operatingSystem != "linux";
in {
  services = if isDarwin then [ ] else [ ../services/nextcloud-client.nix ];
  packages = if isDarwin then darwin else linux.packages ++ darwin.packages;
}
