{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let
  drv = import ./default.nix {
    nixpkgs = nixpkgs;
    compiler = compiler;
  };
in
  drv.env
