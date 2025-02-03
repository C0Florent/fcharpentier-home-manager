{ ... }:

{
  imports = [
    ./conf.nix
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
