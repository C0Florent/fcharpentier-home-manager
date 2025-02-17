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
      "$launchApp" = "uwsm app --";

      general = {
        # Hacky hard-coded night owl gradient (cyan-blue-magenta)
        "col.active_border" = "rgb(7fdbca) rgb(82aaff) rgb(c792ea) 45deg";

        gaps_in = 4;
        gaps_out = 12;

        no_focus_fallback = true;
        resize_on_border = true;
        border_size = 2;
      };

      decoration = {
        rounding = 8;
      };

      bindm = [
        # Allow actions to be performed with LMB or SPACE for touchpad control
        "$mainMod, ${lmb}, movewindow"
        "$mainMod, SPACE,  movewindow"

        "$mainMod + ALT, ${lmb}, resizewindow"
        "$mainMod + ALT, SPACE,  resizewindow"
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

        "$mainMod + CTRL, ${left},  movetoworkspace, -1"
        "$mainMod + CTRL, ${right}, movetoworkspace, +1"

        "$mainMod, Q, exec, $launchApp alacritty"
        "$mainMod, W, exec, $launchApp firefox"
        "$mainMod, C, killactive"

        "$mainMod + CTRL, X, exec, uwsm stop"

        "$mainMod, Escape, exec, hyprlock"
      ];

      input = {
        kb_layout = "fr";
        kb_variant = "oss";
        numlock_by_default = true;

        repeat_delay = 180;
        repeat_rate = 30;

        touchpad = {
          disable_while_typing = false;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_min_fingers = true;
        workspace_swipe_distance = 200;
      };

      misc = {
        disable_hyprland_logo = true;
      };
    };
  };
}
