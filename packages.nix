inputs@{ pkgs, lib, mylib, ... }:

mylib.attrsToListRec (
  lib.packagesFromDirectoryRecursive {
    inherit (pkgs) callPackage;
    directory = ./packages;
  }
)
