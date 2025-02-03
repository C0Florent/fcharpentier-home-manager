{ pkgs, lib, config, ... }:

let
  lmb = "mouse:272";
  rmb = "mouse:273";
in

{
  imports = [
    ./fn_keys.nix
  ];

  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";

      general = {
        # Hacky hard-coded night owl gradient (cyan-blue-magenta)
        "col.active_border" = "rgb(7fdbca) rgb(82aaff) rgb(c792ea) 45deg";

        no_focus_fallback = true;
        resize_on_border = true;
        border_size = 2;
      };

      decoration = {
        rounding = 8;
      };

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

        "$mainMod + CTRL, X, exec, uwsm stop"
      ];

      input = {
        kb_layout = "fr";
        kb_variant = "oss";
        numlock_by_default = true;

        repeat_delay = 180;
        repeat_rate = 30;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_min_fingers = true;
      };
    };
  };
}
