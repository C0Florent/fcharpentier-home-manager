{ pkgs, lib, config, ... }:

let
  terminal = "${pkgs.alacritty}/bin/alacritty";
in

{
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";

      bindm = let
        # We define the key triggering mouse drag events to
        # to either left click or left-ALT (for touchpad use)
        drag = "mouse:272&ALT_L";
      in [
        # Allow actions to be performed with LMB or ALT for touchpad control
        "$mainMod, ${drag}, movewindow"
        "$mainMod + CTRL, ${drag}, resizewindow"
      ];

      bind = let
        left  = "h";
        down  = "j";
        up    = "k";
        right = "l";
      in [
        "$mainMod, ${left},  movefocus, l"
        "$mainMod, ${down},  movefocus, d"
        "$mainMod, ${up},    movefocus, u"
        "$mainMod, ${right}, movefocus, r"

        "$mainMod, T, exec, alacritty"
        "$mainMod, W, exec, firefox"
        "$mainMod, C, killactive"

        "$mainMod + ALT, X, exit"
      ];

      input = {
        kb_layout = "fr";
        kb_variant = "oss";
        numlock_by_default = true;

        repeat_delay = 180;
        repeat_rate = 20;

        touchpad = {
        };
      };
    };
  };
}
