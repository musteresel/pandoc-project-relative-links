{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let
  inherit (nixpkgs) pkgs;
  f = import ./gen.nix; # cabal2nix . > ./gen.nix
  haskellPackages = if compiler == "default"
    then pkgs.haskellPackages
    else pkgs.haskell.packages.${compiler};
in
  haskellPackages.callPackage f {}
