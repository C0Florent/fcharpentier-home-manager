inputs@{ pkgs, lib, mylib, ... }:

{
  home.packages = mylib.attrsToListRec (
    lib.packagesFromDirectoryRecursive {
      inherit (pkgs) callPackage;
      directory = ./packages;
    }
  );
}
