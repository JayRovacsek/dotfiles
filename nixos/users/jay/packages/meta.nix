{ pkgs }:
let
  linux = import ./linux.nix;
  darwin = import ./darwin.nix;
in {
  services = linux.services ++ darwin.services;
  packages = linux.packages ++ darwin.packages;
}
