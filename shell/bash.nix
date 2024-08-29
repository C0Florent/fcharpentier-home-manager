{
  programs.bash = {
    enable = true;

    shellAliases = {
      cfgview = "cfg $SHELL";
      cfgedit = "cfg \"sudo su\"";

      "²" = "true";
    };

    bashrcExtra = ''
      source ${builtins.toPath ./bash_functions.sh}
      unmute
    '';
  };
}
