{ ... }:

{
  imports = [
    ./conf.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
