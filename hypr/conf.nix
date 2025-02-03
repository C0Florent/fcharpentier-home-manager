{ pkgs, lib, config, ... }:

let
  terminal = "${pkgs.alacritty}/bin/alacritty";
  lmb = "mouse:272";
  rmb = "mouse:273";
in

{
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";

      bindm = [
        # Allow actions to be performed with LMB or ALT for touchpad control
        "$mainMod, ${lmb}, movewindow"
        "$mainMod, ALT_L,  movewindow"

        "$mainMod + CTRL, ${lmb}, resizewindow"
        "$mainMod + CTRL, ALT_L,  resizewindow"
        "$mainMod, ${rmb}, resizewindow"
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

        "$mainMod, Q, exec, alacritty"
        "$mainMod, W, exec, firefox"
        "$mainMod, C, killactive"

        "$mainMod + CTRL, X, exit"
      ];

      input = {
        kb_layout = "fr";
        kb_variant = "oss";
        numlock_by_default = true;

        repeat_delay = 180;
        repeat_rate = 30;

        touchpad = {
        };
      };
    };
  };
}
