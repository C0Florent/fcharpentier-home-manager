{ ... }:

{
  imports = [
    ./conf.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./monitors.nix
    ./animations.nix
    ./dwindle.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    systemd.variables = [ "--all" ];
  };
}
