{ config, pkgs, lib, pkgs-latest, vscode-extensions, ... }:

let
  myPkgsPaths = [
    ./shell/ghcl.nix
    ./shell/gsw.nix
  ];
in
rec {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
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
    ./lazygit.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    tree
    wl-clipboard
    clang
    clang-tools
    unzip
  ] ++ (map (p: import p {inherit pkgs;}) myPkgsPaths);

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/fcharpentier/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    PS1 = ''\[\e[0;36m\][\[\e[1;32m\]bash\[\e[0;32m\]`put_shlvl`\[\e[37;1m\]/\[\e[1;36m\]\u@\h\[\e[37;1m\]:\[\e[1;34m\]\W\[\e[0;34m\]`__git_ps1 "(%s)"`\[\e[0;36m\]]\n\[\e[1;31m\]`put_nonzero_status`\[\e[1;33m\]\$\[\e[m\] '';

    PS1_HOOKS = "play_PS1_sound";

    BEEPFILE = "~/Sounds/beep.wav";
    BOOPFILE = "~/Sounds/sound_error.wav";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
