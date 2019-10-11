{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let
  inherit (nixpkgs) pkgs;
  f = import ./gen.nix; # cabal2nix . > ./gen.nix
  haskellPackages = if compiler == "default"
    then pkgs.haskellPackages
    else pkgs.haskell.packages.${compiler};
in
  pkgs.haskell.lib.justStaticExecutables (haskellPackages.callPackage f {})
