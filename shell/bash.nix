{
  programs.bash = {
    enable = true;

    shellAliases = {
      cfgview = "cfg $SHELL";
      cfgedit = "cfg \"sudo --preserve-env=SHLVL su\"";

      "²" = "true";

      ga = "git add";
      gcm = "git commit -m";
      gcam = "git commit -am";
      gp = "git push";
      gpl = "git pull";
      gcl = "git clone";
      gs = "git status";
      gr = "git restore";
      grs = "git restore --staged";
      gst = "git stash push";
      gstp = "git stash pop";
      gl = "git log";
      gpf = "git push --force-with-lease";
      gpff = "git push --force";
      gd = "git diff";
    };

    bashrcExtra = ''
      source ${builtins.toPath ./bash_functions.sh}
      unmute
    '';
  };
}
