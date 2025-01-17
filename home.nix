{ config, pkgs, lib, pkgs-latest, vscode-extensions, ... }:

let
  myPkgsPaths = [
    ./shell/ghcl.nix
    ./shell/gsw.nix
  ];
in
rec {
  home.username = "fcharpentier";
  home.homeDirectory = "/home/fcharpentier";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ./shell/bash.nix
    ./shell/nu.nix
    (import ./shell/starship.nix {inherit lib; inherit (home) username;})
    ./alacritty.nix
    (import ./vscode.nix {pkgs = pkgs-latest; inherit vscode-extensions;})
    ./eza.nix
    ./bat.nix
    ./lazygit.nix
    ./delta.nix
  ];

  home.packages = (with pkgs; [
    # Simple tree directory lister
    tree

    # Wayland clipboard CLI tools
    wl-clipboard

    # Clang compiler and associated tools
    clang
    clang-tools

    # CLI tool to unzip zip archives
    unzip

    # FOSS alternative Epic Games launcher: CLI and GUI
    legendary-gl
    rare
    wineWowPackages.waylandFull
  ]) ++ (with pkgs-latest; [
    gh
  ]) ++ (map (p: import p {inherit pkgs;}) myPkgsPaths);

  home.file = {
    ".bash_completion".text = ''
        COMPAL_AUTO_UNMASK=1
        source ${pkgs.complete-alias}/bin/complete_alias
    '';
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
