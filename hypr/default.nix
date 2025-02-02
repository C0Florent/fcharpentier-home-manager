{ ... }:

{
  imports = [
    ./conf.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
