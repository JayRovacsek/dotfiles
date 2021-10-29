let
  pkgs = import <nixpkgs> { };
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  isLinux = !isDarwin;
in {
  services.nextcloud-client = {
    enable = isLinux;
    startInBackground = true;
  };
}
