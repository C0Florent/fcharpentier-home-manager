{ pkgs, ... }:

{
  programs.lazygit = {

    enable = true;

    settings = {
      git.parseEmoji = true;
    };

  };
}
