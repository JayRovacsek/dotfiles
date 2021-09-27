{ config, pkgs, lib, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  isLinux = !isDarwin;
  meta = import ./packages/meta.nix;
in {
  imports = [ ./common.nix ] ++ meta.services;

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
}
