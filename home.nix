{ config, pkgs, lib, ... }:

{
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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

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

  programs.bash = {
    enable = true;

    shellAliases = {
      cfgview = "cfg $SHELL";
      cfgedit = "cfg \"sudo su\"";

      "²" = "true";
    };

    bashrcExtra = ''
      source ${builtins.toPath ./bash/functions.sh}
      unmute
    '';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      add_newline = true;

      format = lib.concatStrings [
         ''[\[](cyan)''
         ''$shell''
         ''$shlvl''
         ''[/](bold white)''
         ''$username''
         ''[:](bold white)''
         ''$directory''
         ''([\(''
           ''$git_branch''
           ''$git_state''
         ''\)](blue))''
         ''[\]](cyan)''
         ''$line_break''
         ''$status''
         ''$character''
      ];

      shell = {
        disabled = false;
        format = "[$indicator]($style)";
        style = "bold green";
        bash_indicator = "bash";
        tcsh_indicator = "tcsh";
        fish_indicator = "fish";
        unknown_indicator = "??sh";
      };
      shlvl = {
        disabled = false;
        threshold = 1;
        format = ''[\($shlvl\)]($style)'';
        style = "green";
      };
      username = {
        show_always = true;
        style_user = "bold cyan";
        style_root = "bold purple";
        format = "[$user]($style)";
      };
      directory = {
        truncation_symbol = "…/";
        truncation_length = 2;
        style = "bold blue";
        read_only = "!";
        read_only_style = "red";
        format = "[$read_only]($read_only_style)[$path]($style)";
      };
      git_branch = {
        style = "blue";
        format = ''[$branch]($style)'';
      };
      git_state = {
        style = "blue";
        format = "[|$state($progress_current/$progress_total)]($style)";
      };
      status = {
        disabled = false;
        format = "[$status]($style)";
        style = "bold red";
      };
      character = rec {
        success_symbol = "[\\$](bold yellow)";
        error_symbol = success_symbol;
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
