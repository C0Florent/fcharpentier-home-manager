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
  ];

  home.packages = with pkgs; [
    tree
    wl-clipboard
    clang
    clang-tools
    unzip
  ] ++ (map (p: import p {inherit pkgs;}) myPkgsPaths);

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
