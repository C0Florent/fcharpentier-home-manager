{ ... }:

{
  imports = [
    ./conf.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./monitors.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    systemd.variables = [ "--all" ];
  };
}
