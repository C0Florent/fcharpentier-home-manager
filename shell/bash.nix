{
  programs.bash = {
    enable = true;

    shellAliases = {
      cfgview = "cfg $SHELL";
      cfgedit = "cfg \"sudo --preserve-env=SHLVL su\"";

      hm = "home-manager";
      hms = "home-manager switch";

      "²" = "true";

      ga = "git add";
      gc = "git commit";
      gcm = "git commit -m";
      gcam = "git commit -am";
      gp = "git push";
      gpl = "git pull";
      gcl = "git clone";
      gs = "git status";
      gr = "git restore";
      grs = "git restore --staged";
      gst = "git stash";
      gstp = "git stash pop";
      gl = "git log";
      gpf = "git push --force-with-lease";
      gpff = "git push --force";
      gd = "git diff";
      gb = "git branch";
      # gsw = "git switch"; I made gsw a script in gsw.nix
      gswc = "git switch -c";
      gm = "git merge";
      gf = "git fetch";
      grb = "git rebase";
      grbc = "git rebase --continue";

      ghcl = "ghcl -L 500";
      ghcle = "ghcl EpitechPromo2027";

      lg = "lazygit";
    };

    bashrcExtra = ''
      source ${builtins.toPath ./bash_functions.sh}
      unmute
    '';
  };
}
